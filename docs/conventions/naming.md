# Naming

## Files

- Components: `PascalCase.tsx`.
- Hooks: `useThing.ts`.
- Domain modules: `kebab-case.ts`.
- Schemas: `kebab-case.schema.ts`.
- Tests: alongside source as `name.test.ts` or `name.spec.ts` for end-to-end.

## Identifiers

- Functions and variables: `camelCase`.
- Types and classes: `PascalCase`.
- Constants: `SCREAMING_SNAKE_CASE` only for true constants. Otherwise `camelCase`.
- React components: `PascalCase`.

## Game entities

- Class ids: `cls_<snake>`. Example: `cls_warrior_t1`, `cls_market_maker`.
- Profession ids: `prof_<snake>`. Example: `prof_smith_t2`.
- Monster ids: `mon_<snake>`. Example: `mon_dust_wolf`.
- NPC ids: `npc_<snake>`. Example: `npc_blacksmith_garra`.
- Item ids: `itm_<snake>`. Example: `itm_iron_ingot`.
- Recipe ids: `rec_<output_id>`. Example: `rec_iron_sword`.
- Quest ids: `qst_<snake>`. Example: `qst_king_breadcrumb_03`.
- Skill ids: `skl_<snake>`. Example: `skl_haggle`.

## Assets

- Sprites: `<category>_<id>_<frame>.png`. Example: `mon_dust_wolf_idle_01.png`.
- Models: `<category>_<id>.glb`. Example: `npc_blacksmith.glb`.
- Audio: `<bucket>_<name>.ogg`. Example: `sfx_combat_hit_metal.ogg`, `mus_settlement_day.ogg`.
- Icons: `icn_<bucket>_<id>.svg`. Example: `icn_item_iron_ingot.svg`.

## Prompt keys

- `<area>.<intent>`. Example: `npc.dialogue`, `system.announce`, `economy.narrate-price`, `class.tailor`.
