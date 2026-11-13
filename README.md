# dotfiles

Unified **Tokyo Night** Linux CLI, ZSH, Starship, Tmux, Terminator, Neovim, and Git secret-guard dotfiles.

## What's Included

| Component | Repo Path | Host Target | Details |
| :--- | :--- | :--- | :--- |
| **ZSH** | `zshrc` | `~/.zshrc` | Oh My Zsh + Starship init, Tokyo Night syntax/autosuggestions, `LS_COLORS` (`ow`/`tw`) & `zle_highlight` paste/selection fixes |
| **Starship Prompt** | `config/starship.toml` | `~/.config/starship.toml` | Tokyo Night Rounded Powerline Pills (~30–50ms render) |
| **Tmux** | `tmux.conf` | `~/.tmux.conf` | `Ctrl+z` prefix, `vi` mode, `tmux-256color` 24-bit RGB passthrough, `#2e3c64` copy-mode highlight, persistent selection on mouse release (`copy-pipe-no-clear`), Tokyo Night pill status bar |
| **Clipboard Shims** | `local/bin/wl-copy`, `local/bin/wl-paste` | `~/.local/bin/` | GTK3-backed Wayland/X11 clipboard bridge for `tmux` and `agy` when `wl-clipboard` is not installed (auto-delegates to `/usr/bin/wl-*` if present) |
| **Terminator & GNOME Terminal** | `config/terminator/config` | `~/.config/terminator/config` | `#1a1b26` Tokyo Night 16-color palette, `94%` opacity, `JetBrainsMono Nerd Font 11` |
| **Neovim** | `config/nvim/` | `~/.config/nvim/` | Lua config (`telescope`, `treesitter`, `lsp-zero`) |
| **Git & Secret Guard** | `gitconfig`, `config/git/` | `~/.gitconfig`, `~/.config/git/` | Global `gitleaks` `pre-commit` & `pre-push` secret-blocking hooks + global ignore rules |
| **Antigravity CLI (`agy`)** | `config/agy/settings.example.json` | `~/.gemini/antigravity-cli/settings.json` | Sanitized template for native `"colorScheme": "tokyo night"` |

## Quick Install

```bash
git clone https://github.com/yell0wfl4sh/dotfiles.git ~/projects/dotfiles
cd ~/projects/dotfiles
./install
```

Or run the standalone Tokyo Night font/prompt/terminal bootstrap directly:

```bash
bash scripts/bootstrap-tokyo-night.sh
```
