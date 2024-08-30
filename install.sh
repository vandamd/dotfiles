!#/bin/bash

install_brew() {
    if ! command -v "brew" &> /dev/null; then
        printf "Homebrew not found, installing."
        # install homebrew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        # set path
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

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
stow .