#!/usr/bin/env bash
set -euo pipefail

mkdir -p "$HOME/.local/bin" "$HOME/.local/share/fonts/JetBrainsMono"

if ! command -v "$HOME/.local/bin/starship" >/dev/null 2>&1 && ! command -v starship >/dev/null 2>&1; then
  echo "==> Installing Starship prompt to ~/.local/bin..."
  curl -sS https://starship.rs/install.sh | sh -s -- -y -b "$HOME/.local/bin"
fi

if ! fc-list : family | grep -qi "JetBrainsMono Nerd Font"; then
  echo "==> Installing JetBrainsMono Nerd Font..."
  TMP_FONT="$(mktemp --suffix=.zip)"
  trap 'rm -f "$TMP_FONT"' EXIT
  curl -fsSL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip -o "$TMP_FONT"
  unzip -oq "$TMP_FONT" -d "$HOME/.local/share/fonts/JetBrainsMono" '*.ttf'
  fc-cache -f "$HOME/.local/share/fonts"
fi

if command -v gsettings >/dev/null 2>&1; then
  GNOME_PROF="$(gsettings get org.gnome.Terminal.ProfilesList default 2>/dev/null | tr -d "'" || true)"
  if [ -n "$GNOME_PROF" ]; then
    P="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${GNOME_PROF}/"
    gsettings set "$P" use-theme-colors false || true
    gsettings set "$P" background-color '#1a1b26' || true
    gsettings set "$P" foreground-color '#c0caf5' || true
    gsettings set "$P" highlight-colors-set true || true
    gsettings set "$P" highlight-background-color '#2e3c64' || true
    gsettings set "$P" highlight-foreground-color '#c0caf5' || true
    gsettings set "$P" use-system-font false || true
    gsettings set "$P" font 'JetBrainsMono Nerd Font 11' || true
    gsettings set "$P" use-transparent-background true || true
    gsettings set "$P" background-transparency-percent 6 || true
    gsettings set "$P" palette "['#15161e', '#f7768e', '#9ece6a', '#e0af68', '#7aa2f7', '#bb9af7', '#7dcfff', '#a9b1d6', '#414868', '#f7768e', '#9ece6a', '#e0af68', '#7aa2f7', '#bb9af7', '#7dcfff', '#c0caf5']" || true
  fi
fi

if command -v tmux >/dev/null 2>&1 && tmux info >/dev/null 2>&1; then
  tmux source-file "$HOME/.tmux.conf" || true
fi

echo "==> Tokyo Night CLI suite ready!"
