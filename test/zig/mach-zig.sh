#!/bin/bash

# This test file will be executed against the mach-zig scenario in scenarios.json
# For more info, see https://github.com/devcontainers/cli/blob/main/docs/features/test.md

# Fail on first error
set -e

# Optional: Import test library bundled with the devcontainer CLI, https://github.com/devcontainers/cli/blob/main/docs/features/test.md
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "execute zig version" bash -c "zig version | grep '0.12.0'"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
