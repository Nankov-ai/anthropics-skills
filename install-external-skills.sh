#!/bin/bash
# install-external-skills.sh — Instala skills externas (anthropics/skills oficial)
# Corre DEPOIS de: git clone https://github.com/Nankov-ai/anthropics-skills.git ~/.claude/skills
set -euo pipefail

DEST="$(cd "$(dirname "$0")" && pwd)"
BASE="https://raw.githubusercontent.com/anthropics/skills/main/skills"

echo "==> A verificar skills externas (anthropics/skills)..."

EXTERNAL=(algorithmic-art brand-guidelines canvas-design claude-api doc-coauthoring
           docx frontend-design internal-comms mcp-builder pdf pptx skill-creator
           slack-gif-creator theme-factory web-artifacts-builder webapp-testing xlsx)

updated=0
for skill in "${EXTERNAL[@]}"; do
  remote_url="$BASE/$skill/SKILL.md"
  local_file="$DEST/$skill/SKILL.md"
  tmp=$(mktemp)
  if curl -fsSL -o "$tmp" "$remote_url" 2>/dev/null; then
    if ! cmp -s "$tmp" "$local_file" 2>/dev/null; then
      mkdir -p "$DEST/$skill"
      mv "$tmp" "$local_file"
      echo "  ↑ $skill (atualizado)"
      updated=$((updated+1))
    else
      rm "$tmp"
    fi
  else
    rm -f "$tmp"
    echo "  ! $skill (não disponível remotamente)"
  fi
done

# Extras do PDF
for extra in forms.md reference.md; do
  tmp=$(mktemp)
  if curl -fsSL -o "$tmp" "$BASE/pdf/$extra" 2>/dev/null; then
    if ! cmp -s "$tmp" "$DEST/pdf/$extra" 2>/dev/null; then
      mv "$tmp" "$DEST/pdf/$extra"
      echo "  ↑ pdf/$extra (atualizado)"
      updated=$((updated+1))
    else
      rm "$tmp"
    fi
  else
    rm -f "$tmp"
  fi
done

if [ "$updated" -eq 0 ]; then
  echo "  ✓ Todas as skills externas já estão atualizadas."
else
  echo ""
  echo "==> $updated skill(s) atualizada(s)."
fi

echo ""
echo "==> Total de skills disponíveis: $(ls -d "$DEST"/*/  | wc -l)"
