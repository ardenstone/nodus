"""Nodus FastAPI application entrypoint."""

from fastapi import FastAPI

from app.config import get_settings

settings = get_settings()

app = FastAPI(title=settings.app_name, version=settings.app_version)


@app.get("/health")
def health() -> dict[str, str]:
    """Liveness probe used by the container healthcheck and uptime checks."""
    return {"status": "ok"}
