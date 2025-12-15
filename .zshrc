setopt PROMPT_SUBST

# ============================================================================
# OH-MY-ZSH CONFIGURATION
# ============================================================================

# Custom completions directory (for CLI tools like gh, rustup, deno, etc.)
# Generate completions with: <tool> completions zsh > ~/.zsh/completions/_<tool>
if [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then
  export FPATH="$HOME/.zsh/completions:$FPATH"
fi

# Init Homebrew (must be early for other tools)
eval "$(brew shellenv)"
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# Oh-my-zsh setup
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME is disabled - using prmt instead

# Speed optimization: Disable auto-update checks (saves ~43ms)
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"

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
  fzf-tab                    # Must be BEFORE autosuggestions (fuzzy tab completion)
  zsh-autosuggestions        # Inline history suggestions (fish-style)
  fast-syntax-highlighting   # Faster than zsh-syntax-highlighting
  autojump
)
source $ZSH/oh-my-zsh.sh

# ============================================================================
# PROMPT CONFIGURATION (prmt + oh-my-zsh git hybrid)
# ============================================================================
# Uses prmt for fast rendering (~2ms) + oh-my-zsh for full git status
# Appearance: λ user [~/path] at  branch ✔
#             →                           [sha]

# Git status theme variables (lambda-mod style) - must be AFTER oh-my-zsh source
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

# Hybrid prompt: prmt (fast) + oh-my-zsh git (full status with ✔)
PROMPT='$(prmt --shell zsh --code $? "{ok:green.bold:λ}{fail:red.bold:λ} {env:yellow.bold:USER} {path:purple:r:[:]} ")$(git_prompt_info)$(git_prompt_status)
%F{cyan}%B→%b%f '
RPROMPT='$(git_prompt_short_sha)'

# fzf shell integration (keybindings + completion)
source <(fzf --zsh)

# Speed optimization: Cache completions (saves ~20-30ms)
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# ============================================================================
# SHELL CONFIGURATION
# ============================================================================

export LANG=en_US.UTF-8
export EDITOR="code-insiders"

# ============================================================================
# ALIASES
# ============================================================================

# Navigation
alias p="cd ~/projects"
alias b="cd .."
alias c="clear"

# Utilities
alias code="code-insiders"
alias ls='eza -la'

# Git
alias ga='git add'
alias gc='git commit'
alias g.='git add .; git commit -m'
alias gs='git status'
alias gpo='git push origin'
alias gco="git checkout"
alias gcob='git checkout -b'
alias gb='git branch -av'
alias gsync='git checkout main; git pull origin main;'
alias gcm='git checkout master; git pull;'
alias gbd='git branch | grep -v "master" | xargs git branch -D'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Python
alias python="python3"
alias pip="pip3"

# ============================================================================
# NVM (Node Version Manager) - Lazy Loading
# ============================================================================
# Saves ~345ms on shell startup by only loading NVM when first used

export NVM_DIR="$HOME/.nvm"

nvm() {
  unset -f nvm node npm npx
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
  nvm "$@"
}

node() {
  unset -f nvm node npm npx
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
  node "$@"
}

npm() {
  unset -f nvm node npm npx
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
  npm "$@"
}

npx() {
  unset -f nvm node npm npx
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
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
# - Pyenv (Python)
# - Bun
# - Go
