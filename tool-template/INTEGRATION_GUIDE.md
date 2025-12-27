# Integration Guide for {{TOOL_NAME}}

This guide shows how to integrate your new tool with the SDAC Bundle.

## Step 1: Add to Main CLI

Edit `sdac-bundle/sdac_bundle/cli/commands.py`:

```python
# Add import
from sdac_bundle.integrations.{{TOOL_MODULE}} import {{TOOL_CLASS}}Integration

# Add command group
@click.group()
def {{TOOL_NAME}}_group():
    """{{TOOL_NAME_TITLE}} commands."""
    pass

@{{TOOL_NAME}}_group.command()
@click.option("--option", help="Option")
def command(option):
    """Your tool command."""
    console.print("[cyan]Running {{TOOL_NAME}}...[/cyan]")
    # Integration logic
    console.print("[green]✓[/green] Done")

# Register in main CLI (in main.py)
cli.add_command({{TOOL_NAME}}_group)
```

## Step 2: Add Configuration

Edit `sdac-bundle/sdac_bundle/core/config.py`:

```python
class {{TOOL_CLASS}}Config(BaseModel):
    """{{TOOL_NAME_TITLE}} configuration."""
    setting1: str = "default"
    setting2: int = 100

class SDACConfig(BaseSettings):
    # ... existing config ...
    {{TOOL_NAME}}: {{TOOL_CLASS}}Config = Field(default_factory={{TOOL_CLASS}}Config)
```

## Step 3: Update Documentation

1. Add to `sdac-bundle/README.md` component table
2. Add to `sdac-bundle/COMPONENTS.md`
3. Update `.github/profile/README.md`

## Step 4: Create Integration Module (Optional)

Create `sdac-bundle/sdac_bundle/integrations/{{TOOL_MODULE}}.py`:

```python
"""Integration for {{TOOL_NAME}}."""

from typing import Optional
from sdac_bundle.core.config import SDACConfig


class {{TOOL_CLASS}}Integration:
    """Integration wrapper for {{TOOL_NAME}}."""
    
    def __init__(self, config: Optional[SDACConfig] = None):
        self.config = config or SDACConfig()
        self.tool_config = self.config.{{TOOL_NAME}}
    
    def execute(self, command: str, **kwargs):
        """Execute tool command."""
        # Integration logic
        pass
```

## Step 5: Update Status Command

Edit `sdac-bundle/sdac_bundle/cli/main.py`:

```python
@cli.command()
def status():
    """Show status of all integrated components."""
    # Add your tool to the components list
    components = [
        # ... existing components ...
        ("{{TOOL_NAME_TITLE}}", "✅", "./{{TOOL_NAME}}"),
    ]
```

## Checklist

- [ ] Added to main CLI
- [ ] Configuration integrated
- [ ] Documentation updated
- [ ] Status command updated
- [ ] Integration module created (if needed)
- [ ] Tests for integration
- [ ] Examples provided

