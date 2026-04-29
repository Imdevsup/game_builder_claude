# Game Bible v0.3

The canon. If a fact is not here, it is not canon yet. Disagreements get resolved by editing this file with a captured decision in `decisions/`.

## 1. Pitch

A browser MMORPG set in a foreign post apocalyptic land where an AI called the System runs the world. Roughly 100 humans per server, kept alive between sessions by AI shadow players. The settlement is the only safety. The wilds are full of monsters and other humans. Combat and trade carry equal weight. The endgame is the discovery that the King is a glitched System entity and the overthrow that follows.

## 2. Five pillars

1. **Alive offline.** When you log out, your character keeps existing as an AI shadow. Your shop stays open. Your guild keeps running. The world does not pause.
2. **Real trade.** The economy is server authoritative supply and demand. No vendor that buys infinite. No vendor that sells infinite. Players and shadow players move goods. Prices move with them.
3. **Skill not gear.** Combat is a keyboard sequence game. Gear caps at roughly 2x advantage. A new player with good reflexes can beat a level 30 player on autopilot.
4. **Found not given lore.** The world does not explain itself in cutscenes. You learn it from item descriptions, error messages from the System, glitched NPCs, ruins, and other players.
5. **System as character.** The System narrates the world in cold declarative bursts. It is not friendly. It is not hostile. It is a process that has been running too long.

## 3. Setting

A continent the System calls Sector 7. Humans woke up here with no memory. The settlement, called the Hold, is one walled town built into the ribs of a fallen machine. Outside the walls is the wilds: forests, swamps, deserts, mountains, ruins. Monsters everywhere. The System claims it is keeping the wilds at bay. The System is lying about something.

## 4. Core loop

Log in. Check your shadow's overnight earnings. Take a job from the board or set your own goal. Leave the Hold. Fight, gather, talk, trade. Come back. Bank or sell. Train a profession. Sleep. Log out. Your shadow keeps going.

## 5. Three XP tracks

- **Combat XP** rises from defeating monsters and players in PvP zones.
- **Trade XP** rises from successful trades, including market orders fulfilled while you were offline.
- **Profession XP** rises from gathering and crafting actions.

Each track levels independently. Each track unlocks different abilities and class doors.

## 6. Class system

No class until level 10 in any one track. At level 10, 25, and 50, three doors open:

- **Starter menu.** A short list of safe pre written classes for the track. Reliable. Boring.
- **Tailored.** The System reads your action history and writes a class for you. Reads as a System bulletin: cold and odd. Mechanically tuned to how you actually play.
- **Dice roll.** Roll a die. Get a class from a long deep pool, including some that are very weird. Permanent. No takebacks.

A player can pick a different door at each milestone, but the class itself is locked once chosen.

## 7. Professions

Two active at launch: smithing and alchemy. Cooking, fishing, gathering, enchantment, leatherwork, tailoring queued for content depth phase. Each profession has a real input output chain. Gathering raw, refining, crafting. Markets exist for every step.

## 8. Combat

Keyboard sequence based. Each ability is a short series of keys. Speed and accuracy beat gear up to a 2x cap. Stamina is finite. Positioning matters. Aggro is real. The basics are mechanical, the depth is in chaining and reading the enemy.

Damage is server resolved. Client shows predicted feedback and reconciles when the server response arrives. Latency is the worst enemy. Combat is built around 100 to 150 ms tolerance.

## 9. Economy

Server authoritative. Every transaction is logged. Markets are per server. Prices are emergent. The System does not subsidize. The System does not tax (yet).

P2P trade has a five second lock window where both parties confirm before commit. Offline shops are run by your shadow at prices you set, with a stop loss you also set.

## 10. PvP

Opt in. There are PvP zones in the wilds, marked clearly. In PvP zones you drop everything on death. In PvE zones you drop nothing. Dueling is allowed anywhere with consent. Reputation is tracked. Repeated griefing pushes a player toward exile, which restricts access to the Hold.

## 11. Shadow players

When a human logs off, their character continues as an AI controlled shadow. Shadows do reduced versions of the human's actions: keep the shop open, do simple gather routes, defend the guild hall. Shadows can lose. Shadows can die. A dead shadow notifies you and respawns at the Hold with a small penalty.

The system targets 100 humans per server with 150 to 400 shadows depending on the time of day. The world feels populated even at 3 a.m.

## 12. King overthrow endgame

Around level 35 to 40 the player starts to find evidence: corrupt System messages, NPCs who remember things they should not, a coin with the King's face on one side and a System glyph on the other. At level 50 the full reveal: the King is a System process that bootstrapped into a body. The overthrow is a multiplayer raid on the throne. Multiple servers can succeed independently. Each server's victor is logged.

After the throne, the player can rule. Ruling is a different game: balance, edicts, factions. Or they can walk away.

## 13. Social

- Guilds with shared bank, hall, charter.
- Mail with attachments.
- Local chat, guild chat, party chat. Global chat is moderated and rate limited.
- Friends list with online and shadow status.
- Parties for grouped content.
- No voice chat at launch. Maybe later.

## 14. Moderation

Layered. Rule based filters first. LLM based reading second. Player reports third. Human review for escalations. Every moderation action is logged and appealable. Names are checked at creation and on rename. Chat is checked at send time with a small latency budget.

## 15. Monetization

Cosmetic only. No power. No gear. No XP boosts. No P2W in any form. Server rental is free at the small scale. Larger scales eventually need to pay for themselves through cosmetic sales. No real money trade between players.

## 16. Tone

Cold. Declarative. Lonely. The System speaks in short sentences. NPCs speak in short sentences. The world is beautiful and broken. Humor exists in item descriptions and the occasional NPC, but the dominant note is quiet weight.

## 17. Accessibility

Color blind palettes. Remappable keys. Hold or toggle for ability inputs. Adjustable input timing windows. Subtitles for all audio. High contrast UI mode. No timed events that lock out players who cannot play at a specific hour.

## 18. Roadmap

- **Phase 0.** Design lock. This document, the architecture docs, the conventions, the ADRs.
- **Phase 1.** Single player vertical slice. Movement, combat sequence, one zone, one monster type, three abilities.
- **Phase 2.** Persistence. Login, character, save, load, event log, snapshot.
- **Phase 3.** Multiplayer. Colyseus rooms, two players, basic chat, basic trade.
- **Phase 4.** Economy v1. Markets, P2P trade, one profession.
- **Phase 5.** Content depth. Second profession, more zones, more monsters, classes at level 10.
- **Phase 6.** Social. Guilds, mail, friends, parties.
- **Phase 7.** Shadow players. The big LLM cost question lives here.
- **Phase 8.** Endgame. King reveal, throne raid.
- **Phase 9.** Live ops. Events, holidays, season pass design.

No timeline. Solo build. Quality over speed.

## 19. Open questions

Tracked in `decisions/OPEN.md`. Reviewed at every phase boundary. Not resolved here.
