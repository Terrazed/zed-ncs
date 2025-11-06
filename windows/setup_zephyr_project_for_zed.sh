#!/usr/bin/env bash
#
# AI GENERATED SCRIPT
#
# Script to generate a .clangd file based on the project name in CMakeLists.txt
# Usage: ./generate_clangd.sh /path/to/project

set -e  # exit on error

# Check that a path is provided
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/project"
    exit 1
fi

PROJECT_DIR="$1"
CMAKE_FILE="$PROJECT_DIR/CMakeLists.txt"

# Check that CMakeLists.txt exists
if [ ! -f "$CMAKE_FILE" ]; then
    echo "Error: CMakeLists.txt not found in $PROJECT_DIR."
    exit 1
fi

# Extract the project name from the CMakeLists.txt
PROJECT_NAME=$(sed -n 's/^[[:space:]]*project[[:space:]]*(\([A-Za-z0-9_-]\+\)).*/\1/p' "$CMAKE_FILE" | head -n1)

if [ -z "$PROJECT_NAME" ]; then
    echo "Could not find project name in $CMAKE_FILE"
    exit 1
fi

echo "Found project name: $PROJECT_NAME"

# Generate the .clangd file in the project directory
CLANGD_FILE="$PROJECT_DIR/.clangd"
cat > "$CLANGD_FILE" <<EOF
CompileFlags:
  CompilationDatabase: build/$PROJECT_NAME
  Remove: [-fno-printf-return-value, -mfp16-format=ieee, -fno-reorder-functions]
Diagnostics:
  Suppress: [unknown-argument]
EOF

echo "Created .clangd file at $CLANGD_FILE with CompilationDatabase: build/$PROJECT_NAME"
