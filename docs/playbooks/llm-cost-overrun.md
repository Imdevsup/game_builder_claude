# Playbook: LLM cost overrun

Triggered when the daily budget in the cost ledger is breached or projected to breach.

## Steps

1. **Confirm.** Pull the cost ledger via the telemetry dashboard. Identify the top 3 prompt keys by spend.
2. **Cache analysis.** For each top key: cache hit rate. If < 50%, the cache key is wrong or TTL is too short.
3. **Template-first audit.** Are we calling for novelty when a template would do? Read the prompt registry, ask `prompt-engineer` to review.
4. **Batch.** Are calls in the same tick being batched? If not, file a fix.
5. **Stop the bleed.** If projected daily spend > 2x budget, switch the offending prompt key to fallback-only mode until fix lands.
6. **Record.** ADR if the fix is architectural. Otherwise changelog.
7. **Add a regression test** that simulates load and asserts spend stays within budget.

## Defaults

- Budget per prompt key is set in the registry. Default: 1000 calls/day, 200 tokens/call.
- Default TTL: 24h for NPC personality lines, 5min for price narration, 60s for chat-adjacent.
