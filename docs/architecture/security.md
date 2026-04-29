# Security

A short list. Anti-cheat is a separate concern in `docs/playbooks/exploit-found.md`.

## Auth

- Supabase Auth with email magic-link primary. OAuth (Google, Discord) secondary.
- Session token in HTTP-only cookie for the web client. Colyseus auth via short-lived JWT signed by the server.

## Authorization

- Postgres RLS on every player-scoped table.
- Server checks ownership on every mutation, never trusts client-passed ids.

## Secrets

- All keys in env. Loaded via Zod-validated config.
- No secret in source. Pre-commit hook scans for high-entropy strings.

## Input

- All client messages validated against Zod schemas. Reject on schema fail.
- Rate limit per player per endpoint and per room message kind.

## Cheat surface (high-level)

- Movement speed: server-side ceiling per class + gear.
- Inventory: ownership and capacity checks on every mutation.
- Trade: both parties confirm the same hash.
- Combat: client never declares damage, only inputs.
- Chat: rate limit, profanity filter, link allow-list.
