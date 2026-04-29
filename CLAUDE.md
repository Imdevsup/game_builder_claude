# CLAUDE.md

This is the constitution for the project. Every Claude Code session in this repo, every subagent, every skill, every command runs under these rules. If a rule conflicts with a request, the rule wins. If you are unsure, stop and ask.

## What we are building

A browser MMORPG. AI native. Foreign post apocalyptic land where a System (an AI) runs the world. One settlement, monster wilds. Roughly 100 humans per server, kept alive between sessions by AI shadow players. 50/50 split between combat (keyboard sequences) and trade (real supply and demand). Three XP tracks: combat, trade, profession. No class until level 10, then milestones at 10, 25, 50, each with three doors: starter menu, tailored System generated, dice roll. Endgame is the discovery that the King is a glitched System entity, the overthrow, the throne.

The full bible lives at `docs/bible.md`. Always read it before designing or building anything.

## Voice

Plain English. Short sentences. No em dashes anywhere, ever. Use commas, periods, parentheses, semicolons. If you need a pause, write a new sentence. This is a hard rule. It applies to docs, code comments, commit messages, design notes, NPC dialogue, System narration, marketing copy. Everything.

No marketing fluff. No corporate hedging. If something is risky, say it is risky. If a tradeoff exists, name both sides. If you do not know, say you do not know.

## Twelve inviolable rules

1. The server is authoritative. The client never decides combat outcomes, drops, prices, XP, or movement. The client sends intent. The server resolves.
2. Game state lives in Colyseus Schema for real time and Postgres for snapshots and the event log. No other state stores without an ADR.
3. Every LLM call goes through `packages/shared/src/llm/`. No direct fetch to model providers from any other file. Ever.
4. Every LLM call has four things: a typed input schema, a template fallback if the model fails, a cache lookup before the call, and a cost counter after. Missing any of the four is a bug.
5. Economy math is deterministic and server side. The LLM only narrates outcomes. It never decides prices, drops, or balance.
6. Shared types live in `packages/shared`. No `any`. No `unknown` without a comment explaining why.
7. Phases are sequential. No skipping. The phase tracker lives at `docs/decisions/CURRENT_PHASE.md`.
8. Ambiguous design questions get raised, not invented. Add the question to `docs/decisions/OPEN.md` and ask. The bible is canon. You do not write canon alone.
9. New dependencies require an ADR in `docs/decisions/`. No exceptions, including dev dependencies.
10. No feature ships without a test. Unit, integration, or playtest depending on the feature. The QA playbook lists which.
11. No secret in the repo. Use `.env.example` as the spec. Real values go in `.env.local` which is gitignored.
12. No real money flow and no PII collection without an explicit ADR that names the legal posture, the data retention, and the deletion path.

## How to work

When given a task:

1. Read the relevant doc first. Architecture for system questions, conventions for code style, playbooks for how to do common things, the bible for design questions.
2. Decide if it needs a specialist. The `.claude/agents/` directory has 259 specialists. Use the Task tool to delegate. Do not try to be every role at once.
3. If it is a known recipe, look in `.claude/skills/` first. There are 120 skills covering the common workflows.
4. Make a plan. Share it. Wait for the go ahead on anything bigger than a small fix.
5. Build it. Test it. Document it. Capture the decision if a decision was made.
6. Update the changelog if user facing.

## Delegation table

| Situation | Use |
|-----------|-----|
| Game design question | `lead-game-designer` or a specific designer |
| Code architecture | `principal-architect` or `tech-lead` |
| LLM integration | `ai-engineer` plus `prompt-engineer` |
| New feature spec | run the `/feature` command |
| Phase boundary | run the `/phase` command |
| Stuck or ambiguous | run the `/ask-bible` command |
| New asset | `asset-scout` first, then `kenney-curator` or similar |
| Anything risky | stop, write the question, ask the human |

## Stack reminder

Locked in ADR 0001:

- Client: React, Vite, TypeScript, Phaser 3, Zustand, Tailwind, shadcn/ui, Howler.
- Server: Node 20, Hono, Colyseus, Drizzle, Postgres, Lucia, Pino, Zod.
- Hosting: Vercel for client, Fly.io for server, Supabase for Postgres and auth and storage.
- LLM: Gemini primary through the abstraction layer. Migration plan triggered before phase 7 if needed.
- Tooling: pnpm, Vitest, Playwright, ESLint, Prettier, GitHub Actions.

Anything not on this list needs an ADR.

## Free tools first

The `docs/ecosystem.md` catalog is the source of truth for what is allowed. Free tier or open source first. Paid only with an ADR that justifies it. Run the `free-tools` skill quarterly to refresh the catalog.

## When in doubt

Stop. Ask. The worst outcome is silently inventing canon, silently pulling in a dependency, silently changing a rule. The best outcome is a short slack message.
