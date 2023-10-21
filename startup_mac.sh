#!/bin/zsh
# Install Brew
if ! command -v brew &> /dev/null 
then
  /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo 'brew already installed. Skipping...'
fi
# 

# Check if git exists and install using Xcode Tools if not present 
git --version 

# install the rest of the repo if not present 
mkdir -p ~/git
DOTS_DIR=~/git/dots
if [[ -d $DOTS_DIR ]]
then
  echo 'Dots directory already present at ${DOTS_DIR}. Skipping...'
else
  git clone https://github.com/juansc/dots/ ${DOTS_DIR}
fi

# symlink files in this directory
. ${DOTS_DIR}/link_files.sh

brew install alacritty
brew install iterm2
brew install gh
brew install sizeup
brew install diff-so-fancy
brew install httpie
brew install ripgrep
brew install git-delta
brew install fd
brew install tree
brew install jq
brew install go@1.17
brew install rustup
brew install tmux
brew install neovim
brew install lazygit


## ZSH Section ##
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k
git clone https://github.com/bobthecow/git-flow-completion ${ZSH_CUSTOM}/plugins/git-flow-completion

# Install fonts
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Install Jetbrains IDE
brew install --cask goland
