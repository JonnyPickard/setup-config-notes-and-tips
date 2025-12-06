# Dependencies For New Mac

## 1. Xcode Command Line Tools

```sh
xcode-select --install
```

## 2. Homebrew (Package Manager)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 3. Programming Languages

### Node.js (via NVM)

```sh
brew install nvm
mkdir ~/.nvm
# Add to .zshrc: export NVM_DIR="$HOME/.nvm"
nvm install --lts
```

### Python (via pyenv)

```sh
brew install pyenv
# Add to .zshrc: eval "$(pyenv init -)"
pyenv install 3.12
pyenv global 3.12
```

### Go

```sh
# Download from https://go.dev/dl/ or:
brew install go
```

### Rust (via rustup)

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Deno

```sh
curl -fsSL https://deno.land/install.sh | sh
```

### Bun

```sh
brew install oven-sh/bun/bun
```

## 4. Shell & Terminal

### Oh-My-Zsh

```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Oh-My-Zsh Custom Plugins

```sh
# fzf-tab (fuzzy tab completion)
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

# zsh-autosuggestions (fish-style suggestions)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# fast-syntax-highlighting (faster than zsh-syntax-highlighting)
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

### Shell Prompt

- [prmt](https://github.com/3axap4eHko/prmt) - Ultra-fast, customizable shell prompt

```sh
# Install via cargo (requires Rust)
cargo install prmt
```

### Terminal Tools

```sh
brew install fzf eza autojump
```

## 5. CLI Tools

### Essential

```sh
brew install git gh lazygit neovim wget tree
```

### Development

```sh
brew install biome just watchexec cmake
```

### Utilities

```sh
brew install ffmpeg ranger nnn
```

### Java (if needed)

```sh
brew install openjdk@17 openjdk@11
```

## 6. GUI Applications (Casks)

### Essential

```sh
brew install --cask iterm2
brew install --cask visual-studio-code@insiders
brew install --cask docker
brew install --cask pgadmin4
brew install --cask github                  # GitHub Desktop
brew install --cask raycast
brew install --cask firefox
brew install --cask postman
brew install --cask jordanbaird-ice@beta    # Menu bar manager
brew install --cask meld                    # Diff tool
```

### Optional

```sh
brew install mpv                            # Media player (CLI/formula - stolendata-mpv cask has issues)
brew install --cask rider                   # JetBrains IDE for UE5
brew install --cask godot                   # Game engine
brew install --cask blender                 # 3D modeling
brew install --cask discord
brew install --cask flux                    # Screen color temperature
```

## 7. Config Files to Copy

- `.zshrc` - Shell configuration
- `lambda-jmod.zsh-theme` - Custom oh-my-zsh theme (copy to `~/.oh-my-zsh/themes/`)
- `MainProfile.json` - iTerm2 profile

## 8. VS Code

Login to sync settings/extensions. Key extension:

- [Atom Keymap](https://marketplace.visualstudio.com/items?itemName=ms-vscode.atom-keybindings)

## Currently Installed Brew Formulae (Reference)

<details>
<summary>Full list</summary>

```
aspell
autojump
automake
biome
cmake
coreutils
django-completion
eza
ffmpeg
fzf
gh
git
gobject-introspection
guile
just
lazygit
markdownlint-cli
neovim
nnn
nvm
openjdk@11
openjdk@17
openvino
oven-sh/bun/bun
pipx
protobuf
pyenv
python@3.10
python@3.11
ranger
rbenv
shopify/shopify/themekit
telnet
tree
uv
watchexec
wget
```

</details>
