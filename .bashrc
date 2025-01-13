# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Aliases
alias rm="rm -i"
alias mv="mv -i"
alias emacs="emacs-lucid"

# Export to Paths
export AMREX_HOME=~/Github/amrex
export MICROPHYSICS_HOME=~/Github/Microphysics
export CASTRO_HOME=~/Github/Castro
export AMREX_HYPRE_HOME=~/Github/hypre-2.26.0/src/hypre

# set WINEPREFIX
export WINEPREFIX=$HOME/.wine
export DXVK_HUD=devinfo,fps

# Automatically set CUDA_PATH to the latest version if there is one.
CUDA_DIRS=$(ls -d /usr/local/cuda-* 2>/dev/null)
if [ -n "$CUDA_DIRS" ]; then
    CUDA_PATH=$(echo $CUDA_DIRS | tr ' ' '\n' | sort -V | tail -n 1)
    export CUDA_PATH
    export PATH=$CUDA_PATH/bin:$PATH
fi

# For managing dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Make terminal title bar disappear
# gsettings set org.gnome.Terminal.Legacy.Settings headerbar true

if [[ "${DESKTOP_SESSION}" == "mate" ]]; then
    # Use redhat in mate menubar
    gsettings set org.mate.panel.menubar icon-name 'redhat-icon-panel-menu'
    # set emacs global keybindings
    gsettings set org.mate.interface gtk-key-theme 'Emacs'
fi


# change terminal prompt
# export PS1="\u@\h:\W $ "
# export PS1="┌─[\[\e[01;32m\]\u\[\e[00m\]@\[\e[01;32m\]\h\[\e[00m\]:\[\e[1;34m\]\w\[\e[0m\]]\n└─╼ "
export PS1="\[\e[01;32m\]\u\[\e[00m\]@\[\e[01;32m\]\h\[\e[00m\]:\[\e[1;34m\]\W\[\e[0m\]$ "
# export PS1="\e[1;32m\]\w\[\e[0m\] ⇥ "

export TERM=xterm-256color
