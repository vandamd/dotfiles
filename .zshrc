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
alias vi="nvim"
alias vim="nvim"
alias ts="echo $'ala - Applied Linear Algebra\nitd - Intro to Data Science\nppp - Principles of Professional Practice\nemat - Engineering Mathematics\nmdm2 - Mathematical and Data Modelling'"
alias tasks="task list"

# Wiki
alias wiki="nvim vimwiki/index.md"
alias q="nvim vimwiki/Scratchpad.md"

# Starship
eval "$(starship init zsh)"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
