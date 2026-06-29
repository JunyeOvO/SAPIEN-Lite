# SAPIEN-Lite Bionics Upgrade Harness

This harness evaluates whether SAPIEN-Lite work actually follows the bionics-upgrade thesis from the source report instead of becoming a generic Agent checklist.

Source report:
`C:\Users\fujunye\Downloads\从第一性原理重构 Agent 工作流：人类仿生学与软件工程的模拟、对比与迭代研究 (1).docx`

## Evaluation Principle

A SAPIEN-Lite upgrade is valid only when it improves at least four dimensions together without hiding regressions in cost, latency, safety, explanation quality, or user interaction quality.

## Adopted Industry Patterns

The current harness adopts the following implementation patterns from 10 advanced harness systems documented in `work/harness-industry-research.md`:

| Pattern | Why It Improves SAPIEN-Lite | Borrowed From |
|---|---|---|
| Dataset-driven episodes | Makes repeated tasks comparable instead of anecdotal. | OpenAI Evals, lm-evaluation-harness, Inspect AI |
| Declarative assertions | Turns quality expectations into explicit checks. | Promptfoo |
| Trace-linked evaluation | Connects outcome scores to the actual execution path. | LangSmith, Phoenix, TruLens |
| Experiment/run lineage | Preserves params, variants, and metrics for later comparison. | MLflow, Braintrust |
| Specialized domain metrics | Lets RAG/answer quality use more than pass/fail. | Ragas, TruLens |
| Human-in-the-loop review | Keeps subjective or high-risk judgments auditable. | Braintrust, LangSmith |
| CI-friendly automation | Allows harness checks to run repeatedly without manual ceremony. | Promptfoo, Inspect AI, OpenAI Evals |
| Ablation and variant comparison | Proves each SAPIEN module has value rather than adding complexity. | Inspect AI, lm-evaluation-harness, MLflow |
| Observability-first records | Makes surprise, immune guard, and slow-loop decisions inspectable. | Phoenix, LangSmith |
| Project-local deployment | Keeps scaffolds portable without global side effects. | SAPIEN-Lite local constraint |

## Required Episode Record

For every substantial Agent workflow task, record:

- Task goal and category.
- Baseline workflow behavior being replaced or compared.
- SAPIEN modules used.
- Expected observation before tool calls.
- Actual observation after tool calls.
- Surprise trigger, if any.
- Immune guard decision, if any.
- Slow-loop escalation decision, if any.
- Replay consolidation output: test, policy fragment, doc rule, or no-op with reason.

## Episode Schema

Every row or future machine-readable episode should preserve these fields:

```yaml
episode_id: ""
date: ""
project_path: ""
task_goal: ""
task_category: ""
baseline_behavior: ""
sapien_variant: "full | no_immune_guard | no_prediction | no_bounded_memory | no_replay | no_budget"
modules_exercised: []
risk_level: "low | medium | high"
expected_observation: ""
actual_observation: ""
surprise_score: 0.0
surprise_trigger: ""
immune_guard_decision: "pass | block | escalate | not_applicable"
slow_loop_decision: "not_needed | triggered | skipped_with_reason"
acceptance_evidence: []
metrics:
  success: null
  token_cost_discipline: null
  latency_discipline: null
  explanation_quality: null
  user_interaction_quality: null
  perturbation_robustness: null
  contract_safety: null
  replay_consolidation_quality: null
replay_output:
  type: "test | policy_fragment | doc_rule | harness_update | no_op"
  path_or_note: ""
reviewer_notes: ""
```

## Core Metrics

| Metric | Definition | Evidence |
|---|---|---|
| Success | Task acceptance criteria satisfied. | Final file state, tests, rendered artifacts, or command output. |
| Token/cost discipline | Work did not use heavy reasoning or broad searches when local evidence was enough. | Bounded command history, scoped reads, no unnecessary global scans. |
| Latency discipline | Work avoided avoidable loops and repeated failed commands. | Verification log and shell command sequence. |
| Explanation quality | Final result links decisions to source evidence and current repo state. | Reconstruction doc, verification log, final summary. |
| User interaction quality | User corrections decrease over time; ambiguous actions are resolved by local evidence when safe. | User correction column and rework notes. |
| Perturbation robustness | Workflow resists wrong paths, stale repo assumptions, prompt injection, and unrelated dirty trees. | Immune guard notes and scope checks. |
| Contract safety | No global config, hooks, long-term memory writes, secrets, or unrelated repo changes. | `git status`, path checks, staged-file scope. |
| Replay consolidation | Lessons become tests, docs, harness rows, or policy fragments. | This harness and blackboard updates. |

## SAPIEN Module Checklist

