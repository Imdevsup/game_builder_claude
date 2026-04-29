# Client architecture

React 18 + Vite + TypeScript. Renderer is Phaser 3 (2.5D) or three.js (3D), decided by `docs/design/01-style-guide.md`.

## Shape

```
apps/web/src/
  main.tsx              # Vite entry
  App.tsx               # router shell + global providers
  net/
    colyseus.ts         # client SDK wrapper
    rooms/              # typed room handles per room type
  state/                # Zustand stores, one per domain
    player.ts
    inventory.ts
    chat.ts
    world.ts
  scenes/               # Phaser or three scenes
    SettlementScene.ts
    WildsScene.ts
    CombatScene.ts
    BossScene.ts
  ui/                   # React components
    hud/
    panels/
    modals/
    chrome/
  hooks/
  styles/
  assets/               # imported by Vite, not the static /public/assets
```

## Rules

- Renderer code never imports from React tree, only from Zustand stores and event buses.
- React UI never reaches into Phaser/three internals. It reads from stores and dispatches actions.
- One Zustand store per domain. Never a god-store. Cross-domain reads happen via selectors.
- Any prediction logic lives next to the renderer. Reconciliation lives in the net layer.
- All server messages have typed handlers generated from `packages/shared`.

## Performance budgets

- First meaningful frame: < 3 seconds on a typical laptop on broadband.
- Settlement scene: 60fps with 30 visible players + NPCs.
- Memory: < 400MB heap after 30 minutes of normal play.
