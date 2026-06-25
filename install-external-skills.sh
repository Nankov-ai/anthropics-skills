#!/bin/bash
# Install all external skills for Claude Code
# Run from any directory: bash ~/.claude/skills/install-external-skills.sh

set -e

SKILLS_DIR="$HOME/.claude/skills"
mkdir -p "$SKILLS_DIR"

echo "=== Installing external Claude Code skills ==="
echo ""

# 1. gstack (garrytan/gstack) — 50+ skills by Garry Tan (YC CEO)
echo "[1/5] Installing gstack..."
if [ -d "$SKILLS_DIR/gstack" ]; then
  echo "  → Already installed, upgrading..."
  cd "$SKILLS_DIR/gstack" && git pull --depth 1
else
  git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git "$SKILLS_DIR/gstack"
fi
cd "$SKILLS_DIR/gstack" && bash ./setup
echo "  ✅ gstack installed"
echo ""

# 2. stop-slop (hardikpandya/stop-slop) — removes AI writing patterns
echo "[2/5] Installing stop-slop..."
if [ -d "$SKILLS_DIR/stop-slop" ]; then
  echo "  → Already installed, upgrading..."
  cd "$SKILLS_DIR/stop-slop" && git pull --depth 1
else
  git clone --depth 1 https://github.com/hardikpandya/stop-slop.git "$SKILLS_DIR/stop-slop"
fi
echo "  ✅ stop-slop installed"
echo ""

# 3. last30days (mvanhorn/last30days-skill) — Reddit, HN, Polymarket, GitHub search
echo "[3/5] Installing last30days..."
git clone --depth 1 https://github.com/mvanhorn/last30days-skill.git /tmp/last30days-skill
cp -r /tmp/last30days-skill/skills/last30days "$SKILLS_DIR/last30days"
rm -rf /tmp/last30days-skill
echo "  ✅ last30days installed"
echo ""

# 4. taste-skill (Leonxlnx/taste-skill) — anti-slop frontend design (12 skills)
echo "[4/5] Installing taste-skill (12 skills)..."
git clone --depth 1 https://github.com/Leonxlnx/taste-skill.git /tmp/taste-skill
for skill in brandkit brutalist-skill image-to-code-skill imagegen-frontend-mobile imagegen-frontend-web minimalist-skill output-skill redesign-skill soft-skill stitch-skill taste-skill taste-skill-v1; do
  cp -r "/tmp/taste-skill/skills/$skill" "$SKILLS_DIR/"
  echo "  ✅ $skill"
done
rm -rf /tmp/taste-skill
echo ""

# 5. hyperframes (heygen-com/hyperframes) — create videos from HTML (19 skills)
echo "[5/5] Installing hyperframes (19 skills)..."
git clone --depth 1 https://github.com/heygen-com/hyperframes.git /tmp/hyperframes
for skill in embedded-captions faceless-explainer general-video graphic-overlays hyperframes hyperframes-animation hyperframes-cli hyperframes-core hyperframes-creative hyperframes-media hyperframes-registry media-use motion-graphics music-to-video pr-to-video product-launch-video remotion-to-hyperframes slideshow website-to-video; do
  cp -r "/tmp/hyperframes/skills/$skill" "$SKILLS_DIR/"
  echo "  ✅ $skill"
done
rm -rf /tmp/hyperframes
echo ""

# 6. graphifyy CLI — codebase knowledge graph (optional, requires Python)
echo "[6/6] Installing graphifyy CLI..."
if command -v pip &>/dev/null; then
  pip install graphifyy --quiet
  echo "  ✅ graphifyy installed ($(graphify --version 2>/dev/null || echo 'check manually'))"
elif command -v pip3 &>/dev/null; then
  pip3 install graphifyy --quiet
  echo "  ✅ graphifyy installed"
else
  echo "  ⚠️  pip not found — install manually: pip install graphifyy"
fi
echo ""

echo "============================================"
echo "✅ All external skills installed!"
echo ""
echo "Skills installed in: $SKILLS_DIR"
echo ""
echo "Run /reload-skills in Claude Code to activate."
echo ""
echo "Skills summary:"
echo "  • gstack       — 50+ skills (office-hours, review, qa, ship, design, etc.)"
echo "  • stop-slop    — removes AI writing patterns from prose"
echo "  • last30days   — Reddit, HN, Polymarket, GitHub search (last 30 days)"
echo "  • taste-skill  — 12 anti-slop frontend design skills"
echo "  • hyperframes  — 19 video creation skills (HTML → MP4)"
echo "  • graphifyy    — codebase knowledge graph CLI"
echo ""
echo "Total: 100+ skills active"
