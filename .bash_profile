source ~/.bash_profile_secrets

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# $VARIABLE will render before the rest of the command is executed
echo "Logged in as $USER at $(hostname)"

# Path for brew
test -d /usr/local/bin && export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
# Path for Heroku
test -d /usr/local/heroku/ && export PATH="/usr/local/heroku/bin:$PATH"

# Load git completions
git_completion_script=/usr/local/etc/bash_completion.d/git-completion.bash
test -s $git_completion_script && source $git_completion_script

# Rbenv bs
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# Kiex bs
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

# A more colorful prompt.
# \[\e[0m\] resets the color to default color
ColorReset='\[\e[0m\]'
#  \e[0;31m\ sets the color to red
ColorRed='\[\e[0;31m\]'
# \e[0;32m\ sets the color to green
ColorGreen='\[\e[0;32m\]'

# PS1 is the variable for the prompt you see everytime you hit enter.
git_prompt_script=/usr/local/etc/bash_completion.d/git-prompt.sh
if [ -s $git_prompt_script ]; then
  # if git-prompt is installed, use it (ie. to install it use:
  # `brew install git`)
  source $git_prompt_script
  export GIT_PS1_SHOWDIRTYSTATE=1
  # set the prompt to display current working directory in red along with git branch

  export PS1="\n$ColorRed\W$ColorReset$ColorGreen\$(__git_ps1)$ColorReset :> "

  # Another possibile prompt, with a color coded git-branch
  # export GIT_PS1_SHOWCOLORHINTS=1
  # export PROMPT_COMMAND='__git_ps1 "\n$ColorRed\W$ColorReset" " :> "'
  
else
  # otherwise omit git from the prompt
  export PS1="\n$ColorRed\W$ColorReset :> "
fi

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=ExGxFxdxCxDxDxaccxaeex
# Force ls to use colors (G) and use humanized file sizes (h)
alias ls='ls -Gh'
alias l='ls -Ghal'

export GREP_COLORS=ne
# parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }
# export PS1="\[\033[36m\]\h:\w \[\033[33m\]\$(parse_git_branch)\[\033[00m\]$\[\033[00m\] "

alias bp="vim ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias vom="vim"
alias be="bundle exec"

alias infra-reset="cd ~/code/infrastructure && git pull && ruby ~/code/infrastructure/scripts/ssh_config.rb > ~/.ssh/config && cat ~/.ssh/more_config >> ~/.ssh/config"
export IAM_USER="joe"

test -f ~/.git-completion.bash && . $_
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
