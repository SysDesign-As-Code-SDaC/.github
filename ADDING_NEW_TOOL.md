# Adding a New Tool to SDAC Bundle

This guide provides a step-by-step template for adding a new tool/component to the SysDesign-As-Code bundle collection.

## 📋 Prerequisites

Before adding a new tool, ensure:

- [ ] Tool solves a clear problem in the coding agent ecosystem
- [ ] Tool integrates with existing components
- [ ] Tool follows SDAC architecture principles
- [ ] Tool has clear value proposition

## 🏗️ Step-by-Step Template

### Step 1: Create Component Directory

```bash
cd /Users/jimmy/Documents/Repos/Private_Repos/SysDesignAsCode/sdac-bundle
mkdir -p your-tool-name
cd your-tool-name
git init
```

### Step 2: Project Structure

Create the following structure:

```
your-tool-name/
├── README.md                    # Component documentation
├── pyproject.toml              # Python package config (if Python)
├── package.json                # Node package config (if Node)
├── LICENSE                     # MIT License
├── .gitignore                  # Git ignore rules
├── src/
│   └── your_tool/
│       ├── __init__.py
│       ├── cli.py              # CLI interface
│       ├── core/               # Core functionality
│       └── utils/              # Utilities
├── tests/                       # Test suite
│   ├── __init__.py
│   └── test_core.py
├── examples/                    # Usage examples
└── docs/                        # Additional documentation
```

### Step 3: Project Configuration

#### Python Tool (`pyproject.toml`)

```toml
[build-system]
requires = ["setuptools>=68.0", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "sdac-your-tool-name"
version = "1.0.0"
description = "Description of your tool"
readme = "README.md"
requires-python = ">=3.9"
license = {text = "MIT"}
dependencies = [
    "pydantic>=2.0.0",
    "click>=8.1.0",
    "rich>=13.0.0",
]

[project.scripts]
sdac-your-tool = "your_tool.cli:main"

[tool.setuptools]
packages = ["your_tool"]
```

#### Node.js Tool (`package.json`)

```json
{
  "name": "@sdac/your-tool-name",
  "version": "1.0.0",
  "description": "Description of your tool",
  "main": "src/index.js",
  "bin": {
    "sdac-your-tool": "./bin/cli.js"
  },
  "scripts": {
    "test": "jest",
    "lint": "eslint .",
    "build": "tsc"
  },
  "dependencies": {
    "commander": "^11.0.0"
  },
  "devDependencies": {
    "@types/node": "^20.0.0",
    "jest": "^29.0.0",
    "typescript": "^5.0.0"
  }
}
```

### Step 4: CLI Implementation

#### Python CLI Template

```python
"""CLI for your tool."""

import click
from rich.console import Console

console = Console()


@click.group()
def main():
    """Your tool CLI."""
    pass


@main.command()
@click.option("--option", help="Example option")
@click.argument("input")
def command(option, input):
    """Example command."""
    console.print(f"[cyan]Processing: {input}[/cyan]")
    # Your implementation here
    console.print("[green]✓[/green] Complete")


if __name__ == "__main__":
    main()
```

### Step 5: Integration with Main CLI

Add your tool to the main `sdac` CLI:

#### Update `sdac_bundle/cli/commands.py`

```python
# Add import
from sdac_bundle.integrations.your_tool import YourToolIntegration

# Add command group
@click.group()
def your_tool_group():
    """Your tool commands."""
    pass

@your_tool_group.command()
@click.option("--option", help="Option")
def command(option):
    """Your tool command."""
    console.print("[cyan]Running your tool...[/cyan]")
    # Integration logic
    console.print("[green]✓[/green] Done")

# Register in main CLI
cli.add_command(your_tool_group)
```

### Step 6: Configuration Integration

#### Update `sdac_bundle/core/config.py`

```python
class YourToolConfig(BaseModel):
    """Your tool configuration."""
    setting1: str = "default"
    setting2: int = 100

class SDACConfig(BaseSettings):
    # ... existing config ...
    your_tool: YourToolConfig = Field(default_factory=YourToolConfig)
```

#### Update `.sdac/config.yaml` template

```yaml
your_tool:
  setting1: "value"
  setting2: 100
```

### Step 7: Documentation

#### README.md Template

```markdown
# Your Tool Name

**Purpose**: Brief description of what your tool does

## Status

✅ **Production Ready** | 🚧 **In Development** | 📋 **Planned**

## Features

- Feature 1
- Feature 2
- Feature 3

## Installation

\`\`\`bash
pip install -e .
# or
npm install
\`\`\`

## Usage

\`\`\`bash
# Via SDAC CLI
sdac your-tool command --option value

# Direct usage
sdac-your-tool command --option value
\`\`\`

## Integration

This component integrates with:
- **Component 1** - Integration description
- **Component 2** - Integration description

## Examples

\`\`\`python
# Example code
from your_tool import YourTool

tool = YourTool()
result = tool.process()
\`\`\`

## Configuration

See `.sdac/config.yaml` for configuration options.

## Contributing

See [CONTRIBUTING.md](../../.github/CONTRIBUTING.md)
```

### Step 8: Testing

#### Test Template

