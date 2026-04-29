# Economy engine

Deterministic, server-authoritative, server-scoped. Lives in `packages/shared/src/economy/`. Server uses it directly. Client never imports it.

## State

For each (server, item) pair we track:

- `basePrice`: from `packages/game-data/`.
- `supply`: rolling window of inflows (drops, harvests) and current stock at NPCs.
- `demand`: rolling window of outflows (purchases) and pending orders.
- `events`: list of recent narrative-affecting events (raid, harvest festival, etc).

## Price formula (initial, will be tuned)

```
elasticity = itemElasticity(item)           // from game-data
ratio = clamp(supply / demand, 0.25, 4.0)
price = basePrice * (demand / supply) ** elasticity
price = applyEventModifiers(price, events)
price = clamp(price, basePrice * 0.25, basePrice * 4.0)
```

The narrative layer reads these values and asks the LLM to phrase the move ("iron is up because the goblin raid hit the supply chain"). The narrative never modifies the number.

## Faucets and sinks

Every faucet and sink has an explicit handler that records (a) the player or actor, (b) the amount, (c) the reason, (d) a transaction id. The events table is the audit trail.

## Shadow players

Shadow players are economic actors managed by `apps/server/src/jobs/shadow-players.ts`. Their density is a function of human player count: `shadowCount = max(20, 60 - 0.4 * humanCount)`. They do not count toward the cap.

Each shadow has an archetype (arbitrageur, gatherer, crafter, bandit, scout, social) and a deterministic decision policy that runs on a tick. They are not LLM-driven for action selection (cost). They may be LLM-narrated for chat or quest hooks.

## Market-cornering safeguard

A health metric is computed each market tick: spread, concentration of supply by player, price velocity. If health crosses a threshold, the system issues a "Market Maker" event:

- The offending player is offered a powerful rare class.
- They receive rehabilitation quests that drain their excess supply at a discount over time.
- If they accept, rep recovers as quests complete.
- If they ignore the quests, rep collapses.

This logic is entirely deterministic. The LLM only writes the offer text and quest framing.
