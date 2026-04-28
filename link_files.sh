#!/bin/zsh
DOTS_DIR=${HOME}/git/dots
# Alacritty
ln -sf ${DOTS_DIR}/.alacritty.yml ${HOME}/.alacritty.yml
mkdir -p ${HOME}/.config/kitty
ln -sf ${DOTS_DIR}/kitty/kitty.conf ${HOME}/.config/kitty/kitty.conf
# git
ln -sf ${DOTS_DIR}/git/.gitconfig ${HOME}/.gitconfig
ln -sf ${DOTS_DIR}/git/.gitignore_global ${HOME}/.gitignore_global

# tmux
ln -sf ${DOTS_DIR}/.tmux.conf ${HOME}/.tmux.conf
# lazygit
mkdir -p ${HOME}/.config/lazygit
ln -sf ${DOTS_DIR}/lazygit/config.yml ${HOME}/.config/lazygit/config.yml
# custom functions
ln -sf ${DOTS_DIR}/.zfunc ${HOME}/.zfunc
ln -sf ${DOTS_DIR}/.zshrc ${HOME}/.zshrc

ln -sf ${DOTS_DIR}/wezterm/.wezterm.lua ${HOME}/.wezterm.lua
ln -sf ${DOTS_DIR}/helix/config.toml ${HOME}/.config/helix/config.toml
ln -sf ${DOTS_DIR}/helix/languages.toml ${HOME}/.config/helix/languages.toml

# Fish config stuff
ln -sf ${DOTS_DIR}/fish/config.fish ~/.config/fish/config.fish
mkdir -p ~/.config/fish/functions
ln -sf  ${DOTS_DIR}/fish/functions/* ~/.config/fish/functions/
ln -sf ${DOTS_DIR}/fish/custom_func.fish ~/.config/fish/functions/custom_func.fish
