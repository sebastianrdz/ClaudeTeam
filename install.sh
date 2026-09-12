#!/usr/bin/env bash
# Install the Claude Team (agents + skills) into Claude Code.
#
#   ./install.sh --user                     # user-level: available in ALL projects
#   ./install.sh --project /path/to/proj    # one project only
#   ./install.sh --user --copy              # copy instead of symlink
#   ./install.sh --uninstall --user         # remove
#
# Symlink (default) is recommended: `git pull` here updates every install.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS=(team retro hire)

MODE="" TARGET="" COPY=0 UNINSTALL=0
while [[ $# -gt 0 ]]; do
  case "$1" in
    --user)      MODE="user"; TARGET="$HOME/.claude"; shift ;;
    --project)   MODE="project"; TARGET="${2:?--project requires a path}/.claude"; shift 2 ;;
    --copy)      COPY=1; shift ;;
    --uninstall) UNINSTALL=1; shift ;;
    -h|--help)   grep '^#' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "Unknown option: $1 (see --help)"; exit 1 ;;
  esac
done
[[ -n "$MODE" ]] || { echo "Choose --user or --project <path> (see --help)"; exit 1; }

AGENTS_DEST="$TARGET/agents/claude-team"

if [[ $UNINSTALL -eq 1 ]]; then
  rm -rf "$AGENTS_DEST"
  for s in "${SKILLS[@]}"; do rm -rf "$TARGET/skills/$s"; done
  echo "Removed Claude Team from $TARGET"
  exit 0
fi

mkdir -p "$TARGET/agents" "$TARGET/skills"

install_one() { # src dest label
  local src="$1" dest="$2" label="$3"
  if [[ -e "$dest" && ! -L "$dest" ]]; then
    echo "  SKIP $label — $dest exists and is not a symlink (remove it to reinstall)"
    return
  fi
  rm -rf "$dest"
  if [[ $COPY -eq 1 ]]; then cp -R "$src" "$dest"; else ln -s "$src" "$dest"; fi
  echo "  OK   $label"
}

echo "Installing Claude Team → $TARGET ($([[ $COPY -eq 1 ]] && echo copy || echo symlink))"
install_one "$REPO_DIR/.claude/agents/claude-team" "$AGENTS_DEST" "agents (33)"
for s in "${SKILLS[@]}"; do
  install_one "$REPO_DIR/.claude/skills/$s" "$TARGET/skills/$s" "skill /$s"
done

echo
echo "Done. Start a new Claude Code session, then try:  /team <your mission>"
[[ "$MODE" == "user" ]] && echo "(user-level install: the team is now available in every project)"

# The design craft stack is external — installed separately, at user level.
echo
echo "Design craft stack (optional, recommended for UI work) — see docs/DESIGN-SKILLS.md:"
for s in impeccable emil-design-eng animate design-taste-frontend; do
  if [[ -e "$HOME/.claude/skills/$s" ]]; then echo "  OK      $s"; else echo "  MISSING $s"; fi
done
echo "  impeccable.style/designing · emilkowal.ski/skill · tasteskill.dev"
