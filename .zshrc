setopt PROMPT_SUBST

# ============================================================================
# OH-MY-ZSH CONFIGURATION
# ============================================================================

# Custom completions directory (for CLI tools like gh, rustup, deno, etc.)
# Generate completions with: <tool> completions zsh > ~/.zsh/completions/_<tool>
if [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then
  export FPATH="$HOME/.zsh/completions:$FPATH"
fi

# Init Homebrew (hardcoded for speed - saves ~100ms subprocess call)
# This is the static output of `brew shellenv` on Apple Silicon
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export MANPATH="/opt/homebrew/share/man${MANPATH:+:$MANPATH}"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

# Oh-my-zsh setup
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME is disabled - using prmt instead

# Speed optimizations
DISABLE_AUTO_UPDATE="true"      # Saves ~43ms
DISABLE_UPDATE_PROMPT="true"
DISABLE_MAGIC_FUNCTIONS="true"  # Disables paste escaping, saves ~50ms
DISABLE_COMPFIX="true"          # Skips compaudit permission checks
skip_global_compinit=1          # Skip oh-my-zsh's compinit, we'll do it ourselves

# Performance tweaks for zsh-autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Keyboard shortcuts:
# - Tab: Fuzzy dropdown completion (fzf-tab)
# - → (right arrow): Accept inline suggestion (zsh-autosuggestions)
# - Ctrl+R: Fuzzy search command history
# - Ctrl+T: Fuzzy file finder
# - Alt+C: Fuzzy cd into directories

plugins=(
  evalcache                  # Must be FIRST - caches eval commands
  fzf-tab                    # Must be BEFORE autosuggestions (fuzzy tab completion)
  zsh-autosuggestions        # Inline history suggestions (fish-style)
  fast-syntax-highlighting   # Faster than zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# ============================================================================
# PROMPT CONFIGURATION (prmt + oh-my-zsh git hybrid)
# ============================================================================
# Uses prmt for fast rendering (~2ms) + oh-my-zsh for full git status
# Appearance: λ user [~/path] at  branch ✔
#             →                           [sha]

# Git status theme variables (lambda-mod style) - must be AFTER oh-my-zsh source
ZSH_THEME_GIT_PROMPT_PREFIX="%F{magenta}at %F{blue} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{green}%B✔%b%f"
ZSH_THEME_GIT_PROMPT_ADDED=" %F{green}%B+%b%f"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %F{blue}%B!%b%f"
ZSH_THEME_GIT_PROMPT_DELETED=" %F{red}%B-%b%f"
ZSH_THEME_GIT_PROMPT_RENAMED=" %F{magenta}%B>%b%f"
ZSH_THEME_GIT_PROMPT_UNMERGED=" %F{yellow}%B#%b%f"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %F{cyan}%B?%b%f"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%F{white}%B[%F{blue}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%F{white}]%b%f"

# Hybrid prompt: prmt (fast) + oh-my-zsh git (full status with ✔)
PROMPT='$(prmt --shell zsh --code $? "{ok:green.bold:λ}{fail:red.bold:λ} {env:yellow.bold:USER} {path:purple:r:[:]} ")$(git_prompt_info)$(git_prompt_status)
%F{cyan}%B→%b%f '
RPROMPT='$(git_prompt_short_sha)'

# fzf shell integration (keybindings + completion) - cached for speed
_evalcache fzf --zsh

# zoxide (smarter cd, replaces autojump) - uses 'j' command
_evalcache zoxide init zsh --cmd j

# Note: compinit is called by fzf-tab, no need to call it again
# If completions break, uncomment:
# autoload -Uz compinit && compinit -C

# ============================================================================
# SHELL CONFIGURATION
# ============================================================================

export LANG=en_US.UTF-8
export EDITOR="code-insiders"

# ============================================================================
# ALIASES
# ============================================================================

# GENERIC

## Navigation
alias p="cd ~/projects"
alias b="cd .."
alias c="clear"

## Utilities
alias ls='eza -la'

## Git
alias ga='git add'
alias gc='git commit'
alias gco="git checkout"
alias gs='git status'

alias gb="git for-each-ref --sort=-committerdate refs/heads/ --format=$'\033[95m%(committerdate:relative)\033[0m | \033[94m%(authorname)\033[0m | %(refname:short)'" # List sorted branches with last commit date, author and name

alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Machine Specific

## If using VSCode Insiders
alias code="code-insiders"

# ============================================================================
# NVM (Node Version Manager) - Lazy Loading
# ============================================================================
# Saves ~345ms on shell startup by only loading NVM when first used

export NVM_DIR="$HOME/.nvm"

nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  nvm "$@"
}

node() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  node "$@"
}

npm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  npm "$@"
}

npx() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  npx "$@"
}

# Auto-switch node version when entering directory with .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc

# ============================================================================
# DENO
# ============================================================================

[ -f "$HOME/.deno/env" ] && . "$HOME/.deno/env"

# ============================================================================
# OTHER LANGUAGE TOOLS (add as needed)
# ============================================================================
# - Pyenv (Python): _evalcache pyenv init -
# - Bun
# - Go
