# Ecosystem catalog

The full set of free tools, frameworks, MCP servers, asset sources, LLM providers, and hosting tiers that this project draws on. Updated April 2026. Re-verify rate limits before betting on a tier; free-tier policies move.

When agents need to recommend or pick a tool, they read this catalog first. When `tech-lead` evaluates a new dependency, the candidate is compared against entries here.

---

## 1. MCP servers wired into `.mcp.json`

These are the servers Claude Code can call directly. All free or have free tiers.

| Server | Purpose | License | Auth |
| --- | --- | --- | --- |
| filesystem | Local file ops with configurable access controls | MIT, Anthropic reference | None |
| github | Repos, PRs, issues, code search | MIT, Anthropic reference | GitHub PAT |
| supabase | DB schema, RLS, auth, edge functions | Apache-2.0, Supabase official | Supabase access token |
| context7 | Live, version-specific library docs (React, Phaser, Colyseus) | MIT, Upstash | None for public packages |
| fetch | Web fetch + markdown conversion | MIT, Anthropic reference | None |
| brave-search | Real-time web search | Apache-2.0, Brave official | API key, 2K queries/mo free |
| sequential-thinking | Structured multi-step reasoning | MIT, Anthropic reference | None |
| memory | Persistent knowledge graph across sessions | MIT, Anthropic reference | None, local |
| playwright | Browser automation, E2E tests, screenshots | Apache-2.0, Microsoft official | None, local |
| altab | Structural codebase intelligence layer | Altab | API key |

## 2. MCP servers worth adding later

Not wired by default but trivially added to `.mcp.json` when needed.

| Server | Purpose | When to add |
| --- | --- | --- |
| postgres (read-only) | Run SQL against the live DB | Phase 6+, debugging economy state |
| docker | Manage local containers | When local dev needs a Redis, Mailhog, etc |
| chrome-devtools | Direct Chrome control for perf profiling | Phase 9 polish |
| puppeteer | Alternative to Playwright | If Playwright misbehaves |
| firecrawl | Web scraping at scale | Asset sourcing, market research |
| time | Timezone-aware utilities | Cross-server scheduling |
| git | Repo ops independent of GitHub | When working offline |

Install pattern:
```bash
claude mcp add <name> -- npx -y <package>
```

---

## 3. Game framework stack (locked, see ADR 0001)

| Layer | Choice | License | Why |
| --- | --- | --- | --- |
| Realtime server | Colyseus 0.17+ | MIT | Authoritative rooms, schema sync, mature, Node-native |
| Renderer (2.5D) | Phaser 4 | MIT | Phaser 4 ships AI-ready, fastest 2D web renderer, huge ecosystem |
| Renderer (3D) | three.js (r170+) | MIT | If we go low-poly 3D |
| Frontend | React 18 + Vite + TypeScript | MIT | Owner has fluency, ecosystem is unbeatable |
| Server runtime | Node 20 LTS, ESM only | MIT | Stable, TypeScript-first |
| HTTP framework | Hono | MIT | Fast, modern, edge-friendly |
| State (client) | Zustand | MIT | Minimal, no provider hell |
| ORM | Drizzle | Apache-2.0 | Type-safe, lightweight, real SQL |
| Auth | Lucia | MIT | Minimal, server-first session auth |
| Validation | Zod | MIT | One schema, both sides |
| Audio | Howler.js | MIT | Cross-browser, easy |
| Linter | ESLint 9 flat config + Prettier | MIT | Standard |
| Tests | Vitest | MIT | Fast, ESM-native |
| Package manager | pnpm 9 | MIT | Workspaces, fast |
| Logger | Pino | MIT | Fast structured JSON |
| Process supervisor | PM2 (dev only) | AGPL/Free | Local restart on crash |

## 4. Reference projects worth studying (not copied)

