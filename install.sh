#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
pi_dir="${PI_AGENT_DIR:-$HOME/.pi/agent}"
mkdir -p "$pi_dir"

backup_if_exists() {
  local path="$1"
  if [[ -e "$path" && ! -L "$path" ]]; then
    cp -a "$path" "$path.bak.$(date +%Y%m%d%H%M%S)"
  fi
}

if ! command -v pi >/dev/null 2>&1; then
  echo "pi not found. Install it first:"
  echo "  npm install -g --ignore-scripts @earendil-works/pi-coding-agent"
  exit 1
fi

# Install this repo as a local Pi package, so extensions/skills load from git checkout.
pi install "$repo_dir"

# Install the global Pi packages used on the source machine.
packages=(
  "npm:context-mode"
  "npm:pi-subagents"
  "npm:pi-mcp-adapter"
  "npm:pi-web-access"
  "npm:@juicesharp/rpiv-ask-user-question"
  "npm:@juicesharp/rpiv-todo"
  "npm:@marckrenn/pi-sub-bar"
)
for pkg in "${packages[@]}"; do
  pi install "$pkg"
done

# Copy global instructions if absent. Existing files are preserved with a timestamp backup.
if [[ -f "$repo_dir/AGENTS.md" ]]; then
  backup_if_exists "$pi_dir/AGENTS.md"
  cp "$repo_dir/AGENTS.md" "$pi_dir/AGENTS.md"
fi

# Settings are intentionally not overwritten automatically because they may contain
# machine/provider preferences. Use settings/settings.example.json as a reference.
echo "Done. Review settings/settings.example.json and copy desired keys into $pi_dir/settings.json."
echo "Run 'pi' and authenticate with /login or API keys on this machine."
