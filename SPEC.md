# Specification

Status: ACTIVE
Context: PERSONAL / LAB

## Authorized Now

- repository documentation/governance updates;
- credential-free static/CI validation of those updates.

## Not Authorized By Default

- live AWS mutation;
- IAM/OIDC trust or permission widening;
- Terraform apply/destroy/state/import;
- S3/SSM resource creation/deletion;
- production or work-account activity.

A future live proof must be owned by an explicit Issue/current user instruction that states the exact environment, intended mutation, no-go boundaries, verification, and cleanup/retention expectation.

## Stop Gates

Stop for repository/account/Region mismatch, missing current authentication proof, broader permissions than the owning Issue allows, destructive or production impact, or failed required validation.
