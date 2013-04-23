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
alias gcm='git commit -m'  # Usage: gcm "message"
alias gdf='git diff --cached'  # Show diff for staged files
alias gpl='git pull origin master'
alias gps='git push origin master'
alias glg='echo; git log --pretty=oneline | sed "s/^[a-z0-9]* />  /g"; echo;'  # Git log


la_func() {
    ls -laF $* | tail -n +4
}

