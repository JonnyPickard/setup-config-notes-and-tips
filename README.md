# New Mac Setup

Configuration files and setup notes for a new Mac development environment.

## Quick Start

See [new-mac-dependencies.md](./new-mac-dependencies.md) for full installation instructions.

## Contents

- [Shell Prompt (prmt)](#shell-prompt-prmt)
- [ZSH Plugins](#zsh-plugins)
- [VS Code](#vs-code)
- [iTerm2](#iterm2)

## Shell Prompt (prmt)

Uses a hybrid setup: [prmt](https://github.com/3axap4eHko/prmt) for ultra-fast rendering (~2ms) + oh-my-zsh git functions for full status indicators.

**Appearance:**
```
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

## ZSH Plugins

All plugins are configured in `.zshrc`. Install the custom plugins first:

```sh
# evalcache (caches eval commands for faster startup)
git clone https://github.com/mroth/evalcache ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/evalcache

# fzf-tab (fuzzy tab completion)
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

# zsh-autosuggestions (fish-style suggestions)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# fast-syntax-highlighting (faster than zsh-syntax-highlighting)
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

**Plugin list:**
| Plugin | Description |
|--------|-------------|
| [evalcache](https://github.com/mroth/evalcache) | Caches eval commands for faster startup |
| [fzf-tab](https://github.com/Aloxaf/fzf-tab) | Fuzzy dropdown tab completion |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | Fish-style inline history suggestions |
| [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) | Real-time syntax highlighting (faster alternative) |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter cd - jump to directories (`j <path>`) |

**Keyboard shortcuts:**
- `Tab` - Fuzzy dropdown completion
- `→` (right arrow) - Accept inline suggestion
- `Ctrl+R` - Fuzzy search command history
- `Ctrl+T` - Fuzzy file finder
- `Alt+C` - Fuzzy cd into directories

## VS Code

Login to sync settings/extensions. Key extension:

- [Atom Keymap](https://marketplace.visualstudio.com/items?itemName=ms-vscode.atom-keybindings)

## iTerm2

[iTerm2](https://iterm2.com/downloads.html) is my terminal of choice.

Import [MainProfile.json](./MainProfile.json) as a profile for colors and settings.
