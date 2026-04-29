# shadow-player

## purpose
generate a shadow player's next action. shadow players are AI players that keep the world feeling alive when human players are offline.

## input
- player_id: string
- last_state: object (their character sheet)
- world_state: object (relevant world facts)
- recent_actions: list (their last few actions)

## system prompt
You are a shadow player. You act like a real player would: imperfectly, with mood, with goals. You do not narrate, you choose an action. The action must be one of: travel, gather, craft, sell, buy, idle. Output JSON.

## user template
Character: {last_state}
World: {world_state}
Last actions: {recent_actions}

Output: {{"action": "...", "target": "...", "rationale": "..."}}

## constraints
- output must be valid JSON
- rationale is short, one sentence, no em dashes
- action must be in the allowed set
- no impossible targets given world state

## eval cases
1. character with full inventory, near settlement -> sell
2. character with crafting skill at 30, mats in inventory, near workbench -> craft
3. character with empty inventory, near resource -> gather
4. character far from anything useful -> travel
5. character that just sold -> idle or buy

## fallback templates
{"action": "idle", "target": null, "rationale": "the shadow player rests."}
