# LLM layer

The most important boundary in the codebase. Read this fully before any AI work.

## Why an abstraction layer

The game's AI-native pillar means many features touch the LLM. If we let feature code call the model directly, we get four failure modes:

1. Cost explosion (no caching, no batching).
2. Style drift (no shared prompt templates).
3. Cascading outages (one model down, ten features dead).
4. Test brittleness (real model in unit tests).

The abstraction layer is mandatory. There are no exceptions.

## Shape

```
packages/shared/src/llm/
  index.ts               # public API: generate, narrate, decide
  types.ts               # Result, PromptKey, Params, Cache
  registry.ts            # PromptKey -> prompt template + schema
  prompts/               # one file per prompt template
    npc-dialogue.ts
    system-announcement.ts
    price-narration.ts
    tailored-class.ts
    rumor.ts
    quest-text.ts
  cache.ts               # TTL + content-hash cache
  batch.ts               # per-tick batching
  cost.ts                # token + dollar accounting
  fallbacks/             # canned templates per PromptKey
  providers/
    gemini.ts
    mock.ts              # used in tests; fully deterministic
    canned.ts            # last-resort fallback
```

## The public API

```ts
type LlmResult<T> =
  | { kind: "fresh"; value: T; tokens: number; latencyMs: number }
  | { kind: "cached"; value: T }
  | { kind: "fallback"; value: T; reason: string };

generate<T>(key: PromptKey, params: PromptParams<T>, opts?: GenerateOpts): Promise<LlmResult<T>>;
```

Feature code only ever sees this. The model name is never imported anywhere outside `providers/`.

## The four guarantees

Every call provides:

1. **Template fallback.** Every PromptKey has a deterministic template in `fallbacks/` that returns a typed value without calling any model.
2. **Cache lookup.** Keyed by `(promptKey, contentHash(params))`. TTL per key in `registry.ts`.
3. **Batch support.** Calls in the same tick with the same key may be batched into a single model call.
4. **Cost counter.** Every call records tokens and est-dollars to the cost ledger. Daily budget enforced at the registry level.

## What LLM is allowed to decide

- Dialogue text.
- Rumor content.
- Flavor narration.
- Class names and flavor descriptions (mechanics are deterministic).
- Quest framing text.
- Price narration text (numbers come from the economy engine).
- NPC mood text.

## What LLM is never allowed to decide

- Prices (math).
- Combat outcomes.
- XP grants.
- Loot rolls.
- Reputation deltas.
- Class mechanical effects.
- Anything that affects fairness or balance.

## Memory schemas

- **Per-NPC memory:** capped key-value store per (npc_id, player_id). Old entries decay. Fits in a single prompt.
- **Per-player memory:** capped store per player_id, used by the System for tailored class generation and quest framing.

## Failure handling

```
generate() flow:
  1. Check cache. Hit? return "cached".
  2. Check budget. Over? return fallback("budget").
  3. Call provider with timeout.
     Success: validate against schema. Schema fail? Return fallback("schema").
     Timeout/error: return fallback("provider", reason).
  4. Write to cache, write to cost ledger, return "fresh".
```

Fallback templates must always return a valid value. They are tested in CI.
