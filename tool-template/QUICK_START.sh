#!/bin/bash
# Quick start script for creating a new SDAC tool
# Usage: ./QUICK_START.sh tool-name "Tool Description"

set -e

TOOL_NAME=$1
TOOL_DESCRIPTION=$2

if [ -z "$TOOL_NAME" ] || [ -z "$TOOL_DESCRIPTION" ]; then
    echo "Usage: $0 tool-name 'Tool Description'"
    exit 1
fi

# Convert tool name to various formats
TOOL_NAME_SNAKE=$(echo $TOOL_NAME | tr '-' '_')
TOOL_NAME_TITLE=$(echo $TOOL_NAME | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++)sub(/./,toupper(substr($i,1,1)),$i)}1')
TOOL_MODULE=$TOOL_NAME_SNAKE
TOOL_CLASS=$(echo $TOOL_NAME_TITLE | sed 's/ //g')

echo "Creating tool: $TOOL_NAME"
echo "Description: $TOOL_DESCRIPTION"
echo "Module: $TOOL_MODULE"
echo "Class: $TOOL_CLASS"

# Create directory structure
mkdir -p $TOOL_NAME/src/$TOOL_MODULE/{core,utils} tests examples docs

# Copy and process templates
cd $TOOL_NAME

# Process pyproject.toml
sed -e "s/{{TOOL_NAME}}/$TOOL_NAME/g" \
    -e "s/{{TOOL_DESCRIPTION}}/$TOOL_DESCRIPTION/g" \
    -e "s/{{TOOL_MODULE}}/$TOOL_MODULE/g" \
    ../tool-template/pyproject.toml.template > pyproject.toml

# Process README.md
sed -e "s/{{TOOL_NAME}}/$TOOL_NAME/g" \
    -e "s/{{TOOL_NAME_TITLE}}/$TOOL_NAME_TITLE/g" \
    -e "s/{{TOOL_DESCRIPTION}}/$TOOL_DESCRIPTION/g" \
    -e "s/{{TOOL_MODULE}}/$TOOL_MODULE/g" \
    -e "s/{{TOOL_CLASS}}/$TOOL_CLASS/g" \
    -e "s/{{TOOL_PURPOSE}}/$TOOL_DESCRIPTION/g" \
    ../tool-template/README.md.template > README.md

# Process CLI
sed -e "s/{{TOOL_NAME}}/$TOOL_NAME/g" \
    -e "s/{{TOOL_NAME_TITLE}}/$TOOL_NAME_TITLE/g" \
    -e "s/{{TOOL_MODULE}}/$TOOL_MODULE/g" \
    ../tool-template/cli.py.template > src/$TOOL_MODULE/cli.py

# Process __init__.py
sed -e "s/{{TOOL_DESCRIPTION}}/$TOOL_DESCRIPTION/g" \
    ../tool-template/__init__.py.template > src/$TOOL_MODULE/__init__.py

# Copy gitignore
cp ../tool-template/.gitignore.template .gitignore

# Process test template
sed -e "s/{{TOOL_NAME}}/$TOOL_NAME/g" \
    -e "s/{{TOOL_MODULE}}/$TOOL_MODULE/g" \
    -e "s/{{TOOL_CLASS}}/$TOOL_CLASS/g" \
    ../tool-template/test_template.py.template > tests/test_${TOOL_MODULE}.py

# Create empty __init__.py files
touch src/$TOOL_MODULE/core/__init__.py
touch src/$TOOL_MODULE/utils/__init__.py
touch tests/__init__.py

# Copy LICENSE
cp ../LICENSE LICENSE 2>/dev/null || echo "MIT License" > LICENSE

# Initialize git
git init
git add .
git commit -m "Initial commit: $TOOL_NAME"

echo ""
echo "✅ Tool structure created!"
echo ""
echo "Next steps:"
echo "1. cd $TOOL_NAME"
echo "2. pip install -e '.[dev]'"
echo "3. Start implementing your tool"
echo "4. Follow ADDING_NEW_TOOL.md for integration"