```python
"""Tests for your tool."""

import pytest
from your_tool import YourTool


def test_basic_functionality():
    """Test basic functionality."""
    tool = YourTool()
    result = tool.process("input")
    assert result is not None


def test_cli_command():
    """Test CLI command."""
    from click.testing import CliRunner
    from your_tool.cli import main
    
    runner = CliRunner()
    result = runner.invoke(main, ["command", "input"])
    assert result.exit_code == 0
```

### Step 9: Update Main Bundle

#### Update `sdac-bundle/README.md`

Add your tool to the component table:

```markdown
| **Your Tool** | [your-tool-name](./your-tool-name) | Description |
```

#### Update `sdac-bundle/COMPONENTS.md`

Add your tool to the components list with integration details.

### Step 10: Create GitHub Repository

```bash
# Create repository in organization
gh repo create SysDesign-As-Code-SDaC/your-tool-name \
  --public \
  --source=your-tool-name \
  --remote=origin \
  --push
```

### Step 11: Update Organization Profile

Update `.github/profile/README.md` to include your new tool in the ecosystem overview.

## ✅ Checklist

Use this checklist when adding a new tool:

### Structure
- [ ] Component directory created
- [ ] Project structure follows template
- [ ] Configuration files (pyproject.toml/package.json) created
- [ ] README.md with comprehensive documentation
- [ ] LICENSE file (MIT)
- [ ] .gitignore configured

### Implementation
- [ ] Core functionality implemented
- [ ] CLI interface created
- [ ] Integration with main `sdac` CLI
- [ ] Configuration system integrated
- [ ] Error handling implemented
- [ ] Logging configured

### Testing
- [ ] Unit tests written
- [ ] Integration tests (if applicable)
- [ ] Tests pass locally
- [ ] Test coverage acceptable (>80%)

### Documentation
- [ ] README.md complete
- [ ] Usage examples provided
- [ ] API documentation (if applicable)
- [ ] Integration guide written
- [ ] Updated main bundle README
- [ ] Updated COMPONENTS.md

### Integration
- [ ] Added to main CLI commands
- [ ] Configuration added to config system
- [ ] Listed in organization profile
- [ ] Added to component status

### GitHub
- [ ] Repository created in organization
- [ ] Initial commit pushed
- [ ] Branch protection configured (optional)
- [ ] CI workflow working
- [ ] Dependabot configured

## 📝 Example: Adding a New Tool

Here's a complete example of adding a "code-analysis" tool:

### 1. Create Structure

```bash
mkdir -p code-analysis/src/code_analysis/{core,utils} tests examples
```

### 2. Create `pyproject.toml`

```toml
[project]
name = "sdac-code-analysis"
version = "1.0.0"
description = "Code analysis and metrics tool"
# ... rest of config
```

### 3. Implement CLI

```python
# src/code_analysis/cli.py
@click.group()
def main():
    """Code analysis CLI."""
    pass

@main.command()
@click.argument("target")
def analyze(target):
    """Analyze code metrics."""
    # Implementation
```

### 4. Integrate with Main CLI

```python
# sdac_bundle/cli/commands.py
@click.group()
def analysis_group():
    """Code analysis commands."""
    pass

cli.add_command(analysis_group)
```

### 5. Add Configuration

```python
# sdac_bundle/core/config.py
class CodeAnalysisConfig(BaseModel):
    metrics_enabled: bool = True
    complexity_threshold: int = 10
```

### 6. Document

Create comprehensive README.md following the template above.

## 🔗 Integration Points

Your tool should integrate with:

1. **Unified CLI** - Add commands to `sdac` CLI
2. **Configuration** - Use unified config system
3. **Other Components** - Integrate with existing tools
4. **MCP Servers** - Provide MCP interface if applicable
5. **Documentation** - Follow documentation standards

## 🎯 Best Practices

1. **Follow Naming Conventions**
   - Python: `sdac-tool-name` (kebab-case)
   - Package: `sdac_tool_name` (snake_case)
   - CLI: `sdac-tool-name` command

2. **Consistent Structure**
   - Follow the template structure
   - Use similar patterns as existing tools
   - Maintain consistency across components

3. **Error Handling**
   - Use Rich for output
   - Provide clear error messages
   - Handle edge cases gracefully

4. **Testing**
   - Write tests for all functionality
   - Aim for >80% coverage
   - Include integration tests

5. **Documentation**
   - Clear README
   - Usage examples
   - API documentation
   - Integration guide

## 📚 Reference Examples

Look at existing tools for reference:

- **contract-testing** - Contract testing integration
- **api-contracts** - API management
- **security-scanning** - Security tools
- **test-automation** - Test generation

## 🆘 Getting Help

- Check existing tools for patterns
- Review [CONTRIBUTING.md](CONTRIBUTING.md)
- Ask in GitHub Discussions
- Open an issue for questions

## 🚀 Quick Start Template

Copy this template to get started quickly:

```bash
# 1. Create directory
mkdir your-tool-name && cd your-tool-name

# 2. Initialize git
git init

# 3. Copy template files
# (Use the templates above)

# 4. Install dependencies
pip install -e ".[dev]"

# 5. Start implementing
# Follow the checklist above
```

---

**Ready to add your tool? Follow this template and checklist!**

