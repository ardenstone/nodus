# Developer tasks for Nodus. Run `just` to list everything.
#
# `just` is the preferred runner: https://github.com/casey/just
# A Makefile with the same targets is provided as a fallback.

default:
    @just --list

# Start the full stack (build images, run migrations, serve)
up:
    docker compose up -d --build

# Stop the stack, keeping the database volume
down:
    docker compose down

# Stop the stack and delete the database volume (fresh DB next boot)
reset:
    docker compose down -v

# Follow container logs
logs:
    docker compose logs -f

# Apply database migrations inside the running backend
migrate:
    docker compose exec backend alembic upgrade head

# Ingest documents (placeholder until the ingestion epic lands)
ingest:
    docker compose exec backend python -m app.ingest

# Run retrieval / answer evaluations (placeholder until the evals epic lands)
eval:
    docker compose exec backend python -m evals.run

# Lint Python (ruff) and web (eslint + prettier)
lint:
    uvx ruff==0.8.6 check backend
    uvx ruff==0.8.6 format --check backend
    npm --prefix web run lint
    npm --prefix web run format:check

# Run backend tests
test:
    uv run --no-project --with-requirements backend/requirements-dev.txt pytest backend

# Apply formatters (ruff --fix + prettier --write)
format:
    uvx ruff==0.8.6 check --fix backend
    uvx ruff==0.8.6 format backend
    npm --prefix web run format
