#!/usr/bin/env bash
# UserPromptSubmit hook: prepend a tiny reminder so the session never forgets the rules.
# This runs every prompt, so keep it short.
set -e

cat <<'EOF'

[studio reminder]
- read CLAUDE.md and docs/bible.md if you haven't this session
- inviolable rules apply (server-authoritative, llm via abstraction layer, no canon invented, etc)
- current phase: see docs/decisions/CURRENT_PHASE.md
- no em dashes anywhere
EOF
