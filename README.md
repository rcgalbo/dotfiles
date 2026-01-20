# dotfiles

Personal configuration files for bash, zsh, vim, neovim, and tmux.

## Contents

```
.
├── .bash_aliases      # Bash alias definitions
├── .bash_profile      # Bash login shell configuration
├── .bashrc            # Bash interactive shell configuration
├── .zshrc             # Zsh shell configuration
├── .vimrc             # Vim configuration
├── .tmux.conf         # Tmux configuration
├── config.sh          # Setup script for neovim
├── setting.json       # VS Code settings
└── nvim/
    ├── init.lua       # Neovim configuration (Lua)
    └── colors/
        └── solarized.vim  # Solarized colorscheme
```

## Installation

### Quick Setup

```bash
# Clone the repository
git clone https://github.com/rcgalbo/dotfiles.git ~/dotfiles

# Create symlinks
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile

# For Neovim
mkdir -p ~/.config/nvim/colors
ln -sf ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/nvim/colors/solarized.vim ~/.config/nvim/colors/solarized.vim
```

### API Keys Setup

API keys are sourced from `~/.secrets` (not included in this repo). Create this file with your keys:

```bash
# ~/.secrets
export ANTHROPIC_API_KEY=your_key_here
export OPENAI_API_KEY=your_key_here
# ... etc
```

## Features

### Shell (Bash/Zsh)

- **History**: Extended history with duplicate handling
- **Aliases**: Git shortcuts (`gs`, `gaa`, `gc`, `gp`), tmux shortcuts, editor shortcuts
- **Conda**: Auto-initialization for miniconda
- **fnm/nvm**: Node.js version management
- **Prompt**: Git branch display in prompt (zsh)

### Vim/Neovim

- **Mouse support**: Full mouse support with tmux compatibility
- **Auto-save**: Files automatically save on change
- **Folding**: Indent-based folding
- **Keybindings**:
  - `,r` - Open file explorer
  - `,p` - Paste from system clipboard
  - `,y` - Yank to system clipboard
  - `,b` - Run Black formatter
  - `,/` - Comment line
  - `,?` - Uncomment line
  - `Ctrl+j/k` - Move lines up/down
- **Plugins** (via vim-plug):
  - vim-black for Python formatting

### Tmux

- **Prefix**: `Ctrl+a` (instead of default `Ctrl+b`)
- **Mouse**: Full mouse support
- **Vi mode**: Vi-style copy mode
- **Keybindings**:
  - `\` - Vertical split
  - `-` - Horizontal split
  - `h/j/k/l` - Navigate panes
  - `H/J/K/L` - Swap panes
  - Arrow keys - Resize panes
  - `Ctrl+s` - Sync panes
  - `r` - Reload config
- **Plugins** (via TPM):
  - tmux-resurrect - Session persistence
  - tmux-better-mouse-mode - Improved mouse support

## Dependencies

- [neovim](https://neovim.io/)
- [tmux](https://github.com/tmux/tmux)
- [vim-plug](https://github.com/junegunn/vim-plug) (auto-installs)
- [TPM](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager

Install TPM:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Common Aliases

| Alias | Command |
|-------|---------|
| `gs` | `git status` |
| `gaa` | `git add .` |
| `gc` | `git commit -m` |
| `gp` | `git push` |
| `vi`/`vim` | `nvim` |
| `tks` | `tmux kill-session` |
| `ta` | `tmux attach` |
| `tls` | `tmux list-sessions` |
| `ez`/`eb` | Edit zshrc/bashrc |
| `sz`/`sb` | Source zshrc/bashrc |

## License

MIT
