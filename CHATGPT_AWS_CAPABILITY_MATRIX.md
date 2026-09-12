# ChatGPT + AWS capability matrix

Purpose: record what was actually tested from ChatGPT chat and what remains a separate execution path.

## Verified from this ChatGPT session

| Path | Status | Evidence |
|---|---|---|
| ChatGPT -> GitHub read | PASS | Repository and files readable through connected GitHub app |
| ChatGPT -> GitHub write | PASS | Branch and workflow file created through connected GitHub app |
| ChatGPT -> AWS MCP read | PASS | STS, EC2, S3, IAM, Lambda, CloudFormation, ECS, ECR, SSM, CloudWatch, DynamoDB and Logs reads succeeded |
| ChatGPT -> AWS MCP write | PASS | Temporary SSM parameter created, read, deleted and verified absent |
| GitHub Actions -> AWS via OIDC | READY FOR CI PROOF | Existing GitHub OIDC provider found; dedicated IAM role created for this repository |
| ChatGPT -> Terraform/IaC -> GitHub Actions -> AWS | NOT YET TESTED | Recommended next milestone after OIDC proof |
| ChatGPT Sites direct creation from this chat | NOT AVAILABLE IN THIS SESSION | No Sites creation/publish tool is exposed to this chat; use Sites/Work/Codex surface when available |

## AWS MCP capability shape

AWS Managed MCP Server is not a fixed small list of service wrappers. The current AWS MCP toolset exposes a sandboxed `run_script` primitive that can call AWS APIs through `call_boto3`. AWS documentation states the managed server can generate and execute calls across more than 15,000 AWS APIs. Actual success is still constrained by:

1. operation support in the MCP/SDK layer;
2. AWS service/region availability;
3. the authenticated principal's IAM/SCP/resource-policy permissions;
4. client confirmation/approval behavior for consequential actions.

The current session authenticated as IAM user `devsecops` in account `063884340510`.

## Controls available

- Normal IAM identity policies, permissions boundaries, SCPs and resource policies.
- MCP-specific condition keys:
  - `aws:ViaAWSMCPService`
  - `aws:CalledViaAWSMCP`
- These make it possible to allow or deny actions specifically when invoked through an AWS managed MCP server while leaving normal console/CLI access unchanged.
- CloudTrail can record downstream AWS API activity.
- GitHub Actions can use OIDC instead of long-lived AWS access keys.

## Current lab OIDC role

Role: `github-actions-assignment-cicd-chatgpt-lab`

Trusted GitHub subjects:

- `repo:amitkarpe/assignment-cicd:pull_request`
- `repo:amitkarpe/assignment-cicd:ref:refs/heads/main`

The role is intentionally limited to temporary SSM parameters under:

`/chatgpt-aws-lab/github-oidc-proof*`

This is enough to prove GitHub Actions -> AWS federation without granting general infrastructure mutation.

## Recommended operating model

Use two AWS paths rather than choosing only one:

1. **Direct AWS MCP** for discovery, verification, diagnostics, and bounded interactive operations.
2. **GitHub + IaC + OIDC** for durable infrastructure creation and changes that should remain reproducible and reviewable.

A future ChatGPT Site can become the UI/control plane and trigger the same GitHub or backend workflows, but Sites should not replace the durable IaC source of truth.
