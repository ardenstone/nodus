# Nodus

Nodus is a retrieval-augmented knowledge engine: ingest documents, embed them into
Postgres with `pgvector`, and answer questions with citations.

## Layout

```
backend/   FastAPI service, ingestion + retrieval, DB migrations
web/       Next.js (App Router) UI
evals/     Retrieval / answer quality evaluations
data/      Local sample corpora and scratch data (gitignored)
docs/      Design notes and documentation
```

## Status

Early foundations — the repo is being bootstrapped end to end (infra, config, DB, CI).
See the [Foundations milestone](https://github.com/ardenstone/nodus/milestone/1).

## Quickstart

Requires Docker. `just` is recommended (`make` works too), but the underlying
commands are plain `docker compose` / `npm` / `ruff`.

```sh
cp .env.example .env        # then adjust if needed
just up                     # docker compose up -d --build (+ migrations)
curl http://localhost:8000/health
```

### Tasks

| Target   | What it does                                            |
| -------- | ------------------------------------------------------- |
| `up`     | Build and start the stack, applying migrations           |
| `down`   | Stop the stack (keeps the database volume)               |
| `reset`  | Stop the stack and delete the database volume            |
| `migrate`| Apply Alembic migrations                                 |
| `ingest` | Ingest documents (placeholder until the ingestion epic) |
| `eval`   | Run evaluations (placeholder until the evals epic)       |
| `lint`   | Ruff (Python) + ESLint/Prettier (web)                    |
| `test`   | Backend test suite                                       |

`pre-commit install` wires ruff and the web linters into git hooks; CI runs the
same checks via `.github/workflows/ci.yml`.

