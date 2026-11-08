#!/usr/bin/env bash
# Copy the Brief to Tasks kit into a project. Existing files are never overwritten.
# usage: ./install.sh /path/to/your/project
set -euo pipefail

target="${1:?usage: ./install.sh /path/to/your/project}"
kit="$(cd "$(dirname "$0")" && pwd)/template"

[ -d "$target" ] || { echo "Folder not found: $target" >&2; exit 1; }

cd "$kit"
find . -type f | while read -r file; do
  destination="$target/${file#./}"
  if [ -e "$destination" ]; then
    echo "Skipped, already exists: ${file#./}"
  else
    mkdir -p "$(dirname "$destination")"
    cp "$file" "$destination"
    echo "Added: ${file#./}"
  fi
done

echo "Done. Restart Claude Code, then try /brief-to-tasks."
