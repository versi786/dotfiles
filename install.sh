#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles
############################

if ! [[ $(lsb_release -i) =~ 'Ubuntu' || $(lsb_release -i) =~ 'Kali' ]]; then
    echo "This script probably only works on Ubuntu, exiting"
    exit
fi

cd "$(dirname "$0")"

mkdir -p ~/.config
mkdir -p ~/.bin

sudo apt update
sudo apt upgrade
sudo apt install \
    curl \
    dconf-cli \
    gnome-terminal \
    exuberant-ctags \
    neovim \
    nodejs \
    npm \
    python3-distutils \
    python3-pip \
    ripgrep \
    silversearcher-ag \
    stow \
    tmux \
    uuid-runtime `# Needed by gnome-terminal settings` \
    vim \
    xclip \
    zsh \
    && echo Done installing programs || exit 1


if ! command -v stow &> /dev/null
then
    echo "stow could not be found"
    exit
fi

# Stow will exit with error if it is going to overwrite an existing file
# this will create a symlink in ~ to files in ./dotfiles
./stow_files.sh || exit

if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
    echo installing vim-plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# echo "Installing TPM"
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# echo "Installing TPM Plugins"
# ~/.tmux/plugins/tpm/scripts/install_plugins.sh

echo "Installing plugins"
vim +PlugInstall +CocInsall +qall
nvim +PlugInstall +CocInstall +qall

if [[ ! -d ~/.fzf ]]; then
    echo install fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

if  ! fc-list | grep 'Nerd Font' -q; then
    echo "Installing nerd fonts"
    # clone
    git clone git@github.com:ryanoasis/nerd-fonts.git --depth=1
    cd ./nerd-fonts
    ./install.sh DejaVuSansMono
    cd ../
    rm -rf ./nerd-fonts
fi

echo "If you want to set up terminal run ./term.sh"
