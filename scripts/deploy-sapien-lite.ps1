param(
    [Parameter(Mandatory = $true)]
    [string[]]$ProjectPath,

    [switch]$Force
)

$ErrorActionPreference = "Stop"

$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent $scriptRoot
$templateRoot = Join-Path $repoRoot "templates\work"

if (-not (Test-Path -LiteralPath $templateRoot)) {
    throw "Template directory not found: $templateRoot"
}

$files = @(
    "codex-blackboard.md",
    "codex-verification-log.md",
    "codex-evaluation-harness.md"
)

foreach ($rawPath in $ProjectPath) {
    $resolvedProject = Resolve-Path -LiteralPath $rawPath -ErrorAction Stop
    $project = $resolvedProject.Path
    $workDir = Join-Path $project "work"

    if (-not (Test-Path -LiteralPath $workDir)) {
        New-Item -ItemType Directory -Path $workDir | Out-Null
    }

    Write-Host "Deploying SAPIEN-Lite scaffold to $project"

    foreach ($name in $files) {
        $src = Join-Path $templateRoot $name
        $dst = Join-Path $workDir $name

        if ((Test-Path -LiteralPath $dst) -and (-not $Force)) {
            Write-Host "SKIP existing $dst"
            continue
        }

        Copy-Item -LiteralPath $src -Destination $dst -Force:$Force
        Write-Host "WRITE $dst"
    }

    $manifest = Join-Path $workDir "sapien-lite-deployment.md"
    if ((-not (Test-Path -LiteralPath $manifest)) -or $Force) {
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss zzz"
        @"
# SAPIEN-Lite Deployment

Deployed at: $timestamp

Source: $repoRoot

Behavior:

- Project-local files only.
- No global Codex configuration changed.
- No hooks installed.
- Existing files skipped unless `-Force` was passed.

Next check:

Run `git status --short --branch` in this project and record the result in `work/codex-verification-log.md`.
"@ | Set-Content -LiteralPath $manifest -Encoding UTF8
        Write-Host "WRITE $manifest"
    } else {
        Write-Host "SKIP existing $manifest"
    }
}
