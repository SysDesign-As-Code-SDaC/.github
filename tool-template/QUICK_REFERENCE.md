# Quick Reference: Adding a New Tool

## 🚀 Fastest Way

```bash
cd .github/tool-template
./QUICK_START.sh my-tool-name "Tool description"
```

## 📋 Manual Steps

1. **Create structure**
   ```bash
   mkdir -p my-tool/src/my_tool/{core,utils} tests examples
   ```

2. **Copy templates**
   ```bash
   cp tool-template/*.template my-tool/
   # Replace {{PLACEHOLDERS}} in all files
   ```

3. **Install & develop**
   ```bash
   cd my-tool
   pip install -e ".[dev]"
   ```

4. **Integrate with main CLI**
   - Edit `sdac-bundle/sdac_bundle/cli/commands.py`
   - Add command group
   - Register in main CLI

5. **Add configuration**
   - Edit `sdac-bundle/sdac_bundle/core/config.py`
   - Add config class
   - Update config.yaml template

6. **Update documentation**
   - Add to `sdac-bundle/README.md`
   - Add to `sdac-bundle/COMPONENTS.md`
   - Update organization profile

7. **Create repository**
   ```bash
   gh repo create SysDesign-As-Code-SDaC/my-tool \
     --public --source=my-tool --push
   ```

## ✅ Checklist

- [ ] Structure created
- [ ] Templates processed
- [ ] Core functionality implemented
- [ ] CLI working
- [ ] Tests written
- [ ] Integrated with main CLI
- [ ] Configuration added
- [ ] Documentation updated
- [ ] Repository created

## 📚 Full Guide

See [ADDING_NEW_TOOL.md](../ADDING_NEW_TOOL.md) for complete details.

