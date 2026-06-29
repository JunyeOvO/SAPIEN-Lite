# Harness Industry Research Notes

This note records 10 advanced harness implementations and the design patterns adopted into SAPIEN-Lite.

## Selection Criteria

- The system is widely used or maintained as a serious evaluation/observability framework.
- It offers a reusable harness concept: datasets, evaluators, scorers, traces, experiments, assertions, or CI automation.
- It contributes at least one pattern that improves SAPIEN-Lite beyond a manual checklist.

## 10 Systems Surveyed

| # | System | Strength To Absorb | SAPIEN-Lite Adaptation |
|---|---|---|---|
| 1 | OpenAI Evals | Registry-style evals, repeatable datasets, model-graded or custom graders. | Keep episodes dataset-like and make pass/fail evidence explicit. |
| 2 | Promptfoo | Declarative test cases, assertions, red-team style checks, CI-friendly runs. | Add explicit expected observations and contract-safety assertions. |
| 3 | LangSmith Evaluation | Dataset runs, evaluators, traces, comparative experiment views. | Link every score to evidence and execution path, not just a final note. |
| 4 | Braintrust | Experiments, scorers, human review loops, prompt/application iteration tracking. | Preserve run lineage and allow human judgment for subjective quality. |
| 5 | Ragas | RAG-specific metrics such as faithfulness, answer relevancy, context precision/recall. | For knowledge tasks, score evidence alignment separately from final success. |
| 6 | Arize Phoenix | LLM tracing, evals, datasets, span-level observability. | Make surprise, immune guard, and slow-loop decisions traceable. |
| 7 | TruLens | Feedback functions, groundedness, context relevance, tracking. | Add specialized feedback dimensions for explanation and evidence grounding. |
| 8 | Inspect AI | Dataset/task/solver/scorer abstraction, sandboxing, parallel eval execution. | Treat SAPIEN modules as variants for ablation and reproducible comparison. |
| 9 | EleutherAI lm-evaluation-harness | Broad task registry, few-shot controls, model/backend normalization. | Keep task categories and variants normalized so comparisons stay fair. |
| 10 | MLflow GenAI Evaluation | Runs, scorers, traces, experiment comparison, metric history. | Persist params, variants, and scores so the harness can improve over time. |

## Patterns Adopted

### 1. Dataset-First Episodes

Manual task logs become comparable only when each episode preserves task category, baseline behavior, variant, expected observation, actual observation, and acceptance evidence.

### 2. Assertions Before Interpretation

The harness should assert contract safety, scope safety, evidence presence, and expected observation before subjective explanation quality is judged.

### 3. Traceability Over Summary

Every score should point to evidence: file state, command output, tests, rendered artifact, or a recorded decision. This follows tracing-oriented systems rather than summary-only reports.

### 4. Domain-Specific Metrics

SAPIEN-Lite needs general metrics plus domain metrics. For RAG or research work, score evidence grounding. For coding work, score tests and diff scope. For project governance, score repo hygiene and deployment reversibility.

### 5. Ablation As A First-Class Activity

The harness should support comparing full SAPIEN-Lite against variants with immune guard, prediction, bounded memory, replay, or budget control removed.

### 6. Human Review For High-Risk Or Subjective Cases

Subjective quality and high-risk actions should keep a reviewer note or approval evidence. This avoids pretending every decision can be reduced to an automatic scalar.

### 7. CI And One-Command Portability

Harness scaffolding should be deployable to another Codex project with one command, without global configuration, hooks, or overwriting local rules by default.

## Source Links

- OpenAI Evals: https://github.com/openai/evals
- Promptfoo docs: https://www.promptfoo.dev/docs/intro/
- LangSmith evaluation docs: https://docs.smith.langchain.com/evaluation
- Braintrust docs: https://www.braintrust.dev/docs
- Ragas docs: https://docs.ragas.io/
- Arize Phoenix docs: https://docs.arize.com/phoenix
- TruLens docs: https://www.trulens.org/
- Inspect AI docs: https://inspect.ai-safety-institute.org.uk/
- EleutherAI lm-evaluation-harness: https://github.com/EleutherAI/lm-evaluation-harness
- MLflow GenAI evaluation docs: https://mlflow.org/docs/latest/genai/eval-monitor/
