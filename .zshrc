# Vandam's zsh config file

# Case insensitive completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Auto cd
setopt auto_cd

# Plugins
plugins=(git)

# Aliases
alias zshconfig="nvim ~/.zshrc"
alias vimconfig="cd ~/.config/nvim/ && vim ."
alias d="cd && cd Developer"
alias re="cd && cd Developer/Repositories"
alias v="nvim"
alias vim="nvim"
alias p="ping vandamdinh.com"

eval "$(starship init zsh)"
