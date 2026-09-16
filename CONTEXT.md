# Context

Status: ACTIVE
Updated: 2026-09-17

> Current-only restart state. Keep experiment history in Git and owning Issues/PRs.

## Project Identity

- Repository: `amitkarpe/assignment-cicd`
- Purpose: small GitHub Actions + Terraform/IaC + OIDC/AWS learning repository.
- Current merged `main`: `612f24455a09ba725440835af35cf99b0a833795`.

## Current Truth

- Historical proofs include GitHub read/write, bounded AWS MCP operations, GitHub OIDC federation, and Terraform provisioning through an OIDC workflow.
- `CHATGPT_AWS_CAPABILITY_MATRIX.md` records what was tested at the time; it is evidence, not current authorization or current-session authentication proof.
- New live AWS work must re-verify current identity/Region and use an owning Issue/SPEC with exact scope.

## Active Work

- Issue #4 — add minimal repository authority/restart contracts.

## Next Action

Review Issue #4 / its PR. For any later live AWS milestone, open or reuse a bounded Issue and update `SPEC.md` before mutation.

## Continuation

Use the named Issue/PR, latest relevant authorized delta, and current HEAD for warm continuation. Reload wider context only on a real bootstrap/recovery trigger.
