# Shell setup
autoload -Uz compinit vcs_info
compinit

# Keep PATH entries unique while preserving order.
typeset -U path PATH

# Editors
export EDITOR=hx
export VISUAL=hx

# Environment
export DOTNET_ROOT="$HOME/.dotnet"
export GOPATH="$HOME/go"
export DOTFILES_DIR="$HOME/Projects/Private/dotfiles"

# Repo location
ZSHRC_SOURCE="${${(%):-%x}:A}"

path_prepend_if_dir() {
  local dir="$1"
  [[ -d "$dir" ]] && path=("$dir" $path)
}

# PATH
path_prepend_if_dir "$DOTFILES_DIR/bin"
path_prepend_if_dir "$HOME/.opencode/bin"
path_prepend_if_dir /opt/homebrew/opt/node@16/bin
path_prepend_if_dir /opt/homebrew/opt/postgresql@15/bin
path_prepend_if_dir "$HOME/Library/Python/3.11/bin"
path_prepend_if_dir "$DOTNET_ROOT"
path_prepend_if_dir "$DOTNET_ROOT/tools"
path_prepend_if_dir "$GOPATH/bin"
path_prepend_if_dir /opt/homebrew/opt/llvm/bin
path_prepend_if_dir /Applications/Obsidian.app/Contents/MacOS

# Machine-local overrides and secrets
if [[ -f "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi

# Aliases
alias breathe='zenta now'
alias breath='zenta now --quick'
alias dicker='docker'
alias dicker-compose='docker compose'
alias docker-compose='docker compose'
alias ip='curl -s ip.bjarby.com'
alias reflect='zenta reflect'
alias swagger='docker run -p 8007:8080 -d swaggerapi/swagger-editor && open http://localhost:8007'
alias tailscale='/Applications/Tailscale.app/Contents/MacOS/Tailscale'
alias uuid="uuidgen | tr 'A-Z' 'a-z'"
alias vi='hx'
alias vim='hx'

pid() {
  OBSIDIAN_DIR="$HOME/Forest" PI_OBSIDIAN_ROOT="/obsidian" command pid "$@"
}

# Prompt
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f%F{yellow}${vcs_info_msg_0_}%f$ '
