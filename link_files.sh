#!/bin/zsh
DOTS_DIR=${HOME}/git/dots
# Alacritty
ln -sf ${DOTS_DIR}/.alacritty.yml ${HOME}/.alacritty.yml
ln -sf ${DOTS_DIR}/kitty/kitty.conf ${HOME}/.config/kitty/kitty.conf
# git
ln -sf ${DOTS_DIR}/.gitconfig ${HOME}/.gitconfig
ln -sf ${DOTS_DIR}/.gitignore_global ${HOME}/.gitignore_global
# vim stuff
ln -sf ${DOTS_DIR}/vim/.vimrc ${HOME}/.vimrc
mkdir -p ${HOME}/.config/nvim/
ln -sf ${DOTS_DIR}/nvim/init.vim ${HOME}/.config/nvim/init.vim
mkdir -p ${HOME}/.vim/colors
ln -sf ${DOTS_DIR}/vim/gruvbox8_hard.vim ${HOME}/.vim/colors/gruvbox8_hard.vim
# tmux
ln -sf ${DOTS_DIR}/.tmux.conf ${HOME}/.tmux.conf
# custom functions
ln -sf ${DOTS_DIR}/.zfunc ${HOME}/.zfunc
