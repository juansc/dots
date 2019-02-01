export PATH="/usr/local/bin:/usr/bin/git:/usr/bin:/usr/local/sbin:$PATH"
# alias git=hub
alias gc="git checkout"
alias gcm="git checkout master"
alias gpull="git pull"
alias gpush="git push"
alias gbranch="git checkout -b"
alias gclone="git clone"
alias brews='brew list -1'
alias bubo='brew update && brew outdated'
alias bubc='brew upgrade && brew cleanup'
alias bubu='bubo && bubc'
alias tunnel='python ~/git/embrace/devops/scripts/tunnel.py start'
alias close_tunnel='python ~/git/embrace/devops/scripts/tunnel.py stop'
alias editdocker='vim ~/git/embrace/dev/docker-compose.yml'
#alias cdemb='cd ~/git/embrace && cd '
. ~/z/z.sh
function o() {
  z $1 && open .
}

EMBRACE_DIR=~/git/embrace

# COMPLETION SETTINGS
# add custom completion scripts
fpath=(/Users/juansc/.oh-my-zsh/custom/completion $fpath) 

# compsys intialization
autoload -U compinit && compinit

function cdemb() {
  cd $EMBRACE_DIR && [[ -n "$1" ]] && cd $1
}

function topn() {
    cat "$1" | sort | uniq -c | sort -nr | head -n "$2"
}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
# *** CHANGE THIS *** Path to your oh-my-zsh installation.
export ZSH=/Users/juansc/.oh-my-zsh
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"
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
alias goemb="cd $GOPATH/src/github.com/embrace-io/go"
export PATH=$PATH:$GOPATH/bin

 # bintray stuff
export BINTRAY_USER=juansc
export BINTRAY_KEY=ec07717713e89baefe6b1e8a0d8dd662c17132a9


# edx tools
source $EMBRACE_DIR/embrace-developer-extensions/edx

# Only show the last dir
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
# Don't show tag for current commit
POWERLEVEL9K_VCS_HIDE_TAGS=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

function gocheck() {
  goemb
  go vet ./... && go test ./... 
  tput setaf 1; megacheck -unused.exported=false ./...
}

export PATH=$HOME/Library/Python/2.7/bin:$PATH

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

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

