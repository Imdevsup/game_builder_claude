# Observability

## Logs

- Structured JSON via Pino.
- Log every mutation with: actor, action, target, deltas, request id.
- Never log PII or raw chat content.

## Metrics

- Per-room: tick rate, player count, message rate.
- Per-feature: LLM call count, cache hit rate, fallback rate, $ spent.
- Per-economy: price velocity per item, Gini coefficient of wealth.
- Per-player: XP rate, deaths, sessions.

## Traces

- OpenTelemetry on the server. Trace any request that touches LLM, DB, or cross-room state.

## Dashboards

- One default dashboard per concern: economy health, LLM spend, player retention, combat balance.
- Owned by `telemetry-analyst`.
