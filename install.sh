#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles
############################

if ! command -v stow &> /dev/null
then
    echo "stow could not be found"
    exit
fi

# Stow will exit with error if it is going to overwrite an existing file
stow -v -t ~ dotfiles || exit

echo installing vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# echo "Installing TPM"
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# echo "Installing TPM Plugins"
# ~/.tmux/plugins/tpm/scripts/install_plugins.sh

echo "Installing xclip"
sudo apt install xclip

echo "Installing ag"
sudo apt install silversearcher-ag

echo "installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

echo "Installing plugins"
vim +PlugInstall +CocInstall +qall

echo "Installing powerline fonts"
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd ./fonts
./install.sh
# clean-up a bit
cd ..
rm -rf ./fonts

echo "Make sure you change the font to a powerline font from gnome-terminal settings and change the profile to OneDark"
