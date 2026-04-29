# Playbook: deploy

## Pre-flight

- All tests passing on main.
- Smoke test passes locally.
- Changelog reflects what is shipping.
- Open ADRs reviewed.

## Steps

1. **Tag.** `git tag v0.<phase>.<n>`.
2. **Deploy server.** Fly.io: `fly deploy`. Watch logs for 5 minutes.
3. **Deploy web.** Vercel: auto-deploy on tag push.
4. **Smoke test prod.** Login, walk around, talk to one NPC, buy one item. If any step fails, rollback.
5. **Watch metrics.** Error rate, p95 latency, LLM spend. 30 minutes minimum.
6. **Announce.** Brief note in changelog and any community channel.

## Rollback

- Server: `fly releases` then `fly deploy --image <previous>`.
- Web: Vercel "Promote previous deployment."
- DB: do not rollback the schema unless absolutely necessary; prefer code fix forward.
