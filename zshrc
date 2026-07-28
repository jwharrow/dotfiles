# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git 1password asdf mix)

source $ZSH/oh-my-zsh.sh

# ---------------------------------------------------------------------------
# History
# ---------------------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# ---------------------------------------------------------------------------
# Editor
# ---------------------------------------------------------------------------
export EDITOR="vim"
export VISUAL="$EDITOR"
export ECTO_EDITOR="$EDITOR"

# ---------------------------------------------------------------------------
# Completion tweaks
# ---------------------------------------------------------------------------
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# ---------------------------------------------------------------------------
# ls colors (fixes unreadable dark-blue directories on dark backgrounds)
# ---------------------------------------------------------------------------
export LSCOLORS="GxFxCxDxBxegedabagacad"

# ---------------------------------------------------------------------------
# Elixir / Erlang niceties
# ---------------------------------------------------------------------------
export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"
export KERL_BUILD_DOCS=yes

# ---------------------------------------------------------------------------
# Aliases: general
# ---------------------------------------------------------------------------
alias ls='ls -Gh'
alias l='ls -Ghal'
alias bp="vim ~/.zshrc"
alias sbp="source ~/.zshrc"
alias vom="vim"
alias lst='eza -alF --git'

# ---------------------------------------------------------------------------
# Aliases: git
# ---------------------------------------------------------------------------
alias gs="git status"
alias gp="git pull"
alias gco="git checkout"
alias glg="git lg"
alias gg='open $(git config remote.origin.url | sed "s/git@\(.*\):\(.*\).git/https:\/\/\1\/\2/")/tree/$(git symbolic-ref --quiet --short HEAD)'

# ---------------------------------------------------------------------------
# Aliases: mix / Elixir
# ---------------------------------------------------------------------------
alias mt="mix test"
alias mtf="mix test --failed"
alias mdg="mix deps.get"
alias mdc="mix deps.compile"
alias mc="mix compile"
alias mf="mix format"
alias iexs="iex -S mix"
alias iexps="iex -S mix phx.server"

# ---------------------------------------------------------------------------
# 1Password CLI
# ---------------------------------------------------------------------------
[ -f "$HOME/.config/op/plugins.sh" ] && source "$HOME/.config/op/plugins.sh"

# ---------------------------------------------------------------------------
# Local overrides (job-specific stuff, kept out of version control)
# ---------------------------------------------------------------------------
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# ---------------------------------------------------------------------------
# PATH additions
# ---------------------------------------------------------------------------
export PATH="$HOME/.local/bin:$PATH"
