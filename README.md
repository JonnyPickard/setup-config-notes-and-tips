# New Mac Setup

Configuration files and setup notes for a new Mac development environment.

## Quick Start

See [new-mac-dependencies.md](./new-mac-dependencies.md) for full installation instructions.

## Contents

- [Shell Prompt (prmt)](#shell-prompt-prmt)
- [Zinit (Plugin Manager)](#zinit-plugin-manager)
- [Profiling ZSH Startup Time](#profiling-zsh-startup-time)
- [VS Code](#vs-code)
- [iTerm2](#iterm2)

## Shell Prompt (prmt)

Uses a hybrid setup: [prmt](https://github.com/3axap4eHko/prmt) for ultra-fast rendering (~2ms) + oh-my-zsh git functions for full status indicators.

**Appearance:**

```sh
λ jonny [~/projects/repo] at  main ✔
→                                    [71a6d97]
```

**Features:**

- `λ` green on success, red on failure
- Username (yellow), path (magenta), git branch (blue)
- Git status: `✔` clean, `+` staged, `!` modified, `-` deleted, `?` untracked
- Git SHA in right prompt

**Install:**

```sh
cargo install prmt
```

Full configuration is in [.zshrc](./.zshrc).

## Zinit (Plugin Manager)

Uses [zinit](https://github.com/zdharma-continuum/zinit) for fast plugin management with Turbo mode.

**Install:**

```sh
git clone https://github.com/zdharma-continuum/zinit.git ~/.local/share/zinit/zinit.git
```

Plugins are configured in `.zshrc` and auto-installed by zinit on first run.

**Plugin list:**

| Plugin | Description |
|--------|-------------|
| [zsh-completions](https://github.com/zsh-users/zsh-completions) | Additional completion definitions |
| [fzf-tab](https://github.com/Aloxaf/fzf-tab) | Fuzzy dropdown tab completion |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | Fish-style inline history suggestions |
| [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) | Real-time syntax highlighting (Turbo loaded) |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter cd - jump to directories (`j <path>`) |

**Keyboard shortcuts:**

| Shortcut | Action |
|----------|--------|
| `Tab` | Fuzzy dropdown completion (fzf-tab) |
| `→` | Accept inline autosuggestion |
| `↑` / `↓` | History search by prefix (type `brew`, press ↑ to cycle `brew` commands) |
| `Ctrl+R` | Fuzzy search command history |
| `Ctrl+T` | Fuzzy file finder |
| `Alt+C` | Fuzzy cd into directories |

**History search keybindings (add to `.zshrc`):**

```zsh
# Type a prefix, then Up/Down to cycle matching history entries
bindkey '^[[A' history-search-backward    # Up arrow
bindkey '^[[B' history-search-forward     # Down arrow
bindkey '^[OA' history-search-backward    # Up arrow (alternate escape sequence)
bindkey '^[OB' history-search-forward     # Down arrow (alternate escape sequence)
```

> **Note:** Both escape sequences (`^[[A` and `^[OA`) are needed because different terminals use different codes. This is separate from zsh-autosuggestions (gray ghost text) - it lets you interactively cycle through all matching history entries.

## Profiling ZSH Startup Time

Use these snippets to diagnose slow shell startup.

### Quick Total Time

Add to **top** of `.zshrc`:

```sh
zmodload zsh/datetime
__zshrc_start=$EPOCHREALTIME
```

Add to **bottom** of `.zshrc`:

```sh
printf "zshrc loaded in %.0fms\n" "$(( ($EPOCHREALTIME - __zshrc_start) * 1000 ))"
```

### Per-Section Timing

Add to **top** of `.zshrc`:

```sh
zmodload zsh/datetime
__zshrc_start=$EPOCHREALTIME
__start_time=$EPOCHREALTIME
__timing() { printf "%-40s %6.0fms\n" "$1" "$(( ($EPOCHREALTIME - __start_time) * 1000 ))"; __start_time=$EPOCHREALTIME; }
echo "───────────── ZSHRC TIMING ─────────────────────"
```

Add `__timing "Section name"` after each section you want to measure:

```sh
source $ZSH/oh-my-zsh.sh
__timing "oh-my-zsh + plugins"

# ... more config ...

_evalcache fzf --zsh
__timing "fzf (evalcache)"
```

Add to **bottom** of `.zshrc`:

```sh
printf "%-40s %6.0fms\n" "TOTAL" "$(( ($EPOCHREALTIME - __zshrc_start) * 1000 ))"
echo "─────────────────────────────────────────────────"
```

### Function-Level Profiling (zprof)

For detailed function-level breakdown, add to **top** of `.zshrc`:

```sh
zmodload zsh/zprof
```

Add to **bottom** of `.zshrc`:

```sh
zprof
```

### Command Line Timing

Quick one-off measurement without modifying `.zshrc`:

```sh
time zsh -i -c exit
```

## VS Code

Login to sync settings/extensions. Key extension:

- [Atom Keymap](https://marketplace.visualstudio.com/items?itemName=ms-vscode.atom-keybindings)

## iTerm2

[iTerm2](https://iterm2.com/downloads.html) is my terminal of choice.

Import [MainProfile.json](./MainProfile.json) as a profile for colors and settings.
