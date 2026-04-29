# Persistence

Postgres via Supabase. Drizzle ORM. Migrations are version-controlled and immutable once applied.

## Tables (initial)

- `players`, account, level, three XP pools, current class id, current location.
- `inventories`, owner_id, slot index, item_id, quantity, metadata.
- `items`, instance table for non-stackable unique items (legendary gear etc).
- `npcs`, server-scoped NPC instances with mood, memory pointer, inventory pointer.
- `npc_memories`, append-only key-value memory per NPC, per player.
- `prices`, current price per (server, item, npc).
- `recipes`, static, seeded from `packages/game-data/`.
- `monsters`, static.
- `classes`, static + dynamic (tailored classes are inserted at runtime).
- `professions`, static.
- `quests`, static + dynamic instances.
- `reputation`, (player_id, target_id, target_type, value).
- `transactions`, every coin/item movement, append-only.
- `events`, the event log, append-only, source of truth for audits.
- `worlds`, per-server config, seed, status.
- `sessions`, auth sessions.

## Rules

- Migrations live in `apps/server/src/db/migrations/`. Never modify a committed migration. Add a new one to fix a mistake.
- All write paths go through repositories under `apps/server/src/db/repositories/`. No raw SQL in domain code.
- All financial mutations use serializable transactions.
- RLS is on by default. Policies live alongside migrations.
- Seed data (NPCs, recipes, monsters, base classes) loads from `packages/game-data/` on world init.

## Snapshots vs live state

- Live state is in Colyseus Schema in memory.
- Persistence is snapshot + event log:
  - Snapshot: the latest committed state, written every N seconds and on key events.
  - Event log: every mutation appended on commit.
- On crash recovery: load latest snapshot, replay events since snapshot timestamp.
