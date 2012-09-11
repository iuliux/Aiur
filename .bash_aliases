# Bash generic aliases
alias ll='ls -lF'
alias la=la_func
alias l='ls -F'
alias ld='ls -alF | grep -v " \\./" | grep -v " \\.\\./" | grep /'
alias vi=vim
alias clr=clear
alias agrep=ack-grep

# Git aliases
alias gst='git status'


la_func() {
    ls -laF $* | tail -n +4
}

