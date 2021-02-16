#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles
############################

if ! [[ $(lsb_release -i) =~ 'Ubuntu' ]]; then
    echo "This script probably only works on Ubuntu, exiting"
    exit
fi

mkdir -p ~/.config

sudo apt update
sudo apt upgrade
sudo apt install \
    build-essential \
    clang \
    clangd \
    cmake \
    dconf-editor \
    gnome-terminal \
    nodejs \
    npm \
    silversearcher-ag \
    stow \
    xclip \
    && echo Done installing programs || exit

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rls rust-analysis rust-src clippy rustfmt

if ! command -v stow &> /dev/null
then
    echo "stow could not be found"
    exit
fi

# Stow will exit with error if it is going to overwrite an existing file
# this will create a symlink in ~ to files in ./dotfiles
stow -v -t ~ dotfiles || exit

echo installing vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# echo "Installing TPM"
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# echo "Installing TPM Plugins"
# ~/.tmux/plugins/tpm/scripts/install_plugins.sh

echo "Installing plugins"
vim +PlugInstall +qall
vim +CocInstall +qall

echo "Installing powerline fonts"
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd ./fonts
./install.sh
# clean-up a bit
cd ..
rm -rf ./fonts

echo "In order to create a color scheme for gnome terminal you must first create your own custom profile first... it needs to create the settings db. Go to Edit, Preferences, and then click the plus sign next to profiles on the left bar."
read -s -n 1 -p "Press any key to continue . . ." && echo ""
echo "Installing OneDark colorsheme"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh)"

echo "Make sure you change the font to a powerline font from gnome-terminal settings and change the profile to OneDark"
