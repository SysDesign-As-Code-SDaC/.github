# Tool Template Directory

This directory contains template files and scripts for quickly creating new tools in the SDAC Bundle.

## 📋 Contents

- **Templates**: Ready-to-use template files for new tools
- **Quick Start Script**: Automated tool creation script
- **Integration Guide**: How to integrate with the main bundle

## 🚀 Quick Start

### Option 1: Use the Quick Start Script

```bash
cd /Users/jimmy/Documents/Repos/Private_Repos/SysDesignAsCode/.github/tool-template
./QUICK_START.sh my-new-tool "Description of my tool"
```

This will:
- Create the directory structure
- Generate all necessary files
- Initialize git repository
- Set up basic configuration

### Option 2: Manual Setup

1. Follow [ADDING_NEW_TOOL.md](../ADDING_NEW_TOOL.md)
2. Copy templates from this directory
3. Replace placeholders:
   - `{{TOOL_NAME}}` → your-tool-name
   - `{{TOOL_NAME_TITLE}}` → Your Tool Name
   - `{{TOOL_MODULE}}` → your_tool_name
   - `{{TOOL_CLASS}}` → YourToolName
   - `{{TOOL_DESCRIPTION}}` → description

## 📁 Template Files

- `pyproject.toml.template` - Python package configuration
- `README.md.template` - Component README
- `cli.py.template` - CLI implementation
- `__init__.py.template` - Package initialization
- `.gitignore.template` - Git ignore rules
- `test_template.py.template` - Test structure
- `INTEGRATION_GUIDE.md` - Integration instructions

## 🔧 Placeholders

All templates use these placeholders that need to be replaced:

| Placeholder | Description | Example |
|------------|-------------|---------|
| `{{TOOL_NAME}}` | Kebab-case tool name | `code-analysis` |
| `{{TOOL_NAME_TITLE}}` | Title case name | `Code Analysis` |
| `{{TOOL_MODULE}}` | Snake_case module name | `code_analysis` |
| `{{TOOL_CLASS}}` | PascalCase class name | `CodeAnalysis` |
| `{{TOOL_DESCRIPTION}}` | Tool description | `Code analysis and metrics tool` |
| `{{TOOL_PURPOSE}}` | Purpose statement | `Analyze code quality and metrics` |

## 📚 Documentation

- See [ADDING_NEW_TOOL.md](../ADDING_NEW_TOOL.md) for complete guide
- See [INTEGRATION_GUIDE.md](INTEGRATION_GUIDE.md) for integration steps
- See [CONTRIBUTING.md](../CONTRIBUTING.md) for contribution guidelines

## ✅ Checklist

After using templates:

- [ ] Replace all placeholders
- [ ] Update README with actual features
- [ ] Implement core functionality
- [ ] Write tests
- [ ] Integrate with main CLI
- [ ] Add configuration
- [ ] Update documentation

