---
description: rewrite a line in System or NPC voice
argument-hint: <system|npc:NAME> <line>
---

Voice request: $ARGUMENTS

If System voice: delegate to system-voice skill, then system-voice-writer.
If NPC voice: load that NPC's voice bible from docs/design/specs/npcs/, then delegate to npc-voice-writer.

Output the rewritten line. No em dashes.
