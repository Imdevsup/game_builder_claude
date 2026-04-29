# Commits

Conventional Commits, lightly enforced.

```
<type>(<scope>): <subject>

<body, optional>

<footer, optional>
```

Types: `feat`, `fix`, `chore`, `refactor`, `docs`, `test`, `perf`, `build`, `ci`.

Scopes are flexible but prefer one of: `web`, `server`, `shared`, `game-data`, `db`, `llm`, `economy`, `combat`, `npc`, `ui`, `infra`.

Examples:

```
feat(combat): add keyboard-sequence generator for tier 1 monsters
fix(economy): clamp price ratio after the goblin-raid event
chore(server): bump colyseus to 0.16.4
docs(architecture): describe LLM fallback flow
```

Every commit must build and pass tests. No "WIP" commits on main.

## Branches

- `main` is always shippable.
- Feature branches: `feat/<scope>-<short-name>`.
- Fix branches: `fix/<scope>-<short-name>`.
- Long-running design exploration: `spike/<short-name>`. Never merged directly.

## Pull requests

- Small. Under ~400 lines diff is the target. Larger PRs need an explicit reason.
- Description references the bible section or design deliverable id.
- If it changes architecture, link the ADR.
