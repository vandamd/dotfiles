#
#                         _                 _               _                        __ _       
#                        | |               ( )             | |                      / _(_)      
#   __   ____ _ _ __   __| | __ _ _ __ ___ |/ ___   _______| |__     ___ ___  _ __ | |_ _  __ _ 
#   \ \ / / _` | '_ \ / _` |/ _` | '_ ` _ \  / __| |_  / __| '_ \   / __/ _ \| '_ \|  _| |/ _` |
#    \ V / (_| | | | | (_| | (_| | | | | | | \__ \  / /\__ \ | | | | (_| (_) | | | | | | | (_| |
#     \_/ \__,_|_| |_|\__,_|\__,_|_| |_| |_| |___/ /___|___/_| |_|  \___\___/|_| |_|_| |_|\__, |
#                                                                                          __/ |
#                                                                                         |___/ 

# This is Vandam Dinh's zsh configuration file

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme 
ZSH_THEME="gentoo"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias i3config="vim ~/.config/i3/config"
alias docs="cd /home/vandam/Documents"
alias update="sudo pacman -Syu"
alias vimconfig="vim ~/.vimrc"
alias alacrittyconf="vim ~/.config/alacritty/alacritty.yml"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/vandam/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/vandam/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/vandam/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/vandam/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
