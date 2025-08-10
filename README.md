# New Laptop Setup and Config

## Contents

- [VScode and Plugins](#vscode-and-plugins)
- [ZSH and Plugins](#zsh-and-plugins)
  - [lambda-mod theme](#lambda-mod-theme)
    - [Original one left in for context](#original-one-left-in-for-context)
  - [autojump](#autojump)
  - [zsh-nvm](#zsh-nvm)
  - [syntax highlighting](#syntax-highlighting)
  - [autosuggestions](#autosuggestions)
- [iTerm2](#iterm2)

## VScode and Plugins

Theoretically just logging in should be good enough to install all my plugins.

[Atom Keymap](https://marketplace.visualstudio.com/items?itemName=ms-vscode.atom-keybindings) is probably the most important one. As at this point i'm so used to the atom shortcuts I can't live without them.

## ZSH and Plugins

### lambda-mod theme

Use the modified on in this repo as it fixes the git branch prompt being in a `detached-head` state: [lambda-jmod.zsh-theme](./lambda-jmod.zsh-theme)

```sh
# copy to theme directory
cp ./lambda-jmod.zsh-theme ~/.oh-my-zsh/themes/
```

```sh
# zsh - set here
ZSH_THEME="lambda-jmod"
```

#### Original one left in for context

- [lambda-mod theme GitHub](https://raw.githubusercontent.com/halfo/lambda-mod-zsh-theme/refs/heads/master/lambda-mod.zsh-theme)

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

## iTerm2

[iTerm2](https://iterm2.com/downloads.html)

I tried a bunch of different terminals on mac but iTerm2 is the most consistent one with the best feature set atm.

[MainProfile.json](./MainProfile.json) is my main iTerm2 profile with colors etc. Just need to install iTerm2 and import is as a profile.
