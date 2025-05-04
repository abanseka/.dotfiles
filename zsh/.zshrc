# Set the dir we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then 
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load Zinit
source "${ZINIT_HOME}/zinit.zsh"


# # always load up in a tmux env
# if command -v tmux &>/dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#     exec tmux new -A -s HOME
# fi

# execute widget
# python -m twidgets --logo pacman --show logo

# Config
# keybinds
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey -M viins '^f' autosuggest-accept

function zle-keymap-select {
  zle reset-prompt
}

zle -N zle-keymap-select

# aliases
alias python="python3"
alias v="nvim"
alias cat="bat"
alias ls="lsd -1"
alias la="lsd -a"
alias lg="lazygit"
alias ld="lazydocker"
alias cl="clear"
alias ei="exit"
alias a="sgpt"
alias pp="slides"
# tmux
alias tm="tmux new -s"
alias tml="tmux ls"
alias tma="tmux a -t"
alias tmd="tmux new -ds"
alias tmk="tmux kill-session -t"
# git
alias gpl="git pull"
alias gps="git push"
alias glo="git log"
alias gnb="git branch"
alias gls="git branch"
alias gco="git checkout"
alias gad="git add"
alias gcm="git commit -m"
alias gsh="git stash"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[default]='none'

# Load completions
autoload -U compinit && compinit

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# More comprehensive completion styling without underlines
zstyle ':completion:*' format ''

# kitty ssh fix
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# paths
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export PATH="$HOME/.nvm/versions/node/v16.15.0/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.cargo/bin/stylua:$PATH"
export PATH="$HOME/.local/kitty.app/bin:$PATH"

# export nvim
export PATH="$PATH:/opt/nvim-linux64/bin"

# export go binaries
export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"

# env variables
export OPENAI_API_KEY=$(pass show openai)
export LS_COLORS='di=1;34:ln=1;36:so=1;35:pi=1;33:bd=1;33:cd=1;31:or=1;41:ex=1;32:fi=0:*.sh=1;92:*.yml=1;38;5;208:*.yaml=1;38;5;208:*.toml=1;38;5;214:*.json=1;38;5;39:*.md=1;38;5;69:*.Dockerfile=1;38;5;75:*.dockerignore=1;38;5;75:*.log=1;38;5;160:*.lock=1;38;5;88:*.ts=1;38;5;39:*.tsx=1;38;5;33:*.js=1;38;5;214:*.jsx=1;38;5;202:*.css=1;38;5;45:*.scss=1;38;5;198:*.html=1;38;5;226:*.go=1;38;5;81:*.rs=1;38;5;208:*.py=1;38;5;51:*.c=1;38;5;27:*.cpp=1;38;5;99:*.h=1;38;5;99:*.java=1;38;5;166:*.kt=1;38;5;172:*.php=1;38;5;129:*.rb=1;38;5;197:*.pl=1;38;5;166:*.sql=1;38;5;99:*.csv=1;38;5;214:*.txt=1;38;5;253:no=38;5;245'

# android studio
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

# shell integrations
eval "$(fzf --zsh)"
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

. "$HOME/.local/bin/env"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Shell-GPT integration ZSH v0.2
_sgpt_zsh() {
if [[ -n "$BUFFER" ]]; then
    _sgpt_prev_cmd=$BUFFER
    BUFFER+="⌛"
    zle -I && zle redisplay
    BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd" --no-interaction)
    zle end-of-line
fi
}
zle -N _sgpt_zsh
bindkey ^l _sgpt_zsh
# Shell-GPT integration ZSH v0.2
