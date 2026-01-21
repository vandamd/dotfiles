#!/bin/bash

mkdir -p ~/Developer

if type git > /dev/null; then
    git clone https://github.com/vandamd/dotfiles ~/Developer/dotfiles
else
    cd ~/Developer
    curl -LO https://github.com/vandamd/dotfiles/archive/main.zip
    unzip main.zip
    rm -rf main.zip
    mv dotfiles-main dotfiles
fi

chmod +x ~/Developer/dotfiles/*
cd ~/Developer/dotfiles
./install.sh
