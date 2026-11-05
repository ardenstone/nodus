# Migrations

Schema changes are managed with [Alembic](https://alembic.sqlalchemy.org/).

```sh
# apply everything (also runs automatically on `docker compose up`)
alembic upgrade head

# create a new revision after editing app/db/models.py
alembic revision --autogenerate -m "describe the change"
```

The embedding width in `0001_initial_schema.py` must match `EMBED_DIM` in `.env`.
Changing the width later requires a dedicated migration.
