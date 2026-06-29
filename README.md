# SAPIEN-Lite

SAPIEN-Lite is a project-local workflow scaffold for reconstructing an Agent workflow from a bionics-inspired first-principles report.

The current local artifacts live under `work/`:

- `work/bionics-agent-workflow-reconstruction.md` - process reconstruction from report reading to SAPIEN-Lite Agent workflow.
- `work/codex-blackboard.md` - live scope, queue, and SAPIEN module map.
- `work/codex-verification-log.md` - expected-vs-actual evidence log.
- `work/codex-evaluation-harness.md` - bionics-upgrade harness for repeated Agent workflow evaluation.
- `work/harness-industry-research.md` - 10-system harness research and adopted design patterns.

## One-Command Deployment

Deploy the SAPIEN-Lite scaffold into another Codex project without changing global config or installing hooks:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\deploy-sapien-lite.ps1 -ProjectPath "C:\path\to\codex-project"
```

For multiple projects:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\deploy-sapien-lite.ps1 -ProjectPath "C:\path\to\project-a","C:\path\to\project-b"
```

Default behavior is additive and non-destructive: existing files are skipped unless `-Force` is explicitly passed.
