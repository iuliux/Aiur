# Load it by adding in your ~/.bashrc:
#
#  if [ -f ~/Aiur/.bashrc ]; then
#      . ~/Aiur/.bashrc
#  fi


# History size for the command line
export HISTSIZE=9999
export HISTFILESIZE=999999

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Colored prompt, if the terminal has the capability
force_color_prompt=yes

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Pythonbrew
#[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc
# Switch to Py2.6
#pythonbrew switch 2.6


# Add ~/bin to PATH
PATH=$PATH:$HOME/bin

# CDPATH - path for cd command to look into
#CDPATH=$CDPATH:$HOME

# To cut shorter the piped utilitaries
lss() {
	# Usage example: lss cat /proc/meminfo
	$* | less
}

grp() {
	# Usage example: grp something ls -l
	local str=$1
	shift
	$* | grep $str
}
