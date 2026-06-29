# Codex Blackboard

## Current Task Goal

Maintain a project-local SAPIEN-Lite workflow in this repository.

## Scope Boundaries

- Work only inside this repository.
- Do not modify global Codex configuration.
- Do not install hooks.
- Do not write long-term memory.
- Do not overwrite any existing `AGENTS.md`.
- Protect user changes in the git worktree; inspect status before staging, committing, or reverting.

## Project Context

This repository is the project-local home for the SAPIEN-Lite workflow scaffold. Keep the workflow lightweight, file-based, reversible, and auditable.

## Active Queue

| Date | Item | Status | Notes |
|---|---|---|---|
| 2026-06-29 | Add project-local SAPIEN-Lite workflow scaffold | Done | Created `work/` files only; no global config or hooks. |

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
