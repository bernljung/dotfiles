source ~/.git-completion.bash

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

:q



source ~/.bash_profile
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
PATH="$PATH:/Users/jimmy/.mos/bin"
