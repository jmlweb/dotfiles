# Enable aliases to be sudo’ed
alias sudo='sudo '

alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -l"
alias la="ls -la"
alias ~="cd ~"

# Git
alias git_current_branch='git rev-parse --abbrev-ref HEAD'

alias ga='git add'
alias gaa='git add --all'

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'

alias gc='$DOTLY_PATH/bin/dot git commit -v'
alias gca='git commit -v -a'
alias gcam='git commit -a -m'

alias gpristine='git reset --hard && git clean -dffx'

alias gst='git status'

alias gco="git checkout"
alias gcb='git checkout -b'
alias gcm='git checkout $(git_main_branch)'
alias gcd='git checkout $(git_develop_branch)'

alias gd='$DOTLY_PATH/bin/dot git pretty-diff'

alias gf="git fetch"
alias gfa='git fetch --all --prune --jobs=10'
alias gfo='git fetch origin'

alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'

alias gl='$DOTLY_PATH/bin/dot git pretty-log'

# Utils
alias k='kill -9'
alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias o.='open .'
alias up='dot package update_all'
