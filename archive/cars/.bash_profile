# Load .cars_secrets if it exists
test -f ~/.cars_secrets && source ~/.cars_secrets

# Load .fun if it exists
test -f ~/.fun && source ~/.fun

# Load .bash_functions if it exists
test -f ~/.bash_functions && source ~/.bash_functions

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH

# Load .bashrc if it exist
# test -f ~/.bashrc && source ~/.bashrc

# $VARIABLE will render before the rest of the command is executed
echo "Logged in as $USER at $(hostname)"

# Load git completions
git_completion_script=/usr/local/etc/bash_completion.d/git-completion.bash
test -s $git_completion_script && source $git_completion_script

# A more colorful prompt
# \[\e\0,\] resets the color to default color
ColorReset='\[\e[0m\]'
# \e[0;31m\ sets the color to red
ColorRed='\[\e[0;31m\]'
# \e[0;32m\ sets the color to green
ColorGreen='\[\e[0;32m\]'
# \e[0;35m\ sets the color to purple
ColorPurple='\[\e[0;35m\]'

# PS1 is the variable for the prompt you see everytime you enter.
# git_prompt_script=/usr/local/etc/bash_completion.d/git-prompt.sh
# if [ -s $git_prompt_script ]; then
  # if git-prompt is installed, use it (ie. to install it use: 'brew install git')
#   source $git_prompt_script
#   export GIT_PS1_SHOWDIRTYSTATE=1
  #set the prompt to display current working director in red along with git branch
#   export PS1="\n\t $ColorRed\W$ColorReset$ColorGreen\$(__git_ps1)$ColorReset :> "
  # export PS1='\W$(__git_ps1 " (%s)") $ '
# else
  # otherwise omit git from the prompt
#   export PS1="\n\t $ColorRed\W$ColorReset :> "
# fi

# Open remote for current branch in github
alias gh='open $(git config remote.origin.url | sed "s/git@\(.\):\(.\).git/https:\/\/\1\/\2/")/tree/$(git symbolic-ref --quiet --short HEAD )'

# Colors ls should use for folders, files, symlinks, etc (see LSCOLORS in ls)
# export LSCOLORS=ExGxFxdxCxDxDxaccxaeex

# Force ls to use colors (G)
alias ls='ls -G'
alias l='ls -Ghal'

# pretty ls with git info
alias lst='exa -alF --git'
alias bp='vim ~/.bash_profile'
alias sbp='source ~/.bash_profile'
alias vom='vim'
alias got='git'
alias diaper='mix dialyzer --format dialyxir'

# ElasticSearch
alias es-start='cd $HOME/elasticsearch-7.5.0 && ./bin/elasticsearch'

export GREP_COLORS=ne
export ERL_AFLAGS="-kernel shell_history enabled"
