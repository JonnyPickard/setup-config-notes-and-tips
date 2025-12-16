setopt PROMPT_SUBST

# ============================================================================
# HOMEBREW (hardcoded for speed - saves ~100ms)
# ============================================================================

export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export MANPATH="/opt/homebrew/share/man${MANPATH:+:$MANPATH}"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

# ============================================================================
# ZINIT INITIALIZATION
# ============================================================================

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

# ============================================================================
# ZINIT PLUGINS
# ============================================================================

# Oh-My-Zsh libraries for git prompt
zinit snippet OMZL::functions.zsh
zinit snippet OMZL::async_prompt.zsh
zinit snippet OMZL::git.zsh

# Completions - load early
zinit ice blockf
zinit light zsh-users/zsh-completions

# fzf-tab - must load before autosuggestions
zinit light Aloxaf/fzf-tab

# Autosuggestions - load immediately for instant suggestions
zinit ice atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# Syntax highlighting - deferred with turbo mode (not needed until typing)
zinit ice wait lucid
zinit light zdharma-continuum/fast-syntax-highlighting

# ============================================================================
# PROMPT CONFIGURATION (prmt + oh-my-zsh git)
# ============================================================================
# Uses prmt for fast rendering (~2ms) + oh-my-zsh for full git status
# Appearance: λ user [~/path] at  branch ✔
#             →                           [sha]

# Git status theme variables (lambda-mod style)
# Important:  is a special character (branch symbol) even if it looks like an error it will work in the terminal
ZSH_THEME_GIT_PROMPT_PREFIX="%F{magenta}at %F{blue} "
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

PROMPT='$(prmt --shell zsh --code $? "{ok:green.bold:λ}{fail:red.bold:λ} {env:yellow.bold:USER} {path:purple:r:[:]} ")$(git_prompt_info)$(git_prompt_status)
%F{cyan}%B→%b%f '
RPROMPT='$(git_prompt_short_sha)'

# ============================================================================
# FZF & ZOXIDE
# ============================================================================

# fzf shell integration
eval "$(fzf --zsh)"

# zoxide (smarter cd) - uses 'j' command
eval "$(zoxide init zsh --cmd j)"

# ============================================================================
# COMPLETIONS
# ============================================================================

autoload -Uz compinit
compinit -C

# ============================================================================
# SHELL CONFIGURATION
# ============================================================================

export LANG=en_US.UTF-8
export EDITOR="code-insiders"

# ============================================================================
# ALIASES
# ============================================================================

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
alias gb="git for-each-ref --sort=-committerdate refs/heads/ --format=$'\033[95m%(committerdate:relative)\033[0m | \033[94m%(authorname)\033[0m | %(refname:short)'"
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
# - Pyenv (Python): eval "$(pyenv init -)"
# - Bun
# - Go
