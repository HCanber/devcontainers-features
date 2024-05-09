# Dev Container Features

<!-- START_FEATURE_LIST -->
<!-- END_FEATURE_LIST -->


# Developing Features

Open this repository in VSCode and opt-in to opening the workspace in a dev container.  This will provide a consistent development environment for all Features.

## Adding a new Feature
Add a folder under [src/](src/) with the name of the Feature. The folder should contain at least a `devcontainer-feature.json` and an entrypoint script `install.sh`.

Add a folder under [test/](test/) with the name of the Feature. The folder should contain at least a `scenarios.json` and a test script `test.sh`.

Add the Feature to [.github/workflows/test.yaml](.github/workflows/test.yaml)

Note that README-md files are updated automatically

## Running tests
In VSCode open a [terminal](https://code.visualstudio.com/docs/terminal/basics) and execute:

``` sh
devcontainer features test
```

To test a specific Feature, use the `--feature` / `-f` flag:

``` sh
devcontainer features test -f zig
```

Optionally specify the base image to use using the `--base-image ` / `-i` flag:

``` sh
devcontainer features test -f zig -i mcr.microsoft.com/devcontainers/base:jammy
```

For more info see https://github.com/devcontainers/cli/blob/main/docs/features/test.md#dev-container-features-test-lib

## Repo and Feature Structure

Similar to the [`devcontainers/features`](https://github.com/devcontainers/features) repo, this repository has a `src` folder.  Each Feature has its own sub-folder, containing at least a `devcontainer-feature.json` and an entrypoint script `install.sh`.

```
├── src
│   ├── zig
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
|   ├── ...
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
├── test
│   ├── zig
│   │   ├── scenarios.json
│   │   └── test.sh
|   ├── ...
│   │   ├── scenarios.json
│   │   └── test.sh
...
```

## Distributing Features

### Versioning

Features are individually versioned by the `version` attribute in a Feature's `devcontainer-feature.json`.  Features are versioned according to the semver specification. More details can be found in [the dev container Feature specification](https://containers.dev/implementors/features/#versioning).

### Publishing

This repo contains a **GitHub Action** [workflow](.github/workflows/release.yaml) that will publish each Feature to GHCR.

_Allow GitHub Actions to create and approve pull requests_ should be enabled in the repository's `Settings > Actions > General > Workflow permissions` for auto generation of `src/<feature>/README.md` per Feature (which merges any existing `src/<feature>/NOTES.md`).

By default, each Feature will be prefixed with the `<owner/<repo>` namespace.  For example, the Features in this repository can be referenced in a `devcontainer.json` with:

```
ghcr.io/<owner/<repo>/<featureName>:1
```

The provided GitHub Action will also publish a third "metadata" package with just the namespace, eg: `ghcr.io/<owner/<repo>`.  This contains information useful for tools aiding in Feature discovery.

'`<owner/<repo>`' is known as the feature collection namespace.

### Marking Feature Public

Note that by default, GHCR packages are marked as `private`.  To stay within the free tier, Features need to be marked as `public`.

This can be done by navigating to the Feature's "package settings" page in GHCR, and setting the visibility to 'public`.  The URL may look something like:

```
https://github.com/users/<owner>/packages/container/<repo>%2F<featureName>/settings
```

<img width="669" alt="image" src="https://user-images.githubusercontent.com/23246594/185244705-232cf86a-bd05-43cb-9c25-07b45b3f4b04.png">

### Adding Features to the Index

For Features to appear in [public index](https://containers.dev/features), so that other community members can find them, do the following:

* Go to [github.com/devcontainers/devcontainers.github.io](https://github.com/devcontainers/devcontainers.github.io)
  * This is the GitHub repo backing the [containers.dev](https://containers.dev/) spec site
* Open a PR to modify the [collection-index.yml](https://github.com/devcontainers/devcontainers.github.io/blob/gh-pages/_data/collection-index.yml) file

This index is from where [supporting tools](https://containers.dev/supporting) like [VS Code Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) and [GitHub Codespaces](https://github.com/features/codespaces) surface Features for their dev container creation UI.

#### Using private Features in Codespaces

For any Features hosted in GHCR that are kept private, the `GITHUB_TOKEN` access token in your environment will need to have `package:read` and `contents:read` for the associated repository.

Many implementing tools use a broadly scoped access token and will work automatically.  GitHub Codespaces uses repo-scoped tokens, and therefore you'll need to add the permissions in `devcontainer.json`

An example `devcontainer.json` can be found below.

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
     "ghcr.io/my-org/private-features/hello:1": {
            "greeting": "Hello"
        }
    },
    "customizations": {
        "codespaces": {
            "repositories": {
                "my-org/private-features": {
                    "permissions": {
                        "packages": "read",
                        "contents": "read"
                    }
                }
            }
        }
    }
}
```