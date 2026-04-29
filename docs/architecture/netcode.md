# Netcode

Colyseus authoritative server with Schema state sync. Client predicts where it is safe; server reconciles.

## Room types

- **SettlementRoom:** the safe-zone town. Multiple instances if pop overflows.
- **WildsRoom:** one room per biome tile. Players move between them at tile borders.
- **CombatRoom:** ephemeral. Spawned when a player engages a monster. Lives until encounter ends.
- **BossRoom:** server-wide singleton. Spawned when the King is challenged.
- **ChatRoom:** out-of-band channels (global, guild, whisper).

## State sync

- All shared game state is in Colyseus `Schema` classes.
- Schema definitions live in `packages/shared/src/schemas/` and are imported by both client and server.
- Use `@type()` decorators. `useDefineForClassFields: false` is set in `tsconfig.base.json`.
- Never put derived/computed values in Schema. Compute on demand from base state.

## Prediction and reconciliation

- Movement: client predicts immediately on input, server validates on next tick. If server position diverges by more than a tolerance, snap.
- Combat: NEVER predicted. Combat resolution is server-only. Client shows visual feedback on press but waits for server confirmation for damage and outcome.
- Chat: optimistic local echo with rollback if rate limit hits.
- Trade: every step is server-confirmed. No optimistic UI for value-changing actions.

## Reconnection

- Players are kept in the room state for 30 seconds after disconnect.
- If they reconnect within window, they resume the same player object.
- Beyond 30 seconds, they are checked out and their state is persisted to Postgres.

## Cheat surface

- Anything sent from the client is untrusted input. Validate every field.
- Movement speed checked against ceiling per class + gear.
- Inventory mutations require a server-side authorization check (do they actually own the item?).
- Trade confirmations require both parties to send the same trade hash within the same window.
