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