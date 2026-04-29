# Deliverable 07: Economy spec

**Owner:** `economy-designer`
**Status:** template, not yet filled.

---

## Faucets

[Exhaustive list with rate assumptions.]

## Sinks

[Exhaustive list with rate assumptions.]

## Price formula

[How supply, demand, and AI narrative combine. Pseudocode and 5 worked examples.]

## Shadow player density curve

`shadowCount = max(20, 60 - 0.4 * humanCount)` (tunable)

## Shadow player archetypes

For each: name, behavior on tick, what they buy, what they sell, frequency.

## Reputation math

| Action | Delta |
| --- | --- |
| Successful trade with NPC | +1 per tier of value |
| Failed quest | -5 |
| Theft (PvE corpse loot) | 0 |
| PvP win | -10 against losers' faction |
| Catastrophic act (TBD) | -50, exile threshold |

Thresholds:
- > +50: trusted, discounts and rare hooks
- 0..+50: neutral
- -50..0: cold, surcharges
- < -50: locked out
- < -90: exile

## Market-cornering safeguard

- Health metric: [definition]
- Threshold: [number]
- Offer: Market Maker class + rehabilitation quests
- Failure consequence: rep collapse

## Death loot economy

[What typical PvE deaths return. What PvP deaths redistribute.]

## Insurance slots

[How many, how upgraded, cost.]
