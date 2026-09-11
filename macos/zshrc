# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/markoristic/.oh-my-zsh"

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

export KEYTIMEOUT=100

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf vi-mode golang tmux)
plugins+=(zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set vim options
# set -o vi
# bindkey -v

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

telnet() {
    if [[ $# -eq 2 ]]; then
        curl -v telnet://$1:$2
    else
        command telnet "$@"
    fi
}

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias mgo="mgo -address=\":4040\" -dsn=\"$HOME/bin/.mgo/meinappf.db?_busy_timeout=5000&_journal_mode=WAL\" -tls=$HOME/bin/.mgo/"
#

# ALIASES #
alias nv="nvim"
alias billy="cd /Users/markoristic/open-source/billy"
alias love="~/learn/lua/love.app/Contents/MacOS/love"

export PATH=$PATH:$HOME/bin
# Add for go protoc
export PATH="$PATH:$(go env GOPATH)/bin"
source "$HOME/.cargo/env"

export ZK_NOTEBOOK_DIR="$HOME/zk-notes/"


fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit ; compinit

### HISTORY###
HISTFILE=~/.zsh_history

setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt hist_find_no_dups
setopt hist_expire_dups_first
setopt share_history


# Custom fzf history to command line
fzf-history-widget() {
  # Get the command, strip the leading numbers/spaces
  # this one counts from first
  # local cmd=$(fc -ln 1 | sed 's/^[ \t]*//' | fzf --tac --height 40%)
  #
  #This counts last 1000 in reverse which might be better for history
  local cmd=$(fc -ln -1000 | sed 's/^[ \t]*//' | fzf --tac --height 40%)
  
  # If we picked something, put it in the buffer
  if [ -n "$cmd" ]; then
    LBUFFER="$cmd"
  fi
  
  # Redraw the prompt
  zle reset-prompt
}
# Register it as a widget
zle -N fzf-history-widget
bindkey '^Fh' fzf-history-widget

fzf-git-alias-widget() {
  # 1. Get aliases filtering for 'git'
  # 2. Use sed to extract text between single quotes
  # "s/\(.*\)='.*'/\1/"
  local cmd=$(alias | rg git | fzf --height 40% --reverse | sed "s/\(.*\)='.*'/\1/")

  # If a selection was made, "push" it to the command line buffer
  if [ -n "$cmd" ]; then
    LBUFFER="$cmd"
  fi
  
  # Refresh the prompt so the text appears immediately
  zle reset-prompt
}
zle -N fzf-git-alias-widget

bindkey '^Fg' fzf-git-alias-widget
