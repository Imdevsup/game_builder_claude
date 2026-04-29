# Deliverable 09: Multiplayer and server model

**Owner:** `realtime-engineer + ux-designer`
**Status:** template, not yet filled.

---

## Server browser UX

[Wireframe.]

## Server creation UX

[Public/private, password, name, flavor.]

## Seeded world initialization

[How a new server initializes from the shared seed. Deterministic NPC placement, deterministic resource node distribution, identical starting prices.]

## Presence and visibility

- Avatars rendered at all times in same room.
- Gear visible based on a "show gear" toggle in settings.
- Nameplates with class title and optional anonymity.
- Anonymity opts you out of leaderboard top-N (still ranked, just hidden).

## Chat channels

| Channel | Rate limit | Filter | Notes |
| --- | --- | --- | --- |
| global | 1 msg / 5 sec | profanity + link allowlist | server-wide |
| local | 1 msg / 2 sec | profanity | room-scoped |
| guild | 1 msg / 2 sec | profanity | guild-only |
| whisper | 1 msg / 1 sec | profanity | 1:1 |

## Direct trade window

[Flow with anti-scam confirmation states. Both parties see and confirm a trade hash.]

## Guild system

- Creation cost: ...
- Treasury rules: ...
- Rep exposure: members' rep affects guild rep
- Ranks: leader, officer, member, recruit
- Alliances and wars: ...

## Offline player model

[How shops and inventory participate while away. Untargetable.]

## Anti-cheat (design level)

[Checks at the design level, not implementation. See `docs/architecture/security.md` for impl.]
