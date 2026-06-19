# ---------------------------------------------------------------------------
# Project Makefile  —  Usage: make <target>
# ---------------------------------------------------------------------------
.DEFAULT_GOAL := help
SHELL         := /bin/bash
PYTHON        := uv run
SRC           := src tests

# ── Help ───────────────────────────────────────────────────────────────────
.PHONY: help
help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	    | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-18s\033[0m %s\n", $$1, $$2}'

# ── Python / Package ───────────────────────────────────────────────────────

.PHONY: sync
sync: ## Sync dependencies (frozen for CI)
	uv sync --all-extras --frozen


.PHONY: build
build: ## Build the package
	uv build


.PHONY: pre-commit
pre-commit: ## Run pre-commit hooks on all files
	$(PYTHON) pre-commit run --all-files


.PHONY: install
install: ## Install dependencies and pre-commit hooks
	sync
	$(PYTHON) pre-commit install


.PHONY: clean
clean: ## Remove build artifacts and caches
	rm -rf dist/ .coverage coverage.xml htmlcov/ .pytest_cache/ .ruff_cache/
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true


.PHONY: publish
publish: clean build ## Build and publish to configured index
	$(PYTHON) twine upload --repository $(PUBLISH_REPO) dist/*


.PHONY: lint
lint: ## Check lint + formatting (no writes)
	$(PYTHON) ruff check $(SRC)
	$(PYTHON) ruff format --check $(SRC)

.PHONY: fix
fix: ## Auto-fix lint and format issues
	$(PYTHON) ruff check --fix $(SRC)
	$(PYTHON) ruff format $(SRC)

.PHONY: test
test: ## Run tests
	$(PYTHON) pytest

.PHONY: test-ci
test-ci: ## Run tests in CI mode (XML coverage)
	$(PYTHON) pytest --cov-report=xml

.PHONY: check
check: lint test-ci ## Lint + format-check + tests (pre-push gate)
