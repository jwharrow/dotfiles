#!/usr/bin/env bash

echo "running zshrc"

# Load .cars_secrets if it exists
test -f ~/.cars_secrets && source ~/.cars_secrets

# Load .fun if it exists
test -f ~/.fun && source ~/.fun

# Load .bash_functions if it exists
test -f ~/.bash_functions && source ~/.bash_functions

. $HOME/.asdf/asdf.sh

export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
eval "$(pyenv init -)"
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

export PSQL_SOURCE="docker"


autoload -Uz compinit && compinit
zstyle ':completion:*' list-suffixeszstyle ':completion:*' expand prefix suffix
# load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit
[[ -r ~/Projects/autopkg_complete/autopkg ]] && source ~/Projects/autopkg_complete/autopkg




# export PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}'$vcs_info_msg_0_'%1~%f%b %#'
export RPROMPT='%*'


# Open remote for current branch in github
alias gh='open $(git config remote.origin.url | sed "s/git@\(.*\):\(.*\).git/https:\/\/\1\/\2/")/tree/$(git symbolic-ref --quiet --short HEAD )'

# Force ls to use colors (G)
alias ls='ls -G'
alias l='ls -Ghal'

# pretty ls with git info
alias lst='exa -alF --git'
alias bp='vim ~/.zshrc'
alias sbp='source ~/.zshrc'
alias vom='vim'
alias got='git'
alias get='git'
alias diaper='mix dialyzer --format dialyxir'

export GREP_COLORS=ne
export ERL_AFLAGS="-kernel shell_history enabled"

function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo $branch
  fi
}

# look at https://starship.rs/
# eval "$(starship init zsh)"

# try ohmyzsh/prezto

# Enable substitution in the prompt.
setopt prompt_subst

prompt () {
  PROMPT="%(?.%F{green}√.%F{red}?%?)%f" # success failure
  PROMPT+="%F{yellow} %1~ %f"
  PROMPT+="%F{cyan}$('git_branch_name')%f" # git details
  PROMPT+="~$ " # end
}
precmd_functions+=(prompt)

export TERM=xterm-256color
export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"

export AWS_SDK_LOAD_CONFIG=1
export ECTO_EDITOR="code"
