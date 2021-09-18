#!/bin/bash

sudo apt update
sudo apt install \
    dconf-cli \
    dconf-editor \
    uuid-runtime `# Needed by gnome-terminal settings` \
    && echo Done installing tools || exit 1

echo -e "Create a custom profile in gnome-terminal, so that we can create a onedark one. It can be empty but one needs to be manually created from UI first"
echo "Edit > Preferences > Profile > + "
gnome-terminal
read -p "Press enter to continue"

echo "Installing OneDark colorsheme"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh)"

export TERMINAL=gnome-terminal
echo "Install gruvbox dark"
bash -c "$(wget -qO- https://git.io/vQgMr)"

echo "Change gruvbox background color to 'hard' by changing hard contrast background - '#1d2021'"

echo "Set default terminal app to gnome-terimnal"
echo "Utilities > Terminal Emulator"
read -p "Press enter to continue"

if [[ $(lsb_release -i) =~ 'Ubuntu' || $(lsb_release -i) =~ 'Kali' ]]; then
    if [[ $(which exo-preferred-applications) ]]; then
        exo-preferred-applications
    else
        xfce4-mime-settings
    fi

    read -p "Press enter to continue"
fi

echo

echo "change shell with: chsh -s $(which bash)"
echo "Make sure you change the font to a powerline font from gnome-terminal settings and change the profile to OneDark, Deja Vu Sans Mono Book for Powerline, size 10"

