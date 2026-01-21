ZIM_HOME=~/.zim
source ${ZIM_HOME}/init.zsh
[[ -f ~/.secrets ]] && source ~/.secrets

alias d="cd ~/Developer"
alias dev='proj ~/Developer true'
alias c='proj ~/Developer'
alias y="cd ~/Year\ 5"
alias o="open ."
alias uni='proj ~/Year\ 5'
alias v="nvim"
alias vim="nvim"
alias q="nvim ~/quicknote.md"
alias zshconfig="nvim ~/.zshrc"
alias vimconfig="cd ~/.config/nvim/ && nvim ."
alias gconfig="nvim /Users/vandam/Library/Application\ Support/com.mitchellh.ghostty/config"
alias gst='git status'
alias gaa='git add .'
alias cl='function _cl() { git clone "$1" ~/Developer/$(basename "$1" .git); }; _cl'
alias cc="claude --dangerously-skip-permissions"
alias bi='brew install --cask'
alias act='source .venv/bin/activate'
alias build='bun run sync-android-version && bunx expo run:android'
alias sc="yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --embed-metadata --embed-thumbnail --convert-thumbnail jpg --output '~/Music/Tunes/%(title)s.%(ext)s'"
alias dj="yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --embed-metadata --embed-thumbnail --convert-thumbnail jpg --output '~/Music/DJ/%(title)s.%(ext)s'"
alias yt="yt-dlp --format mp4 --embed-metadata --embed-thumbnail --convert-thumbnail jpg --output '~/Videos/%(title)s.%(ext)s'"
alias confetti='open raycast://extensions/raycast/raycast/confetti'

proj() {
  local base_dir="${1:-$HOME/Developer}"
  local open_editor="${2:-false}"
  local selected=$(find "$base_dir"/* -maxdepth 0 -type d 2>/dev/null | while read dir; do
    local name="${dir##*/}"
    if [ -d "$dir/.git" ]; then
      branch=$(git -C "$dir" rev-parse --abbrev-ref HEAD 2>/dev/null)
      echo "$name [$branch]"
    else
      echo "$name"
    fi
  done | fzf | sed "s| \[[^]]*\]$||")
  [[ -n "$selected" ]] && cd "$base_dir/$selected" && [[ "$open_editor" == "true" ]] && nvim .
}

apk() {
  local name=$(node -p "require('./app.json').expo.name.toLowerCase()")
  local version=$(node -p "require('./app.json').expo.version")
  bun run sync-android-version && \
  eas build -p android --profile production --local --output ~/Downloads/${name}_v${version}.apk
}

[ -s "/Users/vandam/.bun/_bun" ] && source "/Users/vandam/.bun/_bun"
export EDITOR=nvim
export BUN_INSTALL="$HOME/.bun"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_NDK_HOME="/opt/homebrew/share/android-ndk"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

