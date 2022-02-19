# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# 

# Check if git exists and install using Xcode Tools if not present 
git --version 

# brew install git
mkdir -p ~/git
DOTS_DIR=~/git/dots/
git clone https://github.com/juansc/dots/ ${DOTS_DIR}
cp ${DOTS_DIR}/.gitconfig ${HOME}/
cp ${DOTS_DIR}/.gitignore_global ${HOME}/
cp ${DOTS_DIR}/.zshrc ${HOME}/
cp ${DOTS_DIR}/.alacritty.yml ${HOME}/
cp ${DOTS_DIR}/.tmux.conf ${HOME}/

# Vim
mkdir -p ~/.vim/colors
cp ${DOTS_DIR}/vim/.vimrc ~/.vimrc
cp ${DOTS_DIR}/vim/gruvbox8_hard.vim ~/.vim/colors/

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

# Link files so that 
ln -sf ${DOTS_DIR}/.alacritty.yml ${HOME}/.alacritty.yml
ln -sf ${DOTS_DIR}/vim/.vimrc ${HOME}/.vimrc
mkdir -p ${HOME}/.config/nvim/
ln -sf ${DOTS_DIR}/nvim/init.vim ${HOME}/.config/nvim/init.vim
ln -sf ${DOTS_DIR}/.tmux.conf ${HOME}/.tmux.conf
