if type git > /dev/null; then
    git clone https://github.com/vandamd/dotfiles ~/Downloads/dotfiles
    chmod +x ~/Downloads/dotfiles
    cd ~/Downloads/dotfiles
    ./install.sh
else
    cd ~/Downloads
    curl -LO https://github.com/vandamd/dotfiles/archive/master.zip
    unzip master.zip
    rm -rf master.zip
    mv dotfiles-main ~/Downloads/dotfiles
    chmod +x ~/Downloads/dotfiles
    cd ~/Downloads/dotfiles
    ./install.sh
fi