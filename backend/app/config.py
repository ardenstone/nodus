"""Application settings, loaded from the environment and an optional `.env` file."""

from functools import lru_cache

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Runtime configuration for the Nodus backend.

    Values are read from environment variables (case-insensitive) and, when
    present, a local `.env` file. Unknown variables are ignored so the same
    configuration can be shared with docker-compose.
    """

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        extra="ignore",
    )

    app_name: str = "Nodus API"
    app_version: str = "0.1.0"

    database_url: str = "postgresql+psycopg://nodus:nodus@localhost:5432/nodus"

    # OpenAI-compatible LLM endpoint (Ollama, vLLM, OpenAI, ...).
    llm_base_url: str = "http://localhost:11434/v1"
    llm_api_key: str = "not-needed"
    llm_model: str = "llama3.1"

    # Embedding model and the vector width written to pgvector.
    embed_model: str = "nomic-embed-text"
    embed_dim: int = 768


@lru_cache
def get_settings() -> Settings:
    """Return a cached `Settings` instance."""
    return Settings()
