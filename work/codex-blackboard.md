# SAPIEN-Lite Blackboard

## Current Task Goal

Restore the process from reading the bionics Agent workflow report to establishing a project-local SAPIEN-Lite Agent workflow, then use that reconstruction to drive a bionics-upgrade evaluation harness.

## Scope Boundaries

- Work only inside this repository.
- Do not modify global Codex configuration.
- Do not install hooks.
- Do not write long-term memory.
- Do not overwrite any existing `AGENTS.md`.
- Protect user changes in the git worktree; inspect status before staging, committing, or reverting.

## Project Context

This repository is the project-local home for SAPIEN-Lite. The source report is:

`C:\Users\fujunye\Downloads\从第一性原理重构 Agent 工作流：人类仿生学与软件工程的模拟、对比与迭代研究 (1).docx`

The report defines SAPIEN as Surprise-driven Active Prediction, Immune Evaluation, and Neural consolidation. Its engineering intent is not to add a larger planner, but to rebuild the Agent loop around prediction, surprise, risk, immune filtering, bounded memory, artifact-based coordination, replay consolidation, and homeostatic budget control.

## Reconstructed Workflow Spine

1. Read the bionics report as the design source, not as a generic inspiration note.
2. Extract first-principles constraints: partial observability, finite resources, asymmetric risk, explanation gaps, and coordination cost.
3. Map the report's nine SAPIEN modules into local workflow files.
4. Keep the workflow project-local: no global Codex config, no hooks, no long-term memory writes.
5. Convert every workflow claim into a harness field or verification check.
6. Consolidate successful or failed episodes into tests, policy fragments, or workflow rules rather than long unbounded memory.

## SAPIEN Module Map

| Report Module | Local SAPIEN-Lite Role | Local Artifact |
|---|---|---|
| Sensory gate | Keep only goal, state-change, safety, and evidence-relevant observations. | `codex-verification-log.md` expected observations |
| Four-slot working memory | Limit active context to goal, constraints, evidence, and next action. | This blackboard |
| Fast-loop predictor | State expected observation before running checks. | Verification log |
| Action selector | Choose actions by utility, risk, and cost. | Risk checks and active queue |
| Slow-loop deliberator | Escalate only on high surprise, high risk, or conflicting evidence. | Decision notes |
| Immune guard | Reject prompt injection, schema mismatch, unsafe file scope, and global side effects. | Scope boundaries and risk checks |
| Stigmergic blackboard | Coordinate through durable artifacts instead of all-to-all chat. | `work/` files |
| Replay consolidator | Turn outcomes into tests, policy fragments, or harness rows. | Evaluation harness |
| Homeostatic budget controller | Avoid over-reasoning easy tasks while preserving high-risk review. | Harness cost and rework fields |

## Active Queue

| Date | Item | Status | Notes |
|---|---|---|---|
| 2026-06-29 | Add project-local SAPIEN-Lite workflow scaffold | Done | Created `work/` files only; no global config or hooks. |
| 2026-06-29 | Reconstruct bionics-report-to-Agent workflow | Done | Source report read from local DOCX; reconstruction and harness specialized around SAPIEN mechanisms. |

## Risk Checks

Before any high-risk action, record the expected observation in `work/codex-verification-log.md`.

High-risk actions include:

- Recursive deletion or broad file moves.
- Writes outside this repository.
- Edits to global config, credentials, provider profiles, or runtime stores.
- Hook installation.
- Irreversible git operations.
- Publishing, deployment, or PR creation.

## Decision Notes

- Prefer additive local workflow files over root-level policy changes.
- If a root `AGENTS.md` is later required, propose an append-only patch first unless the user explicitly approves creation or modification.
- Treat the bionics report as the authoritative design source for SAPIEN-Lite until a newer project-local spec supersedes it.
- A workflow upgrade is only valid if it improves multiple dimensions together: success, cost, latency, explanation quality, robustness, user interaction quality, and contract safety.