| Project | Why study | License |
| --- | --- | --- |
| Reldens | Open-source MMORPG on Colyseus + Phaser | MIT |
| Kaetram | Open-source 2D MMO, simple architecture | MPL-2.0 |
| BrowserQuest | Mozilla's classic, still readable | MPL-2.0 |
| basic-mmo-phaser (Jerenaux) | Minimal multiplayer Phaser example | MIT |
| dwdgame (Pastorini) | Colyseus + Phaser MMORPG starter | MIT |
| Phaser 4 examples | Official samples, AI-ready skill files included | MIT |

We do not adopt any of these wholesale. Their architectures predate the AI-native premise of this project and would constrain pillar #1.

---

## 5. LLM providers (free tiers)

Stack these for capacity. Every call goes through the abstraction layer; the abstraction does the routing.

| Provider | Free tier | Best for | Catch |
| --- | --- | --- | --- |
| Google AI Studio (Gemini 2.5 Flash) | 10-15 RPM, 1M context, multimodal | Long-context tasks, default novel-content path | Data may train (opt out) |
| Groq | 30 RPM, 6K TPM, 14,400 req/day per model, 300+ TPS | Latency-critical NPC dialogue | Open-source models only (Llama, Qwen) |
| Cerebras | 30 RPM, 1M tokens/day | Batch generation (rumors, lore) | 8K context cap on free tier |
| OpenRouter | ~30 free models, ~20 RPM each | A/B testing models, hobby fallback | Variable availability |
| Mistral | 1B tokens/month | Codestral for tooling, broad model access | 2 RPM is binding |
| Cloudflare Workers AI | 10K neurons/day | Edge-deployed inference | Smaller models |
| GitHub Models | 100+ models, daily limits | Quick experiments | Tied to GitHub identity |

**Default routing (suggested in our LLM layer):**
- `npc.dialogue` → Groq (Llama 3.3 70B) for speed, Gemini Flash as fallback.
- `system.announce` → Gemini Flash (style consistency on a single provider matters more than speed).
- `economy.narrate-price` → Groq (short, fast, very cacheable).
- `class.tailor-flavor` → Gemini Flash (longer reasoning, used rarely).
- `rumor.generate` → Cerebras (batch-friendly, runs once per market tick).
- `quest.frame` → Gemini Flash.

**The free-tier limit at scale:** Gemini Flash at 10-15 RPM will not survive 100 concurrent humans plus shadow players. Plan a paid migration before Phase 7. Local Llama (via Ollama) on a beefy box is a viable fallback.

## 6. Hosting (free tiers)

| Service | Free tier | Good for |
| --- | --- | --- |
| Vercel | Hobby tier, fast deploys | Web client |
| Fly.io | 3 shared-cpu-1x machines, 3GB volumes | Game server (Colyseus) |
| Cloudflare | Workers, Pages, R2, KV, generous | CDN, edge functions |
| Supabase | 2 free projects, 500MB DB, 50K MAU auth, 1GB storage | DB, auth, storage |
| Neon | Free Postgres, branchable | Alternative to Supabase DB |
| Upstash | Free Redis tier | Cache, rate limiting |
| Sentry | 5K errors/month | Error tracking |
| PostHog | 1M events/month | Analytics + feature flags |
| Railway | Trial credits | Quick experiments |

## 7. Asset sources (CC0 first)

Listed in the order the `asset-scout` agent searches.

| Source | License | Strength | URL |
| --- | --- | --- | --- |
| Kenney (kenney.nl) | CC0 | The default. 60K+ assets, consistent style, 2D and low-poly 3D | https://kenney.nl/assets |
| Game-Icons.net | CC-BY 3.0 | 4000+ flat icons for skills, items, classes | https://game-icons.net/ |
| OpenGameArt | mixed CC0/CC-BY/GPL | Largest single repository, search is rough | https://opengameart.org/ |
| Quaternius | CC0 | Low-poly 3D characters, environments, animals | https://quaternius.com/ |
| Poly Haven | CC0 | HDRIs, PBR materials, models | https://polyhaven.com/ |
| ambientCG | CC0 | 2000+ PBR materials | https://ambientcg.com/ |
| Sketchfab (filtered) | mixed | Browseable 3D, filter by Downloadable + license | https://sketchfab.com/ |
| Mixamo | free | Rigged character animations | https://www.mixamo.com/ |
| LPC (Liberated Pixel Cup) | CC-BY-SA / GPL | Top-down 2D character spritesheets | OpenGameArt, search "LPC" |
| Universal LPC Sprite Generator | CC-BY-SA | Generate compatible LPC characters | https://sanderfrenken.github.io/Universal-LPC-Spritesheet-Character-Generator/ |

