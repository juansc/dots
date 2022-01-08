# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# 

# brew install git
mkdir -p ~/git
git clone https://github.com/juansc/dots/ ~/git/dots
cp ~/git/dots/.gitconfig $HOME/
cp ~/git/dots/.gitignore_global $HOME/
cp ~/git/dots/.zshrc $HOME/
cp ~/git/dots/.alacritty.yml $HOME/
cp ~/git/dots/.tmux.conf $HOME/

# Vim
mkdir -p ~/.vim/colors
cp ~/git/dots/vim/.vimrc ~/.vimrc
cp ~/git/dots/vim/gruvbox8_hard.vim ~/.vim/colors/

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


## ZSH Section ##
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k
git clone https://github.com/bobthecow/git-flow-completion ~/.oh-my-zsh/custom/plugins/git-flow-completion

# Install fonts
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Install Jetbrains IDE
brew install --cask goland
