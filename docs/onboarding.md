# Onboarding

For future-you, returning to this project after a break.

## Step 1, Reorient

Read in this order:

1. `docs/bible.md`, what we are making.
2. `docs/decisions/CURRENT_PHASE.md`, where we are.
3. `docs/decisions/CHANGELOG.md`, last 20 entries.
4. `docs/decisions/OPEN.md`, what is unresolved.
5. `.claude/README.md`, how the studio is wired.

## Step 2, Run a sanity check

```bash
claude
> /bible-check
```

If this produces inconsistencies, do not start coding. Fix the inconsistencies first.

## Step 3, Pick a path

- If pre-Phase-0: `/start-phase 0`.
- If mid-phase: read the phase's definition of done, pick the first unchecked box.
- If post-phase: `/ship-phase` then `/start-phase <next>`.

## Step 4, Watchouts

- Gemini free tier will not survive 100 concurrent humans plus shadow players doing real LLM NPC traffic, even with caching. Plan to migrate before Phase 7.
- The economy is the riskiest system. Get the supply/demand math right in Phase 6 before adding shadow players.
- PvP loot rules (winner takes everything) will create harassment patterns. Have a plan for duel-scroll gating, rep, and exile mechanics before opening PvP at Phase 7.
- Asset polish is a black hole. Use Kenney CC0 through Phase 5. Resist replacing.
