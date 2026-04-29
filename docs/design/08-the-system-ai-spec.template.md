# Deliverable 08: The System (AI spec)

**Owner:** `prompt-engineer + ai-engineer`
**Status:** template, not yet filled.

---

## System voice

[Tone, register, when it speaks, how it addresses players. See `docs/conventions/prompt-style.md`.]

## System message categories

- Personal notification
- World event
- Quest prompt
- Class milestone offer
- Rep warning
- Price narration
- Rumor

## Per-NPC memory schema

```ts
type NpcMemory = {
  npcId: string;
  playerId: string;
  entries: Array<{
    at: number;
    kind: "trade" | "talk" | "favor" | "slight";
    summary: string;       // <= 80 chars
    weight: number;        // 0..1
  }>;
  // capped at 12 entries; lowest weight evicts
};
```

## Per-player memory schema (for tailored class)

```ts
type PlayerProfile = {
  playerId: string;
  combatXp: number;
  tradeXp: number;
  professionXp: number;
  topNpcRels: Array<{ npcId: string; rep: number }>;
  patterns: {
    aggressive: number;     // 0..1
    cautious: number;
    haggler: number;
    altruist: number;
    isolator: number;
  };
};
```

## Prompt shapes

For each LLM-involved moment, define inputs, output schema, fallback behavior. Use the registry pattern from `docs/architecture/llm-layer.md`.

- npc.dialogue
- system.announce
- economy.narrate-price
- class.tailor-flavor
- rumor.generate
- quest.frame

## What LLM is allowed to decide

[See `docs/conventions/prompt-style.md`.]

## What LLM is not allowed to decide

[See `docs/conventions/prompt-style.md`.]

## Caching and cost strategy

- Per-key TTLs: ...
- Batching plan: ...
- Fallback cascade: cache -> template -> canned line.
- Daily budget per key: ...
