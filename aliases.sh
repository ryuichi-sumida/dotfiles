# Personal shell aliases — sourced from ~/.bashrc by install.sh.
# Lives in a dotfiles repo so it persists across devcontainer prune/rebuild.

# Claude Code, skipping the permission prompts.
alias cld="claude --dangerously-skip-permissions"
alias cldr="claude --dangerously-skip-permissions --resume"

# --- talk-intella -----------------------------------------------------------
# BEST-EFFORT reconstruction (the original was lost when the devcontainer was
# pruned). Boots intella against the deployed memory-api. VERIFY the audio
# values below against the dev-VM audio recipe before trusting this.
talk-intella() {
    local repo="${INTELLA_REPO:-$HOME/intella-dialog-engine}"
    bash "$repo/services/dialog-engine/scripts/kill_intella_process.sh"

    # Dev-VM audio env — VERIFY these match your "dev-VM audio recipe" Notion page.
    export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
    export PULSE_SERVER="unix:${XDG_RUNTIME_DIR}/pulse/native"
    export GST_PULSE_DEVICE="unity_out.monitor"

    ( cd "$repo/services/dialog-engine" && uv run -m intella )
}
