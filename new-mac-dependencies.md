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

### Python (via pyenv) *optional*

```sh
brew install pyenv
# Add to .zshrc: eval "$(pyenv init -)"
pyenv install 3.12
pyenv global 3.12
```

### Go *optional*

```sh
# Download from https://go.dev/dl/ or:
brew install go
```

### Rust (via rustup)

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Deno *optional*

```sh
curl -fsSL https://deno.land/install.sh | sh
```

### Bun *optional*

```sh
brew install oven-sh/bun/bun
```

## 4. Shell & Terminal

### Zinit (Plugin Manager)

Zinit is a fast, flexible zsh plugin manager with Turbo mode for async loading.

```sh
# Install zinit
git clone https://github.com/zdharma-continuum/zinit.git ~/.local/share/zinit/zinit.git
```

Plugins are configured directly in `.zshrc` and loaded automatically by zinit on first run.

### Shell Prompt (prmt + oh-my-zsh git functions)

Uses [prmt](https://github.com/3axap4eHko/prmt) for ultra-fast prompt rendering (~2ms) combined with oh-my-zsh git functions for full git status indicators.

```sh
# Install prmt via cargo (requires Rust)
cargo install prmt
```

**Prompt appearance (lambda-mod style):**

```sh
λ jonny [~/projects/repo] at  main ✔
→                                    [71a6d97]
```

**Features:**

- `λ` green on success, red on failure
- Username in yellow, path in magenta
- Git branch with `` icon in blue
- Status indicators: `✔` clean, `+` staged, `!` modified, `-` deleted, `?` untracked
- Git SHA in right prompt

See `.zshrc` template for full configuration.

### Terminal Tools

```sh
brew install fzf eza zoxide
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

### Essential Casks

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

### Optional Casks

```sh
brew install mpv                            # Media player (CLI/formula - stolendata-mpv cask has issues)
brew install --cask rider                   # JetBrains IDE for UE5
brew install --cask godot                   # Game engine
brew install --cask blender                 # 3D modeling
brew install --cask discord
brew install --cask flux                    # Screen color temperature
```

## 7. Config Files to Copy

- `.zshrc` - Shell configuration (includes prmt prompt setup)
- `MainProfile.json` - iTerm2 profile

## 8. VS Code

Login to sync settings/extensions. Key extension:

- [Atom Keymap](https://marketplace.visualstudio.com/items?itemName=ms-vscode.atom-keybindings)

## Currently Installed Brew Formulae (Reference)

<details>
<summary>Full list</summary>

```sh
aspell
zoxide
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
