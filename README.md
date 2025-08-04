# New Laptop Setup and Config

## ZSH and Plugins

### lambda-mod theme

- [lambda-mod theme GitHub](https://raw.githubusercontent.com/halfo/lambda-mod-zsh-theme/refs/heads/master/lambda-mod.zsh-theme)

```sh
open ~/.oh-my-zsh/themes/ # put theme here
```

```sh
# zsh - set here
ZSH_THEME="lambda-mod"
```

### autojump

Quickly navigate your filesystem by jumping to frequently used directories.

- [autojump GitHub](https://github.com/wting/autojump)

- Install:

```sh
brew install autojump
```

- Enable in Oh My Zsh:

Add to your plugins list in `.zshrc`:

```sh
plugins=(... autojump)
```

### zsh-nvm

Autoload node when navigating into a directory containing an `.nvmrc` file

- [zsh-nvm plugin GitHub](https://github.com/lukechilds/zsh-nvm)

```sh
plugins=(... zsh-nvm)
```

### syntax highlighting

Get real-time syntax highlighting in your ZSH shell.

- [zsh-syntax-highlighting GitHub](https://github.com/zsh-users/zsh-syntax-highlighting)

- Enable in Oh My Zsh:

Add to your plugins list in `.zshrc`:

```sh
plugins=(... zsh-syntax-highlighting)
```

### autosuggestions

Get command suggestions as you type, based on your history and completions.

- [zsh-autosuggestions GitHub](https://github.com/zsh-users/zsh-autosuggestions)

- Enable in Oh My Zsh:

Add to your plugins list in `.zshrc`:

```sh
plugins=(... zsh-autosuggestions)
```
