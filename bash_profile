export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export LANG="sv_SE.UTF-8"
export LC_COLLATE="sv_SE.UTF-8"
export LC_CTYPE="sv_SE.UTF-8"
export LC_MESSAGES="sv_SE.UTF-8"
export LC_MONETARY="sv_SE.UTF-8"
export LC_NUMERIC="sv_SE.UTF-8"
export LC_TIME="sv_SE.UTF-8"
export LC_ALL=

alias vim="nvim"
alias ls="ls -G"
alias grep='grep --color=auto'

# Git branch in prompt.
parse_git_branch() {  
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "