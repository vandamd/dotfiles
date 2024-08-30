if type git > /dev/null; then
    mkdir ~/src
    git clone https://github.com/vandamd/dotfiles ~/src/dotfiles
    chmod +x ~/src/dotfiles/*
    cd ~/src/dotfiles
    ./install.sh
else
    mkdir ~/src
    cd ~/src
    curl -LO https://github.com/vandamd/dotfiles/archive/master.zip
    unzip master.zip
    rm -rf master.zip
    mv dotfiles-main ~/src/dotfiles
    chmod +x ~/src/dotfiles/*
    cd ~/src/dotfiles
    ./install.sh
fi
