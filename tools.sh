#!/bin/bash
if ! [[ $(lsb_release -i) =~ 'Ubuntu' || $(lsb_release -i) =~ 'Kali' ]]; then
    echo "This script probably only works on Ubuntu, exiting"
    exit
fi


sudo apt update
sudo apt upgrade
sudo apt install \
    build-essential \
    clang \
    clangd \
    cmake \
    virtualbox \
    virtualbox-ext-pack \
    && echo Done installing tools || exit

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rls rust-analysis rust-src clippy rustfmt

