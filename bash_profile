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

set -a
. ~/.docker_env
set +a
export PATH=/usr/local/lib/npm-global/bin:/Users/jimmy/Go/bin/darwin_amd64:$PATH
export NODE_PATH=/usr/local/lib/npm-global/lib/node_modules:$NODE_PATH

alias vim="nvim"
alias c="code"
alias ls="ls -G"
alias grep='grep --color=auto'
#alias node="docker run -v $PWD:/opt -ti -w /opt node:6.10-slim node"
#alias npm="docker run -v $PWD:/opt /usr/local/lib/node_modules:/usr/local/lib/node_modules -ti -w /opt node:6.10-slim npm"

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
