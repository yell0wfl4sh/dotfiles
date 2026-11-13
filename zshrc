# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Disable OMZ prompt theme in favor of Starship (Tokyo Night Powerline Pills)
ZSH_THEME=""

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source "$ZSH/oh-my-zsh.sh"

# ------------------------------------------------------------------------------
# Tokyo Night CLI Readability & Highlighting Fixes
# ------------------------------------------------------------------------------
export COLORTERM="truecolor"
export LANG="en_IN.UTF-8"
export LC_CTYPE="en_IN.UTF-8"

# 1. Fix LS_COLORS: eliminate unreadable blue-on-neon-green world-writable dirs (ow=34;42)
if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
  export LS_COLORS="${LS_COLORS}:ow=01;36:tw=01;36:st=01;34:di=01;34:ln=01;36:ex=01;32:"
fi

# 2. Fix ZSH Paste, Mouse/Vi Visual Selection & Search Highlights (no reverse-video glare)
zle_highlight=(
  region:bg=#2e3c64,fg=#c0caf5,bold
  paste:bg=#2e3c64,fg=#c0caf5
  isearch:bg=#e0af68,fg=#16161e,bold
  suffix:fg=#7dcfff,bold
)

# 3. Tokyo Night ZSH Autosuggestions (muted slate-blue, clearly legible on #1a1b26)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#565f89"

# 4. Tokyo Night ZSH Syntax Highlighting
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]='fg=#c0caf5'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#f7768e,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#bb9af7,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#7aa2f7,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#7dcfff,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=#7aa2f7,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=#9ece6a,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#7dcfff,underline'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#bb9af7'
ZSH_HIGHLIGHT_STYLES[path]='fg=#a9b1d6,underline'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#7dcfff'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#7dcfff'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#9ece6a'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#e0af68'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#e0af68'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#565f89,italic'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#9ece6a,bold'

# 5. Readable Tokyo Night man pages & less search highlights
export LESS="-R"
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;48;2;46;60;100;38;2;192;202;245m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;36m'

# ------------------------------------------------------------------------------
# User Aliases, Functions & PATH
# ------------------------------------------------------------------------------
alias vim="nvim"
alias tmux="tmux -u"

function runc() {
  g++ "$1" && ./a.out < input.txt
}

# Added by Antigravity CLI installer
export PATH="$HOME/.local/bin:$PATH"

# Initialize Starship Prompt
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
