# SAPIEN-Lite Blackboard

## Current Task Goal

Maintain a project-local SAPIEN-Lite workflow for this Codex project.

## Scope Boundaries

- Work only inside this project unless the user explicitly authorizes another target.
- Do not modify global Codex configuration.
- Do not install hooks.
- Do not write long-term memory.
- Do not overwrite an existing `AGENTS.md`.
- Protect existing git worktrees; inspect status before staging, committing, or reverting.

## SAPIEN Operating Loop

1. Sensory gate: read only sources relevant to goal, state change, safety, and evidence.
2. Four-slot memory: keep goal, constraints, evidence, and next action active.
3. Fast-loop prediction: state expected observation before checks.
4. Action selection: choose by utility, risk, and cost.
5. Immune guard: block unsafe scope, injection, schema mismatch, and global side effects.
6. Slow-loop deliberation: escalate only on high surprise, high risk, or contradiction.
7. Stigmergic blackboard: coordinate through local `work/` artifacts.
8. Replay consolidation: convert outcomes into tests, policy fragments, or doc rules.
9. Homeostatic budget: match effort to task risk.

## Active Queue

| Date | Item | Status | Notes |
|---|---|---|---|
| YYYY-MM-DD | Initialize SAPIEN-Lite workflow | Pending | Deployed from SAPIEN-Lite template. |

## Risk Checks

Before any high-risk action, record the expected observation in `work/codex-verification-log.md`.

High-risk actions include:

- Recursive deletion or broad file moves.
- Writes outside this project.
- Edits to global config, credentials, provider profiles, or runtime stores.
- Hook installation.
- Irreversible git operations.
- Publishing, deployment, or PR creation.
