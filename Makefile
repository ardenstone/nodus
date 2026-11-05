# Developer tasks for Nodus (fallback for `just`).
# The justfile is the preferred entrypoint; targets match 1:1.

.DEFAULT_GOAL := help

.PHONY: help up down reset logs migrate ingest eval lint test format

help: ## List available targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

up: ## Start the full stack (build images, run migrations, serve)
	docker compose up -d --build

down: ## Stop the stack, keeping the database volume
	docker compose down

reset: ## Stop the stack and delete the database volume
	docker compose down -v

logs: ## Follow container logs
	docker compose logs -f

migrate: ## Apply database migrations inside the running backend
	docker compose exec backend alembic upgrade head

ingest: ## Ingest documents (placeholder until the ingestion epic lands)
	docker compose exec backend python -m app.ingest

eval: ## Run retrieval / answer evaluations (placeholder until the evals epic lands)
	docker compose exec backend python -m evals.run

lint: ## Lint Python (ruff) and web (eslint + prettier)
	uvx ruff==0.8.6 check backend
	uvx ruff==0.8.6 format --check backend
	npm --prefix web run lint
	npm --prefix web run format:check

test: ## Run backend tests
	uv run --no-project --with-requirements backend/requirements-dev.txt pytest backend

format: ## Apply formatters (ruff --fix + prettier --write)
	uvx ruff==0.8.6 check --fix backend
	uvx ruff==0.8.6 format backend
	npm --prefix web run format
