# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias python="python3"
alias v="nvim"
alias cat="bat"
alias ls="lsd"
alias ll="ls -l"
alias lg="lazygit"
alias cl="clear"
alias ei="exit"
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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# set terminal title to cwd
PROMPT_COMMAND='echo -ne "\033]0; \a"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="~/.nvm/versions/node/v16.15.0/bin/node:$PATH"
export PATH="~/.cargo/bin:$PATH"
export PATH="~/.local/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.cargo/bin/stylua:$PATH"
export PATH="$HOME/.local/kitty.app/bin:$PATH"

# export nvim
export PATH="$PATH:/opt/nvim-linux64/bin"

# export go binaries
export PATH="$HOME/go/bin/:$PATH"
export PATH=$PATH:/usr/local/go/bin

# kitty ssh fix
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# env variables
export OPENAI_API_KEY=$(pass show neoai)


eval "$(starship init bash)"
function gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}
. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/home/abanseka/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

#lsd
export LS_COLORS='di=34:ln=38;5;44:so=38;5;44:pi=38;5;44:bd=38;5;44:or=38;5;124:cd=38;5;172:ex=38;5;40:fi=38;5;184:no=38;5;245'
