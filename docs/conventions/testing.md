# Testing

Vitest. Tests live next to source as `name.test.ts`.

## What gets tested

- All economy math: tested.
- All combat math: tested.
- All XP/level math: tested.
- All LLM prompts: tested with the mock provider against schema.
- Every room: at least one happy-path test simulating two clients.
- Every repository: tested against a transactional fixture.
- Every Zod schema: round-trip test on representative data.

## What does not get unit-tested

- React components: only smoke-test with React Testing Library, behavior tested through the room.
- Renderer scenes: visual-regression only, optional.

## Conventions

- One `describe` per unit. Nested `describe` for sub-cases.
- `it("does X when Y")` pattern.
- No `beforeAll` with shared state across files.
- LLM provider in tests is the deterministic mock from `packages/shared/src/llm/providers/mock.ts`.
- Database tests use a per-test transaction that rolls back.
