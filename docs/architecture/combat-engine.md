# Combat engine

Keyboard-sequence combat. Lives in `packages/shared/src/combat/`. Authoritative on server.

## Encounter shape

```
Encounter
  monsterId
  playerId
  classId
  gearMods
  difficulty
  sequence: KeyEvent[]
  hp: { player, monster }
  startedAt
```

A `KeyEvent` is `{ key: KeyChar, atMs: number, leniencyMs: number }`. The full sequence is generated up front from a deterministic PRNG seeded with the encounter id, so it is auditable.

## Generation

Inputs:

- Monster archetype: drives base length, key alphabet, tempo curve.
- Player class: modifies length, may shrink alphabet.
- Gear: rare items can pre-reveal keys, slow tempo, or add leniency.
- Player Combat XP: very small modifier on leniency.
- Difficulty (biome depth): scales tempo.

Output: a `KeyEvent[]` and an HP profile.

## Resolution loop

- Player presses a key. Client sends `CombatInputMessage(encounterId, key, clientTs)` to server.
- Server checks: encounter still active, player still alive, key matches the next pending event within window.
- Hit: damage to monster, advance pointer.
- Miss: damage to player, advance pointer (no soft-fail).
- On HP zero: end encounter. Compute drops via deterministic loot roll. Award XP.

## Boss differences

The King fight is the same engine with three twists:

1. **Phases.** The fight has 3-5 phases. Each phase has its own sequence and HP pool.
2. **Hinder items.** Specific crafted items can disable a phase entirely or trivialize it.
3. **Group play.** Multiple players can join the same `BossRoom`. The sequence becomes interleaved across players. Coordination matters.

## Determinism

Every encounter is fully deterministic given (encounterId, monsterId, classId, gearMods, difficulty, playerCombatXp, randomSeed). This makes replay, audit, and balance simulation possible.
