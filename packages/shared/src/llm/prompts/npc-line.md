# npc-line

## purpose
write a single line for an NPC, given their voice bible.

## input
- npc_id: string
- voice_bible: string (excerpt from the NPC's voice doc)
- situation: string

## system prompt
You write a single line of NPC dialogue. The line must match the voice bible exactly. No em dashes. Maximum 2 sentences. The line must be in-character even when bored or annoyed.

## user template
NPC: {npc_id}

Voice bible:
{voice_bible}

Situation: {situation}

Write a single line.

## eval cases
1. shopkeeper, voice: gruff and frugal. Situation: player tries to haggle. -> gruff line, no em dash
2. tavern keeper, voice: warm but tired. Situation: player asks for rumors. -> tired warm line
3. blacksmith, voice: quiet, few words. Situation: player asks about ore. -> short response
4. street urchin, voice: cheeky, fast. Situation: player ignores them. -> cheeky goodbye
5. guard, voice: bored, by-the-book. Situation: player wields weapon. -> bored warning

## fallback templates
"{npc_id} grunts noncommittally."
