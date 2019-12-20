xcode-select —-install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install iterm2

brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir ~/z
curl -s https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/z/z.sh

brew install diff-so-fancy

mkdir -p ~/.vim/colors
curl -s https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim > ~/.vim/colors/monokai.vim
