#!/bin/bash
# Run by VS Code Dev Containers on container creation (dotfiles.installCommand).
# Idempotently wires this dotfiles repo into the container's ~/.bashrc.
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MARKER="# >>> personal dotfiles >>>"

if ! grep -qF "$MARKER" "$HOME/.bashrc" 2>/dev/null; then
    {
        echo ""
        echo "$MARKER"
        echo "source \"$DOTFILES_DIR/aliases.sh\""
        echo "# <<< personal dotfiles <<<"
    } >> "$HOME/.bashrc"
    echo "dotfiles: linked aliases.sh into ~/.bashrc"
else
    echo "dotfiles: already linked"
fi
