!#/bin/bash

install_brew() {
    if ! command -v "brew" &> /dev/null; then
        printf "Homebrew not found, installing."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    
    printf "Post-homebrew install commands\n"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/vandam/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

    sudo softwareupdate --install-rosetta

    printf "Installing homebrew packages..."
    brew bundle
}

create_dirs() {
    declare -a dirs=(
        "~/src/"
    )

    for i in "${dirs[@]}"; do
        ln -s "$i" "$HOME"
    done
}


printf "Creating src directory\n"
create_dirs

printf "Installing Xcode Command Line Tools\n"
xcode-select --install

printf "Installing Homebrew\n"
install_brew

printf "Setting macOS preferences\n"
./.macos

printf "🐗  Stow dotfiles\n"
stow -t ~/ --adopt zsh nvim

printf "Installing Zim"
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

git restore .

