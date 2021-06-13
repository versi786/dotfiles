#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles
############################

if ! [[ $(lsb_release -i) =~ 'Ubuntu' || $(lsb_release -i) =~ 'Kali' ]]; then
    echo "This script probably only works on Ubuntu, exiting"
    exit
fi

mkdir -p ~/.config

udo apt update
sudo apt upgrade
sudo apt install \
    curl \
    dconf-cli \
    dconf-editor \
    gnome-terminal \
    neovim \
    nodejs \
    npm \
    python3-distutils \
    ripgrep \
    silversearcher-ag \
    stow \
    tmux \
    uuid-runtime `# Needed by gnome-termina settings` \
    vim \
    xclip \
    && echo Done installing programs || exit


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
vim +PlugInstall +CocInstall +qall
nvim +PlugInstall +CocInstall +qall

echo install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Installing powerline fonts"
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd ./fonts
./install.sh
# clean-up a bit
cd ..
rm -rf ./fonts
echo
echo -e "Create a custom profile in gnome-terminal, so that we can create a onedark one. It can be empty but one needs to be manually created from UI first"
echo "Edit > Preferences > Profile > + "
gnome-terminal
read -p "Press enter to continue"

echo "Installing OneDark colorsheme"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh)"
# mkdir -p "./src"
# cd "./src"
# git clone https://github.com/Mayccoll/Gogh.git gogh
# cd gogh/themes

# # necessary on ubuntu
# export TERMINAL=gnome-terminal

# # install themes
# ./one-dark.sh

# # cleanup
# cd ../../../
# rm -rf ./src

echo "Set default terminal app to gnome-terimnal"
echo "Utilities > Terminal Emulator"
read -p "Press enter to continue"

if [[ $(lsb_release -i) =~ 'Ubuntu' || $(lsb_release -i) =~ 'Kali' ]]; then
    if [[ $(which exo-preferred-applications) ]]; then
        exo-preferred-applications
    else
        sudo apt install xfce4-settings
        xfce4-mime-settings
    fi

    read -p "Press enter to continue"
fi

echo

echo "change shell with: chsh -s $(which bash)"
echo "Make sure you change the font to a powerline font from gnome-terminal settings and change the profile to OneDark, Deja Vu Sans Mono Book for Powerline, size 11"

