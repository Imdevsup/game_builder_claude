#!/usr/bin/env bash
# PreToolUse hook for Bash: refuse certain dangerous patterns.
# Reads the proposed command from CLAUDE_TOOL_INPUT.
set -e

CMD="${CLAUDE_TOOL_INPUT:-}"

# Hard block: rm -rf at root, force pushes to main, dropping prod DB
if echo "$CMD" | grep -qE 'rm[[:space:]]+-rf[[:space:]]+(/|/\*|\$HOME|~)'; then
  echo "BLOCKED: refusing rm -rf on root or home" >&2
  exit 2
fi

if echo "$CMD" | grep -qE 'git[[:space:]]+push[[:space:]]+.*--force.*main'; then
  echo "BLOCKED: refusing force push to main" >&2
  exit 2
fi

if echo "$CMD" | grep -qE 'drop[[:space:]]+(database|table)[[:space:]]+(prod|production)'; then
  echo "BLOCKED: refusing drop on prod" >&2
  exit 2
fi

exit 0
