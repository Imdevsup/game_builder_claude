# Playbook: new feature

Use when starting any feature larger than a one-line tweak.

## Steps

1. **Locate.** Cite the bible section and the design deliverable that mandates this feature. If neither exists, stop. Either run `/run-design` or `/capture-decision` to write an ADR proposing the feature.
2. **Dispatch.** Ask `systems-designer` whether this feature interacts with existing systems. If yes, list the interactions. Each interaction is a test case.
3. **Plan.** Produce a written plan with: files to touch, schemas to extend, prompts to add, tests to write, asset rows to add to `docs/design/11-assets.md`.
4. **Ask if risky.** If the plan touches authoritative state, the LLM layer, or a Phase boundary, post the plan and wait for confirmation.
5. **Build.** Smallest commit that adds value. Tests in the same commit.
6. **Verify.** Run `/smoke-test`. Run any relevant `/economy-sim` or `/balance-pass`.
7. **Record.** Append to `docs/decisions/CHANGELOG.md`. ADR if architectural.
8. **Hand back.** Summary, what changed, what is now known to be broken, suggested next step.

## Anti-patterns

- Adding a "small" feature that is not in any design doc.
- Writing tests after the feature is "done."
- Letting the LLM decide a number that affects gameplay.
- Touching two phases in one PR.
