# install-skills.ps1 — Instala todas as skills no Claude Code (Windows)
# Executar: powershell -ExecutionPolicy Bypass -File install-skills.ps1
#
# Faz download de todas as skills de Nankov-ai/anthropics-skills.
# Sem conteudo embutido — encoding sempre correto.

$DEST     = "$env:USERPROFILE\.claude\skills"
$REPO_RAW = "https://raw.githubusercontent.com/Nankov-ai/anthropics-skills/main"

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

# ─── Skills (137 total) ────────────────────────────────────────────────────────
Write-Host ""
Write-Host "==> A instalar todas as skills (Nankov-ai/anthropics-skills)..." -ForegroundColor Cyan

$skills = @(
    # skill-name, @(extra files relative to skill folder)
    @{ name = "_gstack-command";              extras = @() },
    @{ name = "agent-prompt-builder";         extras = @("references/nodeflow-agent-patterns.md","references/platforms.md") },
    @{ name = "agent-reasoning";              extras = @() },
    @{ name = "ai-agent-patterns";            extras = @() },
    @{ name = "ai-video-creator";             extras = @() },
    @{ name = "aiact";                        extras = @() },
    @{ name = "algorithmic-art";              extras = @() },
    @{ name = "autoplan";                     extras = @() },
    @{ name = "b2b-outbound-automation";      extras = @() },
    @{ name = "benchmark";                    extras = @() },
    @{ name = "benchmark-models";             extras = @() },
    @{ name = "brand-guidelines";             extras = @() },
    @{ name = "brandkit";                     extras = @() },
    @{ name = "browse";                       extras = @() },
    @{ name = "brutalist-skill";              extras = @() },
    @{ name = "canary";                       extras = @() },
    @{ name = "canvas-design";                extras = @() },
    @{ name = "careful";                      extras = @() },
    @{ name = "claude-api";                   extras = @() },
    @{ name = "code-review";                  extras = @() },
    @{ name = "codex";                        extras = @() },
    @{ name = "context-engineering";          extras = @() },
    @{ name = "context-restore";              extras = @() },
    @{ name = "context-save";                 extras = @() },
    @{ name = "cso";                          extras = @() },
    @{ name = "design-consultation";          extras = @() },
    @{ name = "design-html";                  extras = @() },
    @{ name = "design-review";                extras = @() },
    @{ name = "design-shotgun";               extras = @() },
    @{ name = "devex-review";                 extras = @() },
    @{ name = "diagram";                      extras = @() },
    @{ name = "doc-coauthoring";              extras = @() },
    @{ name = "document-generate";            extras = @() },
    @{ name = "document-release";             extras = @() },
    @{ name = "docx";                         extras = @() },
    @{ name = "embedded-captions";            extras = @() },
    @{ name = "enterprise-ai-agent-designer"; extras = @() },
    @{ name = "faceless-explainer";           extras = @() },
    @{ name = "faturix";                      extras = @() },
    @{ name = "fewer-permission-prompts";     extras = @() },
    @{ name = "freeze";                       extras = @() },
    @{ name = "frontend-design";              extras = @() },
    @{ name = "gem-builder";                  extras = @() },
    @{ name = "general-video";                extras = @() },
    @{ name = "graphic-overlays";             extras = @() },
    @{ name = "gstack";                       extras = @() },
    @{ name = "gstack-upgrade";               extras = @() },
    @{ name = "guard";                        extras = @() },
    @{ name = "health";                       extras = @() },
    @{ name = "hyperframes";                  extras = @() },
    @{ name = "hyperframes-animation";        extras = @() },
    @{ name = "hyperframes-cli";              extras = @() },
    @{ name = "hyperframes-core";             extras = @() },
    @{ name = "hyperframes-creative";         extras = @() },
    @{ name = "hyperframes-media";            extras = @() },
    @{ name = "hyperframes-registry";         extras = @() },
    @{ name = "image-to-code-skill";          extras = @() },
    @{ name = "imagegen-frontend-mobile";     extras = @() },
    @{ name = "imagegen-frontend-web";        extras = @() },
    @{ name = "init";                         extras = @() },
    @{ name = "internal-comms";              extras = @() },
    @{ name = "investigate";                  extras = @() },
    @{ name = "ios-clean";                    extras = @() },
    @{ name = "ios-design-review";            extras = @() },
    @{ name = "ios-fix";                      extras = @() },
    @{ name = "ios-qa";                       extras = @() },
    @{ name = "ios-sync";                     extras = @() },
    @{ name = "it-consulting-proposal";       extras = @() },
    @{ name = "keybindings-help";             extras = @() },
    @{ name = "land-and-deploy";              extras = @() },
    @{ name = "landing-report";              extras = @() },
    @{ name = "last30days";                   extras = @() },
    @{ name = "learn";                        extras = @() },
    @{ name = "local-agent-trainer";          extras = @() },
    @{ name = "loop";                         extras = @() },
    @{ name = "loop-engineering";             extras = @() },
    @{ name = "make-pdf";                     extras = @() },
    @{ name = "mcp-builder";                  extras = @() },
    @{ name = "media-use";                    extras = @() },
    @{ name = "minimalist-skill";             extras = @() },
    @{ name = "motion-graphics";              extras = @() },
    @{ name = "music-to-video";               extras = @() },
    @{ name = "nando-global";                 extras = @() },
    @{ name = "notebooklm";                   extras = @() },
    @{ name = "office-hours";                 extras = @() },
    @{ name = "open-gstack-browser";          extras = @() },
    @{ name = "output-skill";                 extras = @() },
    @{ name = "pair-agent";                   extras = @() },
    @{ name = "pdf";                          extras = @("forms.md","reference.md") },
    @{ name = "plan-ceo-review";              extras = @() },
    @{ name = "plan-design-review";           extras = @() },
    @{ name = "plan-devex-review";            extras = @() },
    @{ name = "plan-eng-review";              extras = @() },
    @{ name = "plan-tune";                    extras = @() },
    @{ name = "pptx";                         extras = @() },
    @{ name = "pr-to-video";                  extras = @() },
    @{ name = "product-launch-video";         extras = @() },
    @{ name = "prompt-builder";               extras = @() },
    @{ name = "pt-checkout-builder";          extras = @() },
    @{ name = "qa";                           extras = @() },
    @{ name = "qa-only";                      extras = @() },
    @{ name = "redesign-skill";               extras = @() },
    @{ name = "remotion-to-hyperframes";      extras = @() },
    @{ name = "retro";                        extras = @() },
    @{ name = "review";                       extras = @() },
    @{ name = "run";                          extras = @() },
    @{ name = "schedule";                     extras = @() },
    @{ name = "scrape";                       extras = @() },
    @{ name = "security-review";              extras = @() },
    @{ name = "self-improving-loop";          extras = @() },
    @{ name = "setup-browser-cookies";        extras = @() },
    @{ name = "setup-deploy";                 extras = @() },
    @{ name = "setup-gbrain";                 extras = @() },
    @{ name = "ship";                         extras = @() },
    @{ name = "simplify";                     extras = @() },
    @{ name = "skill-creator";                extras = @() },
    @{ name = "skill-evaluator";              extras = @("references/description-checklist.md","references/failure-modes.md") },
    @{ name = "skillify";                     extras = @() },
    @{ name = "slack-gif-creator";            extras = @() },
    @{ name = "slideshow";                    extras = @() },
    @{ name = "soft-skill";                   extras = @() },
    @{ name = "spec";                         extras = @() },
    @{ name = "stitch-skill";                 extras = @() },
    @{ name = "stop-slop";                    extras = @() },
    @{ name = "sync-gbrain";                  extras = @() },
    @{ name = "taste-skill";                  extras = @() },
    @{ name = "taste-skill-v1";               extras = @() },
    @{ name = "termos-condicoes-pt";          extras = @() },
    @{ name = "theme-factory";                extras = @() },
    @{ name = "unfreeze";                     extras = @() },
    @{ name = "update-config";                extras = @() },
    @{ name = "verify";                       extras = @() },
    @{ name = "visual-content-transformer";   extras = @() },
    @{ name = "web-artifacts-builder";        extras = @() },
    @{ name = "webapp-testing";               extras = @() },
    @{ name = "website-to-video";             extras = @() },
    @{ name = "xlsx";                         extras = @() }
)

$ok = 0; $err = 0

foreach ($skill in $skills) {
    $name = $skill.name
    $dir  = "$DEST\$name"
    New-Item -ItemType Directory -Force -Path $dir | Out-Null

    if (Download-File -Uri "$REPO_RAW/$name/SKILL.md" -OutPath "$dir\SKILL.md") {
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

# ─── Resultado ────────────────────────────────────────────────────────────────
$total = (Get-ChildItem -Directory $DEST).Count
Write-Host ""
Write-Host "==> Concluido! $total skills em $DEST ($ok OK, $err erros)" -ForegroundColor Green
Write-Host "    Reinicia o Claude Code e usa /reload-skills para confirmar." -ForegroundColor Yellow
