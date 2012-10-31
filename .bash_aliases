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
alias gam='git add -u'  # Stage only modified files
alias gpl='git pull origin master'
alias gps='git push origin master'


la_func() {
    ls -laF $* | tail -n +4
}

