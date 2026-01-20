# ~/.zshrc - Migrated from bashrc for Rick

# =============================================================================
# OH MY ZSH (Recommended - makes zsh much easier)
# =============================================================================
# Install with: sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Uncomment these lines after installing:
# export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"  # or try: agnoster, powerlevel10k, spaceship
# plugins=(git conda-zsh-completion zsh-autosuggestions zsh-syntax-highlighting)
# source $ZSH/oh-my-zsh.sh

# =============================================================================
# HISTORY
# =============================================================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS       # Don't record duplicates
setopt HIST_IGNORE_SPACE      # Don't record commands starting with space
setopt SHARE_HISTORY          # Share history between sessions
setopt APPEND_HISTORY         # Append to history file
setopt INC_APPEND_HISTORY     # Add commands immediately

# =============================================================================
# ZSH OPTIONS (equivalents of bash shopt settings)
# =============================================================================
setopt AUTO_CD                # cd by typing directory name
setopt CORRECT                # Command correction
setopt COMPLETE_IN_WORD       # Complete from cursor position
setopt GLOB_DOTS              # Include dotfiles in globbing
setopt EXTENDED_GLOB          # Extended globbing (like bash globstar)
setopt NO_BEEP                # No beeping

# =============================================================================
# KEY BINDINGS
# =============================================================================
bindkey -e                    # Emacs-style keybindings (or use -v for vim)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# =============================================================================
# COMPLETION
# =============================================================================
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Case insensitive

# =============================================================================
# PROMPT (simple, or use Oh My Zsh themes)
# =============================================================================
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f%F{yellow}${vcs_info_msg_0_}%f$ '

# =============================================================================
# COLORS
# =============================================================================
autoload -U colors && colors
export CLICOLOR=1
# macOS uses -G for color, Linux uses --color=auto
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# =============================================================================
# LS ALIASES
# =============================================================================
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# =============================================================================
# EDITOR ALIASES
# =============================================================================
alias vi="nvim"
alias vim="nvim"
alias ne="nedit"
alias ez="vi ~/.zshrc"          # Edit zshrc (was eb for bashrc)
alias sz="source ~/.zshrc"      # Source zshrc (was sb)
alias ev="vi ~/.vimrc"
alias ec="vi ~/.config/claude-code/config.json"
alias note="vi ~/note"

# =============================================================================
# GIT ALIASES
# =============================================================================
alias gi="git init"
alias gs="git status"
alias gaa="git add ."
alias gc="git commit -m"
alias gp="git push"

# =============================================================================
# TMUX ALIASES
# =============================================================================
alias tks="tmux kill-session"
alias ta="tmux a -d -t "
alias td="tmux detach-client"
alias tls="tmux list-sessions"
alias tns="tmux new-session -t"

# =============================================================================
# MISC ALIASES
# =============================================================================
alias code="code-insiders"
alias condastart="~/miniconda3/bin/conda init zsh"
# macOS: open Finder in current directory
alias exp="open ."

# =============================================================================
# FUNCTIONS
# =============================================================================
workon() {
  source $1/bin/activate
}

claude_engineer() {
  source ~/claude-engineer/claude-env/bin/activate
  python ~/claude-engineer/ce3.py
}

# =============================================================================
# PATH
# =============================================================================
export PATH="$HOME/.local/bin:$PATH"
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# Homebrew (macOS)
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# =============================================================================
# CONDA (run: conda init zsh after installing)
# =============================================================================
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# =============================================================================
# FNM (Fast Node Manager)
# =============================================================================
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --use-on-cd)"
fi

# =============================================================================
# NVM (if you prefer nvm over fnm)
# =============================================================================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# =============================================================================
# GOOGLE CLOUD SDK
# =============================================================================
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  . "$HOME/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  . "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

# =============================================================================
# PIPENV
# =============================================================================
export PIPENV_IGNORE_VIRTUALENVS=1
export PIPENV_VERBOSITY=-1

# =============================================================================
# API KEYS - Source from ~/.secrets
# =============================================================================
# Create ~/.secrets with your API keys:
# export ANTHROPIC_API_KEY=your_key_here
# export OPENAI_API_KEY=your_key_here
# etc.
[ -f ~/.secrets ] && source ~/.secrets

alias claude="$HOME/.local/bin/claude"
