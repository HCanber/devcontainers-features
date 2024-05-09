
# Zig (via ziglang.org) (zig)

Zig is a general-purpose programming language and toolchain for maintaining robust, optimal and reusable software.

## Example Usage

```json
"features": {
    "ghcr.io/HCanber/devcontainers-features/zig:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the Zig version you would like to install | string | latest |
| indexUrl | The url to the json containing available versions, should return similiar structure as https://ziglang.org/download/index.json | string | https://ziglang.org/download/index.json |

> This feature was originally copied from  https://github.com/devcontainers-contrib/features/tree/9a1d24b27b2d1ea8916ebe49c9ce674375dced27/src/zig

## Modifications to original
- Added `indexUrl` option to allow for installing Zig from a custom URL
  
  _Example:_
  To use [Mach engine nominated zig versions](https://machengine.org/about/nominated-zig/), set `indexUrl` to `https://machengine.org/zig/index.json`


  ```json
  "features": {
      "ghcr.io/HCanber/devcontainers-features/zig:1": {
        "indexUrl": "https://machengine.org/zig/index.json",
        "version": "2024.3.0-mach"
      }
  }
  ```

---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/HCanber/devcontainers-features/blob/main/src/zig/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
