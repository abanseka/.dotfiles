# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# # set PATH so it includes user's private bin if it exists
# if [ -d "$HOME/bin" ] ; then
#     PATH="$HOME/bin:$PATH"
# fi

# # set PATH so it includes user's private bin if it exists
# if [ -d "$HOME/.local/bin" ] ; then
#     PATH="$HOME/.local/bin:$PATH"
# fi
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
#
# go system wide path
export PATH=$PATH:/usr/local/go/bin
. "$HOME/.cargo/env"

export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

. "$HOME/.local/bin/env"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
