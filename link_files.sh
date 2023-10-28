#!/bin/zsh
DOTS_DIR=${HOME}/git/dots
# Alacritty
ln -sf ${DOTS_DIR}/.alacritty.yml ${HOME}/.alacritty.yml
mkdir -p ${HOME}/.config/kitty
ln -sf ${DOTS_DIR}/kitty/kitty.conf ${HOME}/.config/kitty/kitty.conf
# git
ln -sf ${DOTS_DIR}/git/.gitconfig ${HOME}/.gitconfig
ln -sf ${DOTS_DIR}/git/.gitignore_global ${HOME}/.gitignore_global
# vim stuff
ln -sf ${DOTS_DIR}/vim/.vimrc ${HOME}/.vimrc
mkdir -p ${HOME}/.config/nvim/
ln -sf ${DOTS_DIR}/nvim/init.vim ${HOME}/.config/nvim/init.vim
mkdir -p ${HOME}/.vim/colors
ln -sf ${DOTS_DIR}/vim/gruvbox8_hard.vim ${HOME}/.vim/colors/gruvbox8_hard.vim
# tmux
ln -sf ${DOTS_DIR}/.tmux.conf ${HOME}/.tmux.conf
# lazygit
mkdir -p ${HOME}/.config/lazygit
ln -sf ${DOTS_DIR}/lazygit/config.yml ${HOME}/.config/lazygit/config.yml
# custom functions
ln -sf ${DOTS_DIR}/.zfunc ${HOME}/.zfunc
ln -sf ${DOTS_DIR}/.zshrc ${HOME}/.zshrc
ln -sf ${DOTS_DIR}/nvim/ ${HOME}/.config/nvim/
