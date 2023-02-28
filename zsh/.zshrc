# This is Vandam Dinh's zsh configuration file

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme 
ZSH_THEME="gentoo"

# Case insensitive completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# Aliases
alias zshconfig="nvim ~/.zshrc"
alias docs="cd /Users/vandam/Library/Mobile\ Documents/com~apple~CloudDocs/Documents"
alias vimconfig="nvim ~/.vimrc"
alias nvimconfig="nvim ~/.config/nvim/init.vim"
alias nvimps="nvim ~/.config/nvim/plugins.vim"
alias nvimpc="nvim ~/.config/nvim/plugins_config.vim"
alias y2="cd ~/Documents/Work/University\ of\ Bristol/Year\ 2"
alias y1="cd ~/Documents/Work/University\ of\ Bristol/Year\ 1"
alias d="cd && cd Developer"
alias re="cd && cd Developer/Repositories"
alias v="nvim"
alias vim="nvim"

# Wiki
alias wiki="cd && nvim vimwiki/index.md"
alias q="cd && nvim vimwiki/Scratchpad.md"

# Starship
eval "$(starship init zsh)"

# FUCK
eval $(thefuck --alias)

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
