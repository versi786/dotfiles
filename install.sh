#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfilesj
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".vimrc .tmux.conf"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    mv ~/$file ~/dotfiles_old/
done
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done


echo "Installing TPM"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Installing TPM Plugins"
~/.tmux/plugins/tpm/scripts/install_plugins.sh

echo "Installing xclip"
sudo apt install xclip

echo "Installing ag"
sudo apt install silversearcher-ag

echo "installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

cat fzf.bashrc >> ~/.bashrc
