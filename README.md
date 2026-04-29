# AI-native browser MMORPG

Personal game-builder configured on top of Claude Code.

## What this is

A complete studio-as-code setup. The game is a browser MMORPG with an AI-driven economy, AI NPCs, and a final boss who is a glitched System entity disguised as the King. Stack is Colyseus + React + TypeScript + Postgres + Gemini.

## How it works

This repo turns Claude Code into a multi-disciplinary studio. When you run `claude` from this directory, Claude reads `CLAUDE.md`, picks up the project bible at `docs/bible.md`, and gains access to:

- ~30 specialist subagents under `.claude/agents/` (creative director, systems designer, network engineer, prompt engineer, art director, etc).
- ~30 workflow skills under `.claude/skills/` invokable as slash commands or auto-triggered.
- Full architecture docs under `docs/architecture/`.
- Engineering conventions under `docs/conventions/`.
- Operational playbooks under `docs/playbooks/`.
- Design deliverable templates under `docs/design/`.
- ADR system under `docs/decisions/`.

## Quick start

```bash
# from the repo root
claude

# in the Claude Code session
/bible-check          # confirm everything is consistent
/start-phase 0        # begin Phase 0 (foundations)
```

## Folder map

```
.
├── CLAUDE.md                        # always-loaded constitution
├── .mcp.json                        # MCP servers wired into Claude Code
├── docs/
│   ├── bible.md                     # game bible v0.3, source of truth
│   ├── architecture/                # how the system is built
│   ├── conventions/                 # code, naming, commits, prompts
│   ├── playbooks/                   # named procedures for ops events
│   ├── design/                      # 11 deliverable templates
│   ├── decisions/                   # ADRs, current phase, changelog
│   └── onboarding.md                # for future-you
└── .claude/
    ├── README.md                    # how the studio works internally
    ├── agents/                      # ~30 specialist subagents
    └── skills/                      # ~30 workflow skills
```

## Reading order if this is your first time back

1. `docs/bible.md` to recall what we are making.
2. `docs/decisions/CURRENT_PHASE.md` to see where we are.
3. `docs/decisions/CHANGELOG.md` to see what just happened.
4. `.claude/README.md` to remember how the studio is wired.
5. Any open questions in `docs/decisions/OPEN.md`.
