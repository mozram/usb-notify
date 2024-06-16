#!/bin/bash

# Check if the first argument exists; if not, use the default value "foo"
preset="${1:-default}"

# Run CMake with the specified preset
cmake --preset "$preset"

# Build the project
cmake --build --preset "$preset"
