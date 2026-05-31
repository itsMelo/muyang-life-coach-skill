#!/usr/bin/env bash
# Initialize a Muyang Life Coach workspace in the current directory.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATES="$SKILL_ROOT/references/templates"

if [[ ! -d "$TEMPLATES" ]]; then
  echo "error: templates not found at $TEMPLATES" >&2
  echo "Run this script from an installed skill (see INSTALL.md)." >&2
  exit 1
fi

mkdir -p archive

copy_if_missing() {
  local src="$1" dest="$2"
  if [[ -e "$dest" ]]; then
    echo "skip (exists): $dest"
  else
    cp "$src" "$dest"
    echo "created: $dest"
  fi
}

copy_if_missing "$TEMPLATES/experiments.yaml" "./experiments.yaml"
copy_if_missing "$TEMPLATES/open-loops.md" "./open-loops.md"
copy_if_missing "$TEMPLATES/patterns.md" "./patterns.md"
copy_if_missing "$TEMPLATES/themes.yaml" "./themes.yaml"

if [[ ! -f .gitignore ]]; then
  cat > .gitignore << 'EOF'
# Muyang Life Coach — private workspace data
profile.md
experiments.yaml
open-loops.md
patterns.md
themes.yaml
archive/
EOF
  echo "created: .gitignore"
fi

if [[ -f profile.md ]]; then
  echo ""
  echo "profile.md already exists — open this folder in your IDE and chat with muyang-life-coach-skill."
else
  echo ""
  echo "Workspace ready. Open this folder, attach muyang-life-coach-skill skill, and say:"
  echo "  「我想用 life coach，帮我建档」"
fi
