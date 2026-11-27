#!/usr/bin/env bash
set -e
ROOT="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.claude/skills"; CMD="$HOME/.claude/commands"
FORCE=0; [ "$1" = "--force" ] && FORCE=1
mkdir -p "$DEST" "$CMD"
added=0; skipped=""
for d in "$ROOT"/skills/*/; do
  n="$(basename "$d")"
  if [ -e "$DEST/$n" ] && [ $FORCE -eq 0 ]; then skipped="$skipped $n"; continue; fi
  rm -rf "$DEST/$n"; cp -R "$d" "$DEST/$n"; added=$((added+1))
done
for f in "$ROOT"/commands/*; do
  n="$(basename "$f")"
  if [ -e "$CMD/$n" ] && [ $FORCE -eq 0 ]; then skipped="$skipped $n"; else cp "$f" "$CMD/$n"; fi
done
echo "Installed $added skills into $DEST"
[ -n "$skipped" ] && echo "Skipped (already installed, run with --force to replace):$skipped"
echo "Restart Claude Code, then type / to see them."
