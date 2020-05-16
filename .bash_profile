# --- bashrc ---
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

if [ -d "$HOME/bin" ] ; then
            PATH="$HOME/bin:$PATH"
fi

# --- personals ---
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim
