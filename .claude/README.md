# .claude/

This directory turns Claude Code into a full game studio.

## What lives here

- `agents/`, 259 specialist subagents. One file per role. Frontmatter declares the role, tools, and model. The body is the role's job description, what they own, when to call them, what they deliver, what to read first, voice rules, anti patterns, and how to hand off. Flat directory, alphabetical.
- `skills/`, 120 named workflows. Each is a folder with a `SKILL.md` that documents a recipe. Use a skill when you need to do something the studio has done before.
- `commands/`, 27 slash commands. Each is a one shot prompt template. Type `/name` in Claude Code to fire it. Common ones: `/bible`, `/phase`, `/feature`, `/bug`, `/cost`, `/deploy`.
- `hooks/`, Pre prompt and pre tool use hooks. `inject-context.sh` reminds every prompt of the rules and the current phase. `guard-bash.sh` blocks dangerous shell commands.
- `output-styles/`, Voice modes for different rooms. `studio-default` for everyday work, `design-room` for creative options, `code-room` for mechanical implementation, `ship-room` for high stakes deploys.

## How to use it

You do not need to know all 259 agents. Most of the time you delegate to a department lead like `lead-game-designer`, `principal-architect`, `art-director`, `producer`, and they fan out to the specialists.

For common workflows, the slash commands are faster than spelling out the request. `/feature add a fishing minigame` does the right reads, the right delegations, the right writes.

## How to extend it

- New agent: copy an existing file in `agents/`, change the frontmatter, rewrite the body.
- New skill: copy an existing folder in `skills/`, rewrite `SKILL.md`. Keep skills focused on one outcome.
- New command: copy an existing file in `commands/`, rewrite frontmatter and body. Commands take `$ARGUMENTS`.
- Always update this README when you add a department or a major workflow.

## Voice

Same rule as the rest of the repo. No em dashes. Plain English. See `CLAUDE.md` at the project root.
