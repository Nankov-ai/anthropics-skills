#!/bin/bash
# install-external-packages.sh — Instala skills e pacotes externos
# Corre DEPOIS de: git clone https://github.com/Nankov-ai/anthropics-skills.git ~/.claude/skills
set -euo pipefail

DEST="$(cd "$(dirname "$0")" && pwd)"

ok()   { echo "  ✓ $1"; }
fail() { echo "  ✗ $1 (falhou)"; }
info() { echo ""; echo "==> $1..."; }

# ─── 1. stop-slop ────────────────────────────────────────────────────────────
info "stop-slop"
mkdir -p "$DEST/stop-slop"
curl -fsSL "https://raw.githubusercontent.com/hardikpandya/stop-slop/main/SKILL.md" \
  -o "$DEST/stop-slop/SKILL.md" && ok "stop-slop" || fail "stop-slop"

# ─── 2. last30days ───────────────────────────────────────────────────────────
info "last30days"
mkdir -p "$DEST/last30days"
curl -fsSL "https://raw.githubusercontent.com/mvanhorn/last30days-skill/main/skills/last30days/SKILL.md" \
  -o "$DEST/last30days/SKILL.md" && ok "last30days" || fail "last30days"

# ─── 3. gstack ───────────────────────────────────────────────────────────────
info "gstack (router + sub-skills)"
BASE_G="https://raw.githubusercontent.com/garrytan/gstack/main"
GSTACK_SKILLS=(
  autoplan benchmark benchmark-models browse canary careful codex
  context-restore context-save cso design-consultation design-html
  design-review design-shotgun document-generate investigate land-and-deploy
  plan-eng-review qa qa-only review ship
)
mkdir -p "$DEST/gstack"
curl -fsSL "$BASE_G/SKILL.md" -o "$DEST/gstack/SKILL.md" && ok "gstack" || fail "gstack"
for skill in "${GSTACK_SKILLS[@]}"; do
  mkdir -p "$DEST/$skill"
  if curl -fsSL "$BASE_G/$skill/SKILL.md" -o "$DEST/$skill/SKILL.md" 2>/dev/null; then
    ok "gstack/$skill"
  else
    rmdir "$DEST/$skill" 2>/dev/null || true
    fail "gstack/$skill"
  fi
done

# ─── 4. taste-skill (12 skills) ──────────────────────────────────────────────
info "taste-skill"
BASE_T="https://raw.githubusercontent.com/Leonxlnx/taste-skill/main/skills"
TASTE_SKILLS=(
  brandkit brutalist-skill image-to-code-skill imagegen-frontend-mobile
  imagegen-frontend-web minimalist-skill output-skill redesign-skill
  soft-skill stitch-skill taste-skill taste-skill-v1
)
for skill in "${TASTE_SKILLS[@]}"; do
  mkdir -p "$DEST/$skill"
  if curl -fsSL "$BASE_T/$skill/SKILL.md" -o "$DEST/$skill/SKILL.md" 2>/dev/null; then
    ok "taste/$skill"
  else
    rmdir "$DEST/$skill" 2>/dev/null || true
    fail "taste/$skill"
  fi
done

# ─── 5. hyperframes (via npx skills) ─────────────────────────────────────────
info "hyperframes (via npx skills add)"
TMP_HF=$(mktemp -d)
cd "$TMP_HF"
if npx --yes skills add heygen-com/hyperframes > /dev/null 2>&1; then
  count=0
  for skill_dir in "$TMP_HF/.agents/skills"/*/; do
    name=$(basename "$skill_dir")
    cp -r "$skill_dir" "$DEST/$name"
    ok "hyperframes/$name"
    count=$((count+1))
  done
  echo "  → $count skills instaladas"
else
  fail "hyperframes (npx skills falhou)"
fi
cd - > /dev/null
rm -rf "$TMP_HF"

# ─── 6. graphifyy (Python) ───────────────────────────────────────────────────
info "graphifyy (pip)"
if pip install graphifyy -q 2>/dev/null; then
  ok "graphifyy"
else
  fail "graphifyy"
fi

# ─── Resumo ───────────────────────────────────────────────────────────────────
echo ""
echo "==> Concluído! Total de skills disponíveis: $(ls -d \"$DEST\"/*/  | wc -l)"
