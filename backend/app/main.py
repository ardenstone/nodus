"""Nodus FastAPI application entrypoint."""

from fastapi import FastAPI

app = FastAPI(title="Nodus API", version="0.1.0")


@app.get("/health")
def health() -> dict[str, str]:
    """Liveness probe used by the container healthcheck and uptime checks."""
    return {"status": "ok"}
