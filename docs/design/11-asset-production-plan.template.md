# Deliverable 11: Asset production plan

**Owner:** `art-director + asset-pipeline-engineer`
**Status:** template, not yet filled.

---

## Asset inventory

| asset_id | category | description | where used | source | priority | format | budget |
| --- | --- | --- | --- | --- | --- | --- | --- |
| spr_player_idle | sprite | base player idle | scenes/Settlement | kenney | P0 | png | 50KB |
| ... | ... | ... | ... | ... | ... | ... | ... |

## Style lock

For each AI-generated category:
- Prompt template
- Reference seeds
- Palette tokens (from 01)
- Forbidden elements
- Acceptance criteria

## Runtime asset spec

For every dynamic asset:
- Template structure
- Parameter ranges
- Cache key strategy
- Fallback placeholder

## Audio cue list

Every SFX and music moment with mood, length, loop/oneshot, trigger location.

## Folder structure

[As defined in `docs/architecture/asset-pipeline.md`.]

## Naming convention

[As defined in `docs/conventions/naming.md`.]

## Versioning

[Asset version bumped only when contract changes (e.g., spritesheet layout). Otherwise overwrite in place.]
