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
