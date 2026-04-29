# Code style

## TypeScript

- `strict` is on. Do not relax it. Do not use `any`. `unknown` only with a narrowing block.
- Use `interface` for public-facing shapes, `type` for unions and utility types.
- Prefer named exports. Default exports only for top-level entry files.
- One concept per file. If a file exceeds ~300 lines, split.
- Prefer pure functions in domain logic. Side effects live at the edges (rooms, repos, jobs).

## Imports

- Use path aliases: `@shared/*`, `@web/*`, `@server/*`, `@game-data/*`.
- Do not deep-import internals across packages.
- Sort imports: third-party, then aliased, then relative.

## React

- Function components only. No classes.
- One component per file. Filename matches component name in PascalCase.
- Props typed via `interface ComponentNameProps`.
- Hooks may not be conditional. ESLint enforces this.
- Server-driven state via Zustand selectors, not prop drilling.

## CSS

- Tailwind utilities for layout and spacing.
- CSS modules for anything custom.
- Design tokens (colors, spacing, type) come from `apps/web/src/styles/tokens.ts`, never hardcoded.

## Comments

- Comment why, not what. The what is the code.
- Mark TODOs with `// TODO(handle): ...`.
- Mark hacks with `// HACK: ...` and link to a tracked issue.
