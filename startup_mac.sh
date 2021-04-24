# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# 
# brew install git

mkdir -p ~/git
git clone https://github.com/juansc/dots/ ~/git/dots
cp ~/git/dots/.gitconfig $HOME/
cp ~/git/dots/.gitignore_global $HOME/
cp ~/git/dots/.zshrc $HOME/

# Vim
mkdir -p ~/.vim/colors
curl -s https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim > ~/.vim/colors/monokai.vim
cp ~/git/dots/.vimrc ~/.vimrc

brew install iterm2
brew install sizeup
brew install diff-so-fancy
brew install ripgrep
brew install tree
brew install jq
brew install go@1.13


## ZSH Section ##
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/bobthecow/git-flow-completion ~/.oh-my-zsh/custom/plugins/git-flow-completion

mkdir -p ~/git/go/src/github.com/embrace-io/
ln -s ~/git/embrace/go ~/git/go/src/github.com/embrace-io/
