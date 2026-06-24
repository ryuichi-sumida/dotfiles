# dotfiles

Personal shell setup that follows me into every VS Code devcontainer, so my
aliases survive a devcontainer prune/rebuild instead of being lost.

## What's here
- `aliases.sh` — my aliases (`cld`, `cldr`, `talk-intella`).
- `install.sh` — sources `aliases.sh` from `~/.bashrc` (idempotent). VS Code runs
  this automatically when a devcontainer is created.

## One-time VS Code setup
In VS Code user settings (`Cmd/Ctrl+,` → search "dotfiles"):
- **Dotfiles: Repository** → `<my-github-username>/dotfiles`
- **Dotfiles: Install Command** → `~/dotfiles/install.sh`
- **Dotfiles: Target Path** → `~/dotfiles`

From then on, every new devcontainer clones this repo and runs `install.sh`,
giving me my aliases automatically.
