# This is Vandam Dinh's zsh configuration file

# Case insensitive completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Auto cd
setopt auto_cd

# Plugins
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
alias omni="sudo /Applications/OmniDiskSweeper.app/Contents/MacOS/OmniDiskSweeper"

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
