# Personal shell aliases — sourced from ~/.bashrc by install.sh.
# Lives in a dotfiles repo so it persists across devcontainer prune/rebuild.

# Claude Code, skipping the permission prompts.
alias cld="claude --dangerously-skip-permissions"
alias cldr="claude --dangerously-skip-permissions --resume"

# --- talk-intella -----------------------------------------------------------
# Boots intella (warm-companion voice persona) against the deployed memory-api.
# The pipewire/unity_out sink + Xorg are set up by start_character_engine.sh
# during boot, so this alias only needs the repo path and the capture device.
talk-intella() {
    local repo="${INTELLA_REPO:-}"
    if [ -z "$repo" ]; then
        for c in /workspaces/intella-dialog-engine "$HOME/intella-dialog-engine"; do
            [ -d "$c/services/dialog-engine" ] && { repo="$c"; break; }
        done
    fi

    bash "$repo/services/dialog-engine/scripts/kill_intella_process.sh"

    export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/tmp/runtime-user}"
    export PULSE_SERVER="${PULSE_SERVER:-unix:${XDG_RUNTIME_DIR}/pulse/native}"
    export GST_PULSE_DEVICE="unity_out.monitor"

    ( cd "$repo/services/dialog-engine" && uv run -m intella )
}