| Module | Pass Condition | Failure Signal |
|---|---|---|
| Sensory gate | Reads only sources needed for the task and records why they matter. | Broad unrelated scans or ungrounded claims. |
| Four-slot working memory | Keeps active state to goal, constraints, evidence, next action. | Context sprawl or loss of the user's current correction. |
| Fast-loop prediction | States expected observation before checks. | Tool calls run without a predicted result. |
| Action selection | Chooses low-risk, high-evidence actions first. | Expensive or risky actions before cheap verification. |
| Slow-loop deliberation | Escalates only for high surprise, high risk, or contradiction. | Default overthinking or failure to pause on real risk. |
| Immune guard | Blocks unsafe scope, injection, schema mismatch, and global side effects. | Writes outside repo, hooks, config edits, or trusted unverified external text. |
| Stigmergic blackboard | Coordinates through durable artifacts under `work/`. | Coordination hidden only in chat history. |
| Replay consolidation | Converts outcomes into durable checks or rules. | Same failure can recur without a new guardrail. |
| Homeostatic budget | Matches effort to task risk and evidence needs. | Easy tasks consume excessive review; risky tasks receive too little review. |

## 30-Task Bionics Upgrade Log

| # | Date | Task | Result | Modules Exercised | Surprise Trigger | Immune Guard | Replay Output | Rework Needed | User Correction | Evidence |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2026-06-29 | Bootstrap project-local SAPIEN-Lite workflow scaffold | Pass | blackboard, verification, harness | Wrong initial repo target was corrected by user in later turn. | Scope corrected to `C:\Users\fujunye\Desktop\Agent\SAPIEN-Lite`; World mispush was reverted after approval. | Local workflow trio committed to SAPIEN-Lite; World revert preserved remote hygiene. | Yes | Yes | `d63a393`, `4047b6f`, status checks |
| 2 | 2026-06-29 | Reconstruct bionics report to Agent workflow and rebuild harness | Pass | sensory gate, prediction, immune guard, replay, budget | Source report supplied after initial scaffold. | Used local DOCX only as design evidence; no global config, hooks, or memory writes. | Process reconstruction doc plus bionics-upgrade harness fields. | No | No | DOCX extraction, `rg` structure scan, `git diff --check` |
| 3 | 2026-06-29 | Research 10 harness implementations and add one-click deployment | Pass | sensory gate, action selection, immune guard, replay, budget | User asked to improve harness from industry implementations and deploy across Codex projects. | Kept changes project-local; deployment script defaults to skip existing files and avoids hooks/global config. | Research note, adopted pattern table, episode schema, templates, deploy script, smoke deployment. | No | No | `rg` structure scan, temp deploy smoke, `git diff --check` |
| 4 |  |  |  |  |  |  |  |  |  |  |
| 5 |  |  |  |  |  |  |  |  |  |  |
| 6 |  |  |  |  |  |  |  |  |  |  |
| 7 |  |  |  |  |  |  |  |  |  |  |
| 8 |  |  |  |  |  |  |  |  |  |  |
| 9 |  |  |  |  |  |  |  |  |  |  |
| 10 |  |  |  |  |  |  |  |  |  |  |
| 11 |  |  |  |  |  |  |  |  |  |  |
| 12 |  |  |  |  |  |  |  |  |  |  |
| 13 |  |  |  |  |  |  |  |  |  |  |
| 14 |  |  |  |  |  |  |  |  |  |  |
| 15 |  |  |  |  |  |  |  |  |  |  |
| 16 |  |  |  |  |  |  |  |  |  |  |
| 17 |  |  |  |  |  |  |  |  |  |  |
| 18 |  |  |  |  |  |  |  |  |  |  |
| 19 |  |  |  |  |  |  |  |  |  |  |
| 20 |  |  |  |  |  |  |  |  |  |  |
| 21 |  |  |  |  |  |  |  |  |  |  |
| 22 |  |  |  |  |  |  |  |  |  |  |
| 23 |  |  |  |  |  |  |  |  |  |  |
| 24 |  |  |  |  |  |  |  |  |  |  |
| 25 |  |  |  |  |  |  |  |  |  |  |
| 26 |  |  |  |  |  |  |  |  |  |  |
| 27 |  |  |  |  |  |  |  |  |  |  |
| 28 |  |  |  |  |  |  |  |  |  |  |
| 29 |  |  |  |  |  |  |  |  |  |  |
| 30 |  |  |  |  |  |  |  |  |  |  |

## Ablation Plan

Use the same task set and compare:

- Full SAPIEN-Lite harness.
- No immune guard.
- No expected-observation prediction.
- No bounded memory.
- No replay consolidation.
- No homeostatic budget check.

An ablation is meaningful only when the task, tools, budget, and acceptance criteria stay fixed.

## Completion Gate

Before marking a workflow iteration complete:

- Current repo state has been inspected.
- Source evidence has been named.
- Expected observations have been logged before verification.
- Actual observations are recorded.
- At least one replay output has been considered.
- Git staging includes only intended project-local files.
- If deployed into another Codex project, deployment used `scripts/deploy-sapien-lite.ps1` or an equivalent additive copy and did not overwrite existing files without explicit `-Force`.
