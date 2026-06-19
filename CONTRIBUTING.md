# Contributing

Thank you for contributing to this template.

The goal of this repository is to provide a consistent foundation for Python package development across the organization.

## Development Principles

When contributing:

* Keep the template lightweight and broadly applicable.
* Avoid introducing project-specific dependencies or workflows.
* Prefer convention and consistency over customization.
* Ensure changes improve the developer experience across multiple use cases.

## Development Setup

Initialize the development environment:

```bash
./initialize.sh
```

Install dependencies:

```bash
uv sync
```

Install pre-commit hooks:

```bash
pre-commit install
```

## Code Quality Requirements

All contributions should:

* Pass all tests
* Pass all linting checks
* Pass all pre-commit hooks
* Maintain compatibility with the supported Python versions
* Include documentation updates when appropriate

Run validation before submitting changes:

```bash
make check
```

## Testing

Run tests using:

```bash
make test
```

or

```bash
uv run pytest
```

## Pull Requests

Before opening a pull request:

1. Ensure all tests pass.
2. Run pre-commit against all files.
3. Update documentation if behavior changes.
4. Add a changelog entry when appropriate.
5. Verify that changes remain generic and reusable.

## Commit Guidelines

Write clear and descriptive commit messages.

Examples:

```text
feat: add support for additional pre-commit hooks
fix: correct container initialization workflow
docs: update setup instructions
```

## Reporting Issues

If you identify a problem with the template, please create an issue describing:

* Expected behavior
* Actual behavior
* Steps to reproduce
* Relevant environment details
