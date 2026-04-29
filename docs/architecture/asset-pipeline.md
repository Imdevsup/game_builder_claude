# Asset pipeline

Two pipelines, kept separate.

## Static pipeline

Baked into the build. Lives at `apps/web/public/assets/<category>/`. Categories:

- `tiles/`, tilemap art and individual tiles.
- `sprites/characters/`, player sprites, animations.
- `sprites/monsters/`, monster sprites, animations.
- `sprites/npcs/`, NPC sprites.
- `models/`, low-poly 3D, GLB only.
- `icons/items/`, item icons.
- `icons/skills/`, skill icons.
- `icons/classes/`, class icons (base set; tailored classes use the dynamic pipeline).
- `audio/sfx/`, short SFX, OGG.
- `audio/music/`, loops, OGG.
- `audio/ambience/`, looping ambience, OGG.
- `ui/`, UI chrome, frames, separators.
- `fx/`, particle textures and shaders.

Naming convention is in `docs/conventions/naming.md`. Every asset has a row in `docs/design/11-assets.md` with id, source, license, and where it appears.

## Dynamic pipeline

Runtime-generated assets follow the same template-first principle as the LLM layer.

- **Tailored class icons:** base silhouette + tint + 1-2 overlay glyphs from a small library, composited on the client. Zero generation cost.
- **Legendary item icons:** runtime call to a fast image model (Phase 9+). Cached by item id. Fallback to placeholder.
- **NPC mood portraits:** pre-rendered N moods per NPC (4-6). Swapped at runtime by mood key. No generation at runtime.

## Sourcing rules (Phase 0-5)

- Kenney CC0 packs first. Game-Icons.net for icons.
- Freesound CC0 for ambient audio.
- No AI-generated images during prototype phases. They drift in style and waste time.

## Sourcing rules (Phase 9 polish)

- Replace placeholders selectively, only after systems are stable.
- Style-locked generation only (Scenario.gg or trained LoRAs). Never raw Midjourney/Stable Diffusion default.
- All replacement assets reviewed by `art-director` against `docs/design/01-style-guide.md`.

## Forbidden

- Copyrighted IP (Disney, Marvel, etc).
- Real-person likenesses.
- Style transfer from named living artists.
- Music from streaming platforms.
- AI-generated voice mimicking real actors.
