# Contributing to SysDesign-As-Code

Thank you for your interest in contributing! This document provides guidelines for contributing to the SysDesign-As-Code ecosystem.

## 🎯 Getting Started

1. **Fork the repository** you want to contribute to
2. **Clone your fork** locally
3. **Create a branch** for your changes: `git checkout -b feature/your-feature-name`
4. **Make your changes** following our guidelines
5. **Test your changes** thoroughly
6. **Submit a pull request**

## 📋 Development Setup

### Prerequisites

- Python 3.9+
- Node.js 20+
- Git
- (Optional) Docker for containerized services

### Setup

```bash
# Clone the repository
git clone https://github.com/SysDesign-As-Code-SDaC/[repo-name].git
cd [repo-name]

# Install dependencies
# For Python projects
pip install -e ".[dev]"

# For Node.js projects
npm install

# Run tests
pytest  # or npm test
```

## 🔀 Branch Strategy

### Branch Naming

- `feature/description` - New features
- `fix/description` - Bug fixes
- `docs/description` - Documentation updates
- `refactor/description` - Code refactoring
- `test/description` - Test additions/updates

### Workflow

1. Create a branch from `main` or `dev`
2. Make your changes
3. Ensure all tests pass
4. Update documentation if needed
5. Submit a pull request

## 💻 Code Standards

### Python

- Follow [PEP 8](https://pep8.org/)
- Use type hints
- Maximum line length: 100 characters
- Use `black` for formatting
- Use `ruff` for linting
- Use `mypy` for type checking

```bash
# Format code
black .

# Lint code
ruff check .

# Type check
mypy .
```

### TypeScript/JavaScript

- Follow [Airbnb Style Guide](https://github.com/airbnb/javascript)
- Use ESLint
- Use Prettier for formatting
- Maximum line length: 100 characters

```bash
# Format code
npm run format

# Lint code
npm run lint
```

### Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
type(scope): subject

body (optional)

footer (optional)
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Formatting
- `refactor`: Code refactoring
- `test`: Tests
- `chore`: Maintenance

Examples:
```
feat(contract-testing): add Pact broker integration
fix(api-contracts): resolve OpenAPI validation issue
docs(sdac-bundle): update getting started guide
```

## 🧪 Testing

### Requirements

- All new features must include tests
- Maintain or improve test coverage
- Tests must pass before submitting PR

### Running Tests

```bash
# Python
pytest --cov=. --cov-report=html

# Node.js
npm test
npm run test:coverage
```

## 📝 Documentation

### Requirements

- Update README.md if adding features
- Add docstrings to all public functions/classes
- Update CHANGELOG.md for user-facing changes
- Include examples for new features

### Documentation Style

- Use clear, concise language
- Include code examples
- Add diagrams for complex concepts
- Keep documentation up-to-date

## 🔍 Code Review Process

1. **Submit PR** with clear description
2. **Wait for review** - maintainers will review within 48 hours
3. **Address feedback** - make requested changes
4. **Get approval** - at least one maintainer approval required
5. **Merge** - maintainers will merge after approval

### Review Checklist

- [ ] Code follows style guidelines
- [ ] Tests are included and passing
- [ ] Documentation is updated
- [ ] No breaking changes (or documented)
- [ ] Security considerations addressed

## 🐛 Reporting Bugs

Use the [Bug Report template](.github/ISSUE_TEMPLATE/bug_report.yml) and include:

- Clear description
- Steps to reproduce
- Expected vs actual behavior
- Environment details
- Relevant logs/errors

## ✨ Suggesting Features

Use the [Feature Request template](.github/ISSUE_TEMPLATE/feature_request.yml) and include:

- Problem statement
- Proposed solution
- Alternatives considered
- Use cases

## 🔒 Security

- **Never** commit secrets or credentials
- Report security vulnerabilities privately (see [SECURITY.md](SECURITY.md))
- Follow security best practices
- Use security scanning tools

## 📚 Resources

- [Project Documentation](https://github.com/SysDesign-As-Code-SDaC/sdac-bundle)
- [Code of Conduct](CODE_OF_CONDUCT.md)
- [Security Policy](SECURITY.md)
- [Issue Templates](.github/ISSUE_TEMPLATE/)

## 🤝 Getting Help

- **Discussions**: Use GitHub Discussions for questions
- **Issues**: Use GitHub Issues for bugs and features
- **Documentation**: Check component-specific README files

## 🙏 Recognition

Contributors will be:
- Listed in CONTRIBUTORS.md
- Credited in release notes
- Acknowledged in documentation

Thank you for contributing to SysDesign-As-Code! 🎉

