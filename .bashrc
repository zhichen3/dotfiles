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

alias rm="rm -i"
alias mv="mv -i"

alias emacs="emacs-lucid"

#For pfetch

export PF_COL1=3
export PF_COL2=8
export PF_COL3=5
export EDITOR=/usr/bin/emacs
export PF_ASCII=linux
export PF_INFO="ascii title os host editor shell uptime memory palette"
export PF_ALIGN=""

export AMREX_HOME=~/Github/amrex
export MICROPHYSICS_HOME=~/Github/Microphysics
export CASTRO_HOME=~/Github/Castro

# For managing dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'


# Make terminal title bar disappear
# gsettings set org.gnome.Terminal.Legacy.Settings headerbar true

# Use redhat in mate menubar
gsettings set org.mate.panel.menubar icon-name 'redhat-icon-panel-menu'

# Load mpi
# module load mpi/mpich-$arch

# change terminal prompt
# export PS1="\u@\h:\W $ "
# export PS1="┌─[\[\e[01;32m\]\u\[\e[00m\]@\[\e[01;32m\]\h\[\e[00m\]:\[\e[1;34m\]\w\[\e[0m\]]\n└─╼ "
export PS1="\[\e[01;32m\]\u\[\e[00m\]@\[\e[01;32m\]\h\[\e[00m\]:\[\e[1;34m\]\W\[\e[0m\]$ "
# export PS1="\e[1;32m\]\w\[\e[0m\] ⇥ "


# For terminal color
# export TERM=xterm-256color