## 8. Audio sources

| Source | License | Strength |
| --- | --- | --- |
| Freesound.org | CC0 / CC-BY | The largest sound effect library |
| Pixabay Audio | Pixabay (CC0-like) | SFX and music |
| Incompetech (Kevin MacLeod) | CC-BY 4.0 | Iconic free music library, attribution required |
| BBC Sound Effects (research-only) | Personal use | Reference for ambience |
| Soundimage (Eric Matyas) | CC-BY 4.0 | Free music in many genres |
| ElevenLabs SFX | free tier | Generate gap-filler sound effects |
| Suno / Udio | trial credits | Generate placeholder music tracks |

We do not use commercial music platforms or AI voice clones of real actors.

## 9. Fonts

| Source | License | Strength |
| --- | --- | --- |
| Google Fonts | OFL / Apache | Default. Pick from `apps/web/public/fonts` after design 01. |
| Fontsquirrel | mixed | Filter by 100% free for commercial |
| Bedstead, Cozette, Press Start 2P | OFL | Pixel/retro fonts, common in game UI |

---

## 10. Game-specific libraries (Phase-by-phase install hints)

| Library | License | Use | Phase |
| --- | --- | --- | --- |
| `@colyseus/schema` | MIT | State sync schemas | 0 |
| `nanoid` | MIT | Short ids | 0 |
| `zod` | MIT | Validation, all message edges | 0 |
| `seedrandom` | MIT | Deterministic PRNG for combat sequences | 3 |
| `pathfinding.js` | MIT | A* on tile maps if Phaser path is needed | 1 |
| `flatbush` / `rbush` | MIT/ISC | Spatial index for proximity queries | 3 |
| `simplex-noise` | MIT | World generation for biome variation | 6 |
| `tweenjs` | BSD | UI tween for HUD bits | 1 |

---

## 11. Tooling (dev-time)

| Tool | License | Use |
| --- | --- | --- |
| Biome | Apache-2.0 / MIT | Optional, faster ESLint+Prettier alternative |
| Tiled Map Editor | GPL/BSD | Visual tilemap design |
| LDtk | MIT | Modern level editor for 2D |
| Aseprite | paid (or build from source) | Pixel art editing |
| Blender | GPL | 3D modeling, free |
| Audacity | GPL | Audio editing |
| reaper | free trial | Audio production |
| OBS Studio | GPL | Recording playtests |

---

## 12. What we are not using and why

| Thing | Why not |
| --- | --- |
| Unity / Unreal | Not browser-native; over-spec for our scope; closed ecosystem |
| Express | Old, slow ecosystem; Hono/Fastify are better in 2026 |
| MongoDB | We need transactions and joins for the economy; Postgres wins |
| Firebase | Vendor lock-in, expensive at scale, less flexible than Supabase |
| Socket.io | Colyseus already gives us state sync, matchmaking, rooms |
| Redux | Zustand is enough for this scale |
| GraphQL | Overkill for our shape; Colyseus + Hono REST is cleaner |
| Web3 | The pillar list explicitly excludes monetization gimmicks |
| Pay-to-win cosmetic shops | Pillar #5 (real stakes). Cosmetics-only or nothing |

---

## 13. Update process

When a free tier changes (and they do), the `ecosystem-curator` agent updates this file. Anyone proposing a new dependency must compare against this catalog and write an ADR if the catalog does not already endorse the choice.
