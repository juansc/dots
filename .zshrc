export PATH="/usr/local/bin:/usr/bin/git:/usr/bin:/usr/local/sbin:$PATH"
export TERM="xterm-256color"
export XDG_CONFIG_HOME="$HOME/.config"

# COMPLETION SETTINGS
# add custom completion scripts
fpath=($HOME/.zfunc $HOME/.oh-my-zsh/custom/completion $fpath) 

# compsys intialization
autoload -U compinit && compinit

function last_tags() {
  # Default to the last 10 tags
  git tl | grep "$1" | head -n ${2:-10}
}

function topn() {
    cat "$1" | sort | uniq -c | sort -nr | head -n "$2"
}

function join_by { local d=$1; shift; local f=$1; shift; printf %s "$f" "${@/#/$d}"; }

function find_file() {
  search_str="$(join_by "/&&/" $*)"
  find . | awk "/$search_str/" IGNORECASE=1
}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
# *** CHANGE THIS *** Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting git-flow-completion)
source $ZSH/oh-my-zsh.sh
# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='vim'
#else
#  export EDITOR='subl'
#fi
# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# function powerline_precmd() {
#     PS1="$(powerline-shell --shell zsh $?)"
# }
# 
# function install_powerline_precmd() {
#   for s in "${precmd_functions[@]}"; do
#     if [ "$s" = "powerline_precmd" ]; then
#       return
#     fi
#   done
#   precmd_functions+=(powerline_precmd)
# }
# 
# if [ "$TERM" != "linux" ]; then
#     install_powerline_precmd
# fi

# Go related stuff
export GOPATH=~/git/go
alias goemb="cdemb go"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/bin/

# Only show the last dir
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
# Don't show tag for current commit
POWERLEVEL9K_VCS_HIDE_TAGS=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# Use ripgrep with sed if installed.
# Usage: rgs OldPattern NewPattern
#        rgs apricott apricot
# Courtesy of @arkie
if [ -x "$(command -v rg)" ]; then
  rgs(){
    rg -l $1 | xargs sed -i '' "s$1$2g"
  }
fi

LOCAL_ZSHRC=$HOME/.local_zshrc
if [[ -f "$LOCAL_ZSHRC" ]]; then
    source $LOCAL_ZSHRC
fi

# Allow skipping words on the command line with Ctrl-Left/Right
# kitty
bindkey "\e[1;3D" backward-word # ⌥←
bindkey "\e[1;3C" forward-word # ⌥→

. /opt/homebrew/opt/asdf/libexec/asdf.sh

cdpath=($HOME/git/embrace)

autoload -U ~/.zfunc/*(.:t)

# Go stuff
GOPATH=$HOME/git/go
GOPRIVATE=github.com/embrace-io

export RESOURCE_ROOT_PATH=$HOME/git/embrace/go

# MASON junk to see if rust analyzer will get picked up
# export PATH="$HOME/.local/share/nvim/mason/bin/:$PATH"

alias lg=lazygit

# Load pyenv automatically by appending
# the following to
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
