# python-template

A standardized Python project template for developing, testing, and distributing Python packages within the organization.

This repository provides a consistent development environment and project structure, enabling teams to quickly bootstrap new Python projects while adhering to organizational best practices.

## Features

* Python package development using **uv**
* Containerized development environment using **Podman**
* Automated environment initialization via `initialize.sh`
* Standardized developer workflow through a **Makefile**
* Testing with **pytest**
* Automated code quality checks through **pre-commit**
* Linting, formatting, and validation hooks integrated into the development workflow
* Ready for publication to internal or external package registries
* Consistent project structure for maintainability and collaboration

## Development Environment

The development environment is designed to be reproducible across machines.

### Prerequisites

* Podman
* Visual Studio Code
* Git

### Initial Setup

```bash
./initialize.sh
```

The initialization script will:

* Build or pull the development container image
* Configure the containerized development environment
* Install required Visual Studio Code extensions
* Prepare the repository for development

## Package Management

This template uses **uv** for dependency and environment management.

Common commands include:

```bash
uv sync
uv add <package>
uv remove <package>
uv run <command>
```

## Development Workflow

Most interactions should be performed through the provided Makefile.

Examples:

```bash
make test
make lint
make format
make check
```

Refer to the Makefile for the complete list of available commands.

## Testing

Tests are executed using pytest.

```bash
make test
```

or

```bash
uv run pytest
```

## Code Quality

Code quality is enforced through pre-commit hooks.

Install hooks:

```bash
pre-commit install
```

Run manually:

```bash
pre-commit run --all-files
```

## Project Structure

This repository serves as a boilerplate and intentionally contains minimal domain-specific code. Projects created from this template should extend the structure according to their requirements.

## Contributing

Please see [CONTRIBUTING.md](CONTRIBUTING.md) for development guidelines.

## Security

Please see [SECURITY.md](SECURITY.md) for information about reporting security vulnerabilities.

## License

This repository is intended for internal organizational use unless otherwise specified by the consuming project.
