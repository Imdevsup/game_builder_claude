# Architecture index

How the system is built. Read `overview.md` first, then drill into the layer you are touching.

- [overview.md](./overview.md), high-level diagram and request lifecycle.
- [client.md](./client.md), React + Vite + renderer.
- [server.md](./server.md), Node + Hono + Colyseus.
- [netcode.md](./netcode.md), rooms, schema sync, prediction, reconciliation.
- [persistence.md](./persistence.md), Postgres, Drizzle, snapshots, event log.
- [llm-layer.md](./llm-layer.md), the AI abstraction. Read this before any LLM work.
- [economy-engine.md](./economy-engine.md), deterministic price math.
- [combat-engine.md](./combat-engine.md), keyboard sequence generation and resolution.
- [asset-pipeline.md](./asset-pipeline.md), static and dynamic asset flow.
- [security.md](./security.md), auth, RLS, anti-cheat surface area.
- [observability.md](./observability.md), logs, metrics, traces, dashboards.
