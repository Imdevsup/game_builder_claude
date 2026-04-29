# Server architecture

Node 20 + TypeScript (ESM only). Colyseus for realtime, Hono for non-realtime HTTP. Modular monolith.

## Shape

```
apps/server/src/
  index.ts                # entrypoint
  config.ts               # env-driven config, validated with Zod
  http/                   # Hono routes (auth, REST, healthz)
  rooms/                  # Colyseus rooms
    SettlementRoom.ts
    WildsRoom.ts
    CombatRoom.ts
    BossRoom.ts
    ChatRoom.ts
  domain/                 # game logic services
    player/
    economy/
    combat/
    npc/
    xp/
    reputation/
    quests/
  db/
    schema.ts             # Drizzle schema
    migrations/
    repositories/         # one repo per aggregate
  llm/                    # thin server-side adapter to packages/shared/src/llm
  jobs/                   # cron-like tasks: shadow players, market ticks
  events/                 # event bus + event log writer
  observability/
  tests/
```

## Rules

- One room class per game-area concern. Rooms compose domain services. They never reach into another room.
- Domain services are pure where possible. They take state, return new state, never call the database directly. Repositories handle persistence.
- HTTP routes are thin. Validate with Zod, call a domain service, return a result. No business logic in handlers.
- Background jobs run via a single in-process scheduler in Phase 0-6, can be moved to a queue later.
- Every mutation appends to the event log table. The event log is append-only and the source of truth for audits.

## Concurrency and consistency

- Each Colyseus room runs single-threaded. Within a room, no locks needed.
- Cross-room state (e.g., server-wide market prices) lives behind a service backed by Postgres + an in-process cache that subscribes to a Postgres LISTEN/NOTIFY channel.
- All money/XP/item mutations are wrapped in a single Postgres transaction with row-level locks where needed.
