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
alias build='bun run sync-version && bunx expo run:android'
alias sc="yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --embed-metadata --embed-thumbnail --convert-thumbnail jpg --output '~/Music/Tunes/%(title)s.%(ext)s'"
alias dj="yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --embed-metadata --embed-thumbnail --convert-thumbnail jpg --output '~/Music/DJ/%(title)s.%(ext)s'"
alias yt="yt-dlp --format mp4 --embed-metadata --embed-thumbnail --convert-thumbnail jpg --output '~/Videos/%(title)s.%(ext)s'"
alias confetti='open raycast://extensions/raycast/raycast/confetti'
alias cr='~/Developer/crossword/crossword'

ts() {
  local selected=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf \
    --preview-window=right,50%,border-left,noinfo \
    --preview "tmux list-windows -t {} -F '#{window_index}: #{window_name} (#{pane_current_command})' 2>/dev/null" \
    --header="Select session (or type new name)" \
    --print-query \
    --bind "enter:accept-or-print-query" | tail -1)
  [[ -n "$selected" ]] && tmux attach -t "$selected" 2>/dev/null || tmux new -s "$selected"
}

proj() {
  local base_dir="${1:-$HOME/Developer}"
  local open_editor="${2:-false}"
  local selected=$(ls -1 "$base_dir" | fzf \
    --preview-window=right,50%,border-left,noinfo \
    --preview "bash -c '
      dir=\"$base_dir/\$1\"

      # Git info
      if [ -d \"\$dir/.git\" ]; then
        branch=\$(git -C \"\$dir\" branch --show-current 2>/dev/null)
        echo \"Branch: \${branch:-detached}\"
        git -C \"\$dir\" log -1 --format=\"Latest Commit: %s, %ar\" 2>/dev/null
        mod=\$(git -C \"\$dir\" diff --numstat 2>/dev/null | wc -l | tr -d \" \")
        unt=\$(git -C \"\$dir\" ls-files --others --exclude-standard 2>/dev/null | wc -l | tr -d \" \")
        echo \"Modified: \$mod | Untracked: \$unt\"
        remote=\$(git -C \"\$dir\" remote get-url origin 2>/dev/null | sed \"s/git@github.com:/https:\/\/github.com\//\" | sed \"s/\.git\$//\")
        [ -n \"\$remote\" ] && echo \"Remote: \$remote\"
        tag=\$(git -C \"\$dir\" describe --tags --abbrev=0 2>/dev/null)
        [ -n \"\$tag\" ] && echo \"Latest Tag: \$tag\"
        size=\$(du -sh \"\$dir\" 2>/dev/null | cut -f1)
        echo \"Size: \$size\"
        echo \"\"
      fi

      # Tree view
      if command -v tree &>/dev/null; then
        tree -C -L 2 --dirsfirst --filelimit 15 \"\$dir\" 2>/dev/null | sed \"1s|\$HOME|~|\" | head -20
      else
        ls -1 \"\$dir\" | head -15
      fi

      # README with syntax highlighting
      readme=\"\$(find \"\$dir\" -maxdepth 1 -iname \"readme.md\" | head -1)\"
      if [ -n \"\$readme\" ] && [ -s \"\$readme\" ]; then
        echo \"\"
        if command -v bat &>/dev/null; then
          bat --color=always --style=plain \"\$readme\" 2>/dev/null
        else
          cat \"\$readme\"
        fi
      fi
    ' _ {}")
  [[ -n "$selected" ]] && cd "$base_dir/$selected" && [[ "$open_editor" == "true" ]] && nvim .
}

apk() {
  local name=$(node -p "require('./app.json').expo.name.toLowerCase()")
  local version=$(node -p "require('./app.json').expo.version")
  bun run sync-version && \
  eas build -p android --profile production --local --output ~/Downloads/${name}_v${version}.apk
}

stty -ixon
bindkey -s '^S' 'ts\n'

[ -s "/Users/vandam/.bun/_bun" ] && source "/Users/vandam/.bun/_bun"
export EDITOR=nvim
export BUN_INSTALL="$HOME/.bun"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_NDK_HOME="/opt/homebrew/share/android-ndk"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:/Users/vandam/.lmstudio/bin"
export PATH="/Applications/Blender.app/Contents/MacOS:$PATH"
export PATH="/usr/local/texlive/2026basic/bin/universal-darwin:$PATH"
