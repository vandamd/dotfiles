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
        "~/Library/Mobile\ Documents/com~apple~CloudDocs/Developer"
        "~/Library/Mobile\ Documents/com~apple~CloudDocs/vimwiki"
        "~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/Work/University\ of\ Bristol/Year\ 2/"
    )

    for i in "${dirs[@]}"; do
        ln -s "$i" "$HOME"
    done
}


printf "🗄  Creating iCloud Symlinks\n"
create_dirs

printf "🧑🏻‍💻 Installing Xcode Command Line Tools\n"
xcode-select --install

printf "🍺 Installing Homebrew\n"
install_brew

printf "💻  Setting macOS preferences\n"
./macos/.macos

printf "🐍  Configuring Python\n"
pyenv install 3.10.4
pyenv global 3.10.4

printf "👽  Installing vim-plug\n"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf "🐗  Stow dotfiles\n"
stow karabiner nvim zsh 