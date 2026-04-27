# dotfiles

Personal shell, editor, terminal, and tool configuration.

This repo is the source of truth for the tracked configs below. `bin/setup` creates the needed directories, links the configs into place, and installs the base tooling used by the shell and editor setup.

## Files

### Documentation

#### `README.md`
This document.

### Shell

#### `.zshrc`
Main Zsh configuration. It sets Helix as the editor, defines aliases, adds toolchains to `PATH`, configures a Git-aware prompt, and sources an optional `~/.zshrc.local` for machine-local overrides.

#### `.zshrc.local.example`
Example local overrides file. Copy it to `~/.zshrc.local` for secrets and machine-specific settings.

### Git

#### `.gitconfig`
Global Git configuration.

#### `.gitignore_global`
Global Git ignore rules for machine-local and generated files.

### Editors

#### `.config/helix/config.toml`
Main Helix configuration. It sets the theme, keybindings, editor behavior, and cursor settings.

#### `.config/helix/languages.toml`
Helix language-specific configuration. It currently contains the C# language server and debugger setup.

#### `.ideavimrc`
IdeaVim configuration for JetBrains IDEs.

#### `.init.vim`
Older Neovim configuration kept in the repo.

### Terminal and local tooling

#### `.config/ghostty/config`
Ghostty terminal configuration, including theme selection, fonts, window behavior, shell integration, and keybindings.

#### `Library/Application Support/lazygit/config.yml`
Lazygit configuration, mainly theme colors.

#### `.pi/agent/AGENTS.md`
Pi agent instructions.

#### `.pi/agent/settings.json`
Pi settings, including the default provider, model, thinking level, theme, and installed packages.

#### `.pi/agent/models.json`
Pi custom model provider configuration. It currently contains the local Ollama provider setup.

#### `.pi/skills/grill-me/SKILL.md`
Custom Pi skill for stress-testing a plan or design through structured questioning.

#### `.testcontainers.properties`
Testcontainers client configuration.

### Scripts

#### `bin/dev`
Workspace bootstrap script for `cmux`. It splits the current workspace, sizes the left pane to a target width, renames the workspace and tab from the current directory, then starts `pi` on the left and `hx .` on the right.

#### `bin/setup`
Machine bootstrap script. It creates required config directories, symlinks the tracked configs into `~`, installs Homebrew if needed, installs Git, Helix, Lazygit, and wget, installs .NET SDK 8 and 10 into `~/.dotnet`, installs Pi, installs `git:github.com/leblancfg/pi-ansi-themes`, and links the tracked Pi agent config and skills into `~/.pi`.

## Setup

Run:

```sh
bin/setup
```

That will link:

- `~/.zshrc`
- `~/.config/ghostty/config`
- `~/.config/helix/config.toml`
- `~/.config/helix/languages.toml`
- `~/.pi/agent/AGENTS.md`
- `~/.pi/agent/settings.json`
- `~/.pi/agent/models.json`
- `~/.pi/skills/grill-me/SKILL.md`
- `~/Library/Application Support/lazygit/config.yml`

It also creates supporting directories such as:

- `~/.config/ghostty`
- `~/.config/helix`
- `~/.dotnet`
- `~/.dotnet/tools`
- `~/.pi/agent`
- `~/.pi/skills/grill-me`
- `~/go`
- `~/go/bin`
- `~/Library/Application Support/lazygit`
- `~/Library/Python/3.11/bin`

## Usage notes

### Shells
- Zsh uses `.zshrc`.

### Editors
- Helix uses `.config/helix/config.toml` and `.config/helix/languages.toml`.
- JetBrains IdeaVim uses `.ideavimrc`.
- Neovim config is still present in `.init.vim`.

### Terminal tools
- Ghostty uses `.config/ghostty/config`.
- Lazygit uses `Library/Application Support/lazygit/config.yml`.

### Pi
- Pi agent config lives under `.pi/agent/`.
- Pi skills live under `.pi/skills/`.
- Auth and other machine-local state under `~/.pi` are not tracked here.

### Helper scripts
- Add `bin/` to your `PATH` to use `dev` directly.

```sh
dev
```

Optional tuning for the `cmux` split script:

```sh
TARGET_LEFT_WIDTH=100 CMUX_SPLIT_PROBE_AMOUNT=48 dev
```
