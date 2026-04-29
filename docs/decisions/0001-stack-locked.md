# ADR 0001: Initial stack

**Status:** accepted
**Date:** project genesis

## Context

We are building a browser MMORPG with AI-driven NPCs and economy. We need realtime multiplayer for ~100 players per server, persistent state, and an LLM integration that does not blow up the budget. Solo build, no fixed timeline. The author has prior TypeScript and React experience.

## Decision

- **Frontend:** React 18 + Vite + TypeScript.
- **Rendering:** Phaser 3 if 2.5D, three.js if low-poly 3D. Decision deferred to design 01.
- **Realtime:** Colyseus (rooms, schema sync, matchmaking, MIT).
- **Backend:** Node 20 + TypeScript ESM, Hono for HTTP, modular monolith.
- **Database:** Postgres via Supabase, Drizzle ORM.
- **LLM:** Gemini free tier behind a strict abstraction layer; swappable.
- **Audio:** Howler.js.
- **Package manager:** pnpm 9 with workspaces.
- **Hosting:** Vercel (web), Fly.io (server), Supabase Cloud.

## Consequences

- Positive: TypeScript everywhere, types shared, Colyseus does the boring netcode well.
- Positive: free hosting tiers cover prototype.
- Negative: Gemini free tier will not scale to 100 concurrent humans with active LLM NPC traffic. Plan to migrate to paid or local models before Phase 7.
- Negative: Drizzle is younger than Prisma; expect occasional gotchas.
- Cascading: every layer doc in `docs/architecture/` assumes this stack.

## Alternatives considered

- **Reldens** (open-source MMORPG platform on Colyseus + Phaser): faster start, but legacy code from 2018, opinionated data model, would constrain the AI-native pillar. Rejected.
- **Custom WebSocket netcode** instead of Colyseus: no thanks.
- **Bun** instead of Node: too early for a multi-year project; revisit at Phase 6.
- **Prisma** instead of Drizzle: heavier runtime, slower migrations; Drizzle wins for this project.
