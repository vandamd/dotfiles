#!/bin/bash

install_brew() {
    if ! command -v "brew" &> /dev/null; then
        printf "Homebrew not found, installing.\n"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        printf "Post-homebrew install commands\n"
        (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> "$HOME/.zprofile"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    sudo softwareupdate --install-rosetta

    printf "Installing homebrew packages...\n"
    brew bundle
}

printf "Installing Xcode Command Line Tools\n"
xcode-select --install

printf "Installing Homebrew\n"
install_brew

printf "Setting macOS preferences\n"
./.macos

printf "Stow dotfiles\n"
stow -t ~/ --adopt --no-folding zsh nvim

printf "Installing Zim\n"
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

git restore .
