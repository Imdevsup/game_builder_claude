# Architecture overview

## Top-level diagram (logical)

```
                      ┌─────────────────────────────────────────────┐
                      │                  Browser                    │
                      │  ┌────────┐  ┌─────────┐  ┌──────────────┐  │
                      │  │ React  │  │ Phaser/ │  │  Colyseus    │  │
                      │  │  UI    │  │  three  │  │  client SDK  │  │
                      │  └────────┘  └─────────┘  └──────┬───────┘  │
                      └────────────────────────────────────┼─────────┘
                                                           │ WebSocket
                                ┌──────────────────────────┴────────────┐
                                │            Game server (Fly)          │
                                │  ┌──────────────┐  ┌───────────────┐  │
                                │  │ Colyseus     │  │ Hono HTTP     │  │
                                │  │ rooms        │  │ (auth, REST)  │  │
                                │  └──────┬───────┘  └───────┬───────┘  │
                                │         │                  │          │
                                │  ┌──────┴──────────────────┴───────┐  │
                                │  │   Domain layer (TypeScript)     │  │
                                │  │  economy / combat / npc / xp    │  │
                                │  └──────┬──────────────────┬───────┘  │
                                │         │                  │          │
                                │  ┌──────┴───────┐  ┌───────┴────────┐ │
                                │  │ LLM layer    │  │ Persistence    │ │
                                │  │ (abstraction)│  │  (Drizzle)     │ │
                                │  └──────┬───────┘  └───────┬────────┘ │
                                └─────────┼──────────────────┼──────────┘
                                          │                  │
                                  ┌───────┴──────┐    ┌──────┴────────┐
                                  │ Gemini / etc │    │  Supabase     │
                                  │  (or local)  │    │  Postgres     │
                                  └──────────────┘    └───────────────┘
```

## Request lifecycle (combat tick example)

1. Client receives a monster encounter from the room state and renders the keyboard sequence HUD.
2. Player presses keys. Each press is a `CombatInputMessage` over the room socket.
3. Server's `CombatRoom.onMessage("combat:input")` validates the press against the active sequence in the schema.
4. Sequence math runs in the deterministic combat engine in `packages/shared`.
5. State updates broadcast to all clients in the room via Colyseus state diff.
6. On encounter end, the LLM layer is invoked once for flavor text describing the kill or death. It hits the cache first.
7. Loot, XP, and reputation deltas are computed deterministically and persisted via Drizzle.
8. An event is appended to the event log table.

## Key boundaries

- Anything that mutates currency, XP, items, reputation, or world state runs server-side.
- Anything that is purely cosmetic (animations, particle timing, audio cues) can run client-side.
- The LLM layer is a strict dependency boundary. Domain code calls `llm.generate(promptKey, params)`. It never knows the model.

## Where each concern lives

| Concern | Package |
| --- | --- |
| Game state schema | `packages/shared/src/schemas/` |
| Constants (level curves, base prices) | `packages/shared/src/constants/` |
| Economy math | `packages/shared/src/economy/` |
| Combat sequence math | `packages/shared/src/combat/` |
| LLM prompts and abstraction | `packages/shared/src/llm/` |
| Static content (NPC sheets, recipes, monsters) | `packages/game-data/` |
| HTTP routes | `apps/server/src/http/` |
| Colyseus rooms | `apps/server/src/rooms/` |
| Persistence | `apps/server/src/db/` |
| Client state (Zustand stores) | `apps/web/src/state/` |
| Renderer scenes | `apps/web/src/scenes/` |
| UI components | `apps/web/src/ui/` |
