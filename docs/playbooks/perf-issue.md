# Playbook: perf issue

## Steps

1. **Measure.** No optimization without a profile. Capture with the in-app profiler or Chrome DevTools (client) or Node clinic (server).
2. **Identify.** Top 1-3 hot paths. Be specific: which function, which line, what % of frame.
3. **Hypothesize.** Why is it hot? Common: N+1 queries, allocations in hot loop, unnecessary serialization, render thrashing.
4. **Fix one.** Optimize the top hot path. Re-measure. Confirm improvement.
5. **Repeat** if budget allows. Stop when within target (see budgets in `docs/architecture/client.md` and `server.md`).
6. **Add a regression test** if possible (e.g., "creating 100 NPCs takes < 200ms").
7. **Record.** Changelog entry with before/after numbers.

## Common server perf traps

- Missing indexes on foreign keys.
- Loading entire collections in a room loop.
- Serializing the full Schema on every tick when only a delta changed.
- Synchronous JSON parse on hot path.

## Common client perf traps

- Re-rendering the whole HUD on every state tick.
- Allocating in the render loop.
- Loading huge tilemaps eagerly instead of streaming.
