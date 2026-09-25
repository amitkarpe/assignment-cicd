# AGENTS.md

## Repository Role

`amitkarpe/assignment-cicd` is a small learning/proof repository for GitHub Actions, Terraform/IaC, GitHub OIDC, and bounded AWS experiments.

## Bootstrap / Recovery

For cold start or stale/changed context, read `AGENTS.md`, `CONTEXT.md`, the owning Issue/PR, and `SPEC.md` before any live mutation. For warm continuation, use the named Issue/PR, latest relevant authorized delta, and current HEAD.

## Rules

- Follow KISS: one bounded proof, proportional validation, one usable result.
- Historical capability matrices and successful experiments are evidence, not standing authority for future AWS writes.
- Prefer credential-free PR validation and short-lived OIDC for explicitly authorized live proofs.
- Keep secrets, credentials, account-specific auth state, and raw sensitive provider output out of Git.
- Preserve existing Terraform/workflow code unless the owning Issue authorizes a change.
- A GitHub write or connected AWS tool does not itself authorize cloud mutation.
- Reuse the owning Issue/PR; do not create parallel frameworks or proof paths without a real boundary change.

## Portfolio Economy Defaults

- Testing: default to **zero new tests**. Use the smallest existing validation that can prove the change. Add or modify tests only for a real uncovered regression, contract, security boundary, failure mode, or high-signal isolated logic. Once required checks pass and the changed behavior is proven, **stop**.
- Runners: public repositories may use standard GitHub-hosted runners such as `ubuntu-latest`. Private repositories should avoid GitHub-hosted runners by default and reuse an existing approved CodeBuild/CodePipeline or CodeBuild-hosted Actions runner; do not create new CI infrastructure merely to replace a free public runner.
