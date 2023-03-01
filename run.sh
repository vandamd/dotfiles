if type git > /dev/null; then
    git clone https://github.com/vandamd/dotfiles ~/
    chmod +x ~/dotfiles/*
    cd ~/dotfiles
    ./install.sh
else
    cd ~/
    curl -LO https://github.com/vandamd/dotfiles/archive/master.zip
    unzip master.zip
    rm -rf master.zip
    mv dotfiles-main ~/dotfiles
    chmod +x ~/dotfiles/*
    cd ~/dotfiles
    ./install.sh
fi