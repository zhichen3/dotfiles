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
alias config="/usr/bin/git --git-dir=$HOME/Github/dotfiles --work-tree=$HOME"

# Make terminal title bar disappear

gsettings set org.gnome.Terminal.Legacy.Settings headerbar false

# Load mpi
# module load mpi/mpich-$arch

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

