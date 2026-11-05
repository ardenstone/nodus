"""Placeholder ingestion entrypoint.

Real ingestion (load -> chunk -> embed -> persist) lands in the ingestion epic.
For now this keeps the `just ingest` target wired and discoverable.
"""


def main() -> int:
    print("ingest: no sources configured yet")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
