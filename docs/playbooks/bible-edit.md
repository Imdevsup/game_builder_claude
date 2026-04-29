# Playbook: bible edit

The bible is the source of truth. Edits are rare and considered.

## Steps

1. **Discuss.** Open an ADR proposing the change. Include rationale and impact list.
2. **Wait for explicit human approval.** Do not edit the bible on your own initiative.
3. **Edit.** Bump the version. Update the affected section.
4. **Cascade.** Identify every design deliverable, architecture doc, and code path that the change invalidates. List them in the ADR.
5. **Open follow-up tickets** for each cascading change.
6. **Record.** Changelog entry. Move the ADR to `accepted`.
