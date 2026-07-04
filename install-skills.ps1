# install-skills.ps1 — Instala todas as skills no Claude Code (Windows)
# Executar: powershell -ExecutionPolicy Bypass -File install-skills.ps1
#
# Faz download de todas as skills de Nankov-ai/anthropics-skills + skills oficiais Anthropic.
# Sem conteudo embutido — encoding sempre correto.

$DEST     = "$env:USERPROFILE\.claude\skills"
$REPO_RAW = "https://raw.githubusercontent.com/Nankov-ai/anthropics-skills/main"
$ANTH_RAW = "https://raw.githubusercontent.com/anthropics/skills/main/skills"

$utf8NoBom = [System.Text.UTF8Encoding]::new($false)

function Download-File {
    param([string]$Uri, [string]$OutPath)
    try {
        $bytes = (Invoke-WebRequest -Uri $Uri -UseBasicParsing).Content
        [System.IO.File]::WriteAllBytes($OutPath, $bytes)
        return $true
    } catch {
        return $false
    }
}

Write-Host "==> A criar directorio de skills..." -ForegroundColor Cyan
New-Item -ItemType Directory -Force -Path $DEST | Out-Null

# ─── 1. Skills do repositorio Nankov-ai/anthropics-skills ─────────────────────
Write-Host ""
Write-Host "==> A instalar skills personalizadas (Nankov-ai/anthropics-skills)..." -ForegroundColor Cyan

$customSkills = @(
    # skill-name, @(extra files relative to skill folder)
    @{ name = "agent-prompt-builder"; extras = @("references/nodeflow-agent-patterns.md", "references/platforms.md") },
    @{ name = "agent-reasoning";       extras = @() },
    @{ name = "ai-agent-patterns";     extras = @() },
    @{ name = "aiact";                 extras = @() },
    @{ name = "algorithmic-art";       extras = @() },
    @{ name = "b2b-outbound-automation"; extras = @() },
    @{ name = "brand-guidelines";      extras = @() },
    @{ name = "canvas-design";         extras = @() },
    @{ name = "claude-api";            extras = @() },
    @{ name = "code-review";           extras = @() },
    @{ name = "context-engineering";   extras = @() },
    @{ name = "doc-coauthoring";       extras = @() },
    @{ name = "docx";                  extras = @() },
    @{ name = "enterprise-ai-agent-designer"; extras = @() },
    @{ name = "faturix";               extras = @() },
    @{ name = "fewer-permission-prompts"; extras = @() },
    @{ name = "frontend-design";       extras = @() },
    @{ name = "gem-builder";           extras = @() },
    @{ name = "init";                  extras = @() },
    @{ name = "internal-comms";        extras = @() },
    @{ name = "it-consulting-proposal"; extras = @() },
    @{ name = "keybindings-help";      extras = @() },
    @{ name = "local-agent-trainer";   extras = @() },
    @{ name = "loop-engineering";      extras = @() },
    @{ name = "mcp-builder";           extras = @() },
    @{ name = "nando-global";          extras = @() },
    @{ name = "notebooklm";            extras = @() },
    @{ name = "pdf";                   extras = @() },
    @{ name = "pptx";                  extras = @() },
    @{ name = "pt-checkout-builder";   extras = @() },
    @{ name = "review";                extras = @() },
    @{ name = "run";                   extras = @() },
    @{ name = "schedule";              extras = @() },
    @{ name = "security-review";       extras = @() },
    @{ name = "self-improving-loop";   extras = @() },
    @{ name = "simplify";              extras = @() },
    @{ name = "skill-creator";         extras = @() },
    @{ name = "skill-evaluator";       extras = @("references/description-checklist.md", "references/failure-modes.md") },
    @{ name = "slack-gif-creator";     extras = @() },
    @{ name = "termos-condicoes-pt";   extras = @() },
    @{ name = "theme-factory";         extras = @() },
    @{ name = "update-config";         extras = @() },
    @{ name = "verify";                extras = @() },
    @{ name = "web-artifacts-builder"; extras = @() },
    @{ name = "webapp-testing";        extras = @() },
    @{ name = "xlsx";                  extras = @() }
)

$ok = 0; $err = 0

foreach ($skill in $customSkills) {
    $name = $skill.name
    $dir  = "$DEST\$name"
    New-Item -ItemType Directory -Force -Path $dir | Out-Null

    $uri = "$REPO_RAW/$name/SKILL.md"
    if (Download-File -Uri $uri -OutPath "$dir\SKILL.md") {
        # extra reference files
        foreach ($extra in $skill.extras) {
            $extraDir = Split-Path "$dir\$extra" -Parent
            New-Item -ItemType Directory -Force -Path $extraDir | Out-Null
            Download-File -Uri "$REPO_RAW/$name/$extra" -OutPath "$dir\$extra" | Out-Null
        }
        Write-Host "  OK $name" -ForegroundColor Green
        $ok++
    } else {
        Write-Host "  ERRO $name" -ForegroundColor Red
        $err++
    }
}

# ─── 2. Skills oficiais Anthropic (nao existem no repo Nankov-ai) ──────────────
Write-Host ""
Write-Host "==> A instalar skills oficiais Anthropic..." -ForegroundColor Cyan

# Estas skills sao descarregadas do repo oficial anthropics/skills
# porque nao estao duplicadas no repo Nankov-ai (sem personalizacoes)
$anthropicOnly = @(
    "doc-coauthoring",
    "slack-gif-creator",
    "theme-factory",
    "web-artifacts-builder",
    "webapp-testing"
)

# Nota: a maioria das skills Anthropic ja esta no repo Nankov-ai com o mesmo conteudo.
# Estas 5 sao instaladas do repo oficial como backup caso o Nankov-ai nao as tenha atualizado.
# Comentar este bloco se quiser usar apenas o repo Nankov-ai.

foreach ($skill in $anthropicOnly) {
    $dir = "$DEST\$skill"
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    $uri = "$ANTH_RAW/$skill/SKILL.md"
    # Nao sobrescreve se ja foi instalada do repo Nankov-ai
    if (-not (Test-Path "$dir\SKILL.md")) {
        if (Download-File -Uri $uri -OutPath "$dir\SKILL.md") {
            Write-Host "  OK $skill (Anthropic)" -ForegroundColor DarkGreen
        } else {
            Write-Host "  SKIP $skill (nao encontrada)" -ForegroundColor DarkYellow
        }
    } else {
        Write-Host "  SKIP $skill (ja instalada do repo Nankov-ai)" -ForegroundColor DarkYellow
    }
}

# pdf tem ficheiros extra no repo oficial
$pdfDir = "$DEST\pdf"
New-Item -ItemType Directory -Force -Path $pdfDir | Out-Null
Download-File -Uri "$ANTH_RAW/pdf/forms.md"     -OutPath "$pdfDir\forms.md"     | Out-Null
Download-File -Uri "$ANTH_RAW/pdf/reference.md" -OutPath "$pdfDir\reference.md" | Out-Null

# ─── Resultado ────────────────────────────────────────────────────────────────
$total = (Get-ChildItem -Directory $DEST).Count
Write-Host ""
Write-Host "==> Concluido! $total skills em $DEST ($ok OK, $err erros)" -ForegroundColor Green
Write-Host "    Reinicia o Claude Code e usa /reload-skills para confirmar." -ForegroundColor Yellow
