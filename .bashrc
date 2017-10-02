# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Set default gpg key
export GPGKEY=316D9DE4

# locale settings set to utf8
LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

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


# Tilix workaround
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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

# colorscheme
FG_BLACK="$(tput setaf 0)"
FG_RED="\[$(tput setaf 1)\]"
FG_GREEN="$(tput setaf 2)"
FG_YELLOW="$(tput setaf 3)"
FG_BLUE="$(tput setaf 4)"
FG_MAGENTA="$(tput setaf 5)"
FG_CYAN="$(tput setaf 6)"
FG_WHITE="$(tput setaf 7)"
FG_GREY="$(tput setaf 8)"
FG_LIME_YELLOW=$(tput setaf 190)
FG_POWDER_BLUE=$(tput setaf 45)

BG_BLACK="$(tput setab 0)"
BG_RED="\[$(tput setab 1)\]"
BG_GREEN="$(tput setab 2)"
BG_YELLOW="$(tput setab 3)"
BG_BLUE="$(tput setab 4)"
BG_MAGENTA="$(tput setab 5)"
BG_CYAN="$(tput setab 6)"
BG_WHITE="$(tput setab 7)"
BG_GREY="$(tput setab 8)"
BG_LIME_YELLOW=$(tput setab 190)
BG_POWDER_BLUE=$(tput setab 45)


DIM="\[$(tput dim)\]"
REVERSE="$(tput rev)"
RESET="$(tput sgr0)"
BOLD="\[$(tput bold)\]"

# Unicode symbols
#GIT_PROMPT_SYMBOL_BRANCH='⭠ '
#GIT_PROMPT_SYMBOL_ADD="Ⓐ "
#GIT_PROMPT_SYMBOL_DELETE="Ⓓ "
#GIT_PROMPT_SYMBOL_MODIFY="Ⓜ "
#GIT_PROMPT_SYMBOL_RENAME="Ⓡ "
#GIT_PROMPT_SYMBOL_COMMIT="Ⓒ "
#GIT_PROMPT_SYMBOL_PUSH="⬆"
#GIT_PROMPT_SYMBOL_PULL="⬇"

#SYSTEM_PROMPT_SYMBOL_SEPARATOR='⮀'
#SYSTEM_PROMPT_SYMBOL_TRUE='✔'
#SYSTEM_PROMPT_SYMBOL_FALSE='✘'
#SYSTEM_PROMPT_SYMBOL_JOBS='⚙'
#SYSTEM_PROMPT_SYMBOL_ROOT='⚡'
#SYSTEM_PROMPT_SYMBOL_AT='@'
#SYSTEM_PROMPT_SYMBOL_USER='➜'

#if [ "$color_prompt" = yes ]; then
    PS1='$ '
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:$ '
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
    #PS1='> '
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    #PS1='$BG_WHITE$FG_GREY${debian_chroot:+($debian_chroot)}\u@\h$FG_GREY $BG_GREY$FG_WHITE$RESET$FG_GREY$RESET ' 
    #PS1='$BG_WHITE$FG_GREY ${debian_chroot:+($debian_chroot)}\u $FG_GREY$BG_GREY$FG_WHITE \$ $RESET$FG_GREY$RESET ' 
#fi
unset color_prompt force_color_prompt

## If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# use powerline-shell 

function _update_ps1() {
    PS1="$(/home/vikram/workspaces/powerline-shell/powerline-shell.py $? 3> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi


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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
#alias reddit='rtv'
#alias mail='alpine'
#alias gtalk='hangups'
#alias calendar='gcalcli agenda'
#alias agenda='gcalcli agenda'
#alias starwars='telnet towel.blinkenlights.nl'
#alias games="echo 'moon-buggy, netthack'"
#alias bored="games"
alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc"
alias start-tmux="~/Scripts/tmux/start-tmux"
alias music="mocp"

# get wikipedia info on the command line
#function wiki() { ~/Scripts/wikipedia.sh $1; }

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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
#source /opt/ros/indigo/setup.bash

# function to set custom terminal title
set_term_title(){
    echo -en "\033]0;$1\a"
}


export opencv_DIR=~/OpenCV/opencv-3.0.0
source ~/catkin_ws/devel/setup.bash

# custom beep sound
export CHIME=/usr/share/sounds/gnome/default/alerts/glass.ogg
alias beep='paplay $CHIME'

export PYTHONPATH="/usr/bin/:$PYTHONPATH"
export PYTHONPATH="/home/vikram/workspaces/LeapDeveloperKit_2.3.1+31549_linux/LeapSDK/lib/x64:$PYTHONPATH"

# trash sound better than trash-put,so...
alias trash='trash-put'

# this is needed to let scripts running in cron access the desktop
# scripts can call Xdbus to set DBUS_SESSION_BUS_ADDRESS variable
# in order to call notify-send
#touch $HOME/.dbus/Xdbus
#chmod 600 $HOME/.dbus/Xdbus
#env | grep DBUS_SESSION_BUS_ADDRESS > $HOME/.dbus/Xdbus
#echo 'export DBUS_SESSION_BUS_ADDRESS' >> $HOME/.dbus/Xdbus

export PATH="/home/vikram/.local/bin":$PATH
export PATH="/usr/local/bin":$PATH

export XDG_CONFIG_HOME="~/"

#use powerline
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#source /home/vikram/workspaces/powerline/powerline/bindings/bash/powerline.sh

#fortune | cowsay

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/media/vikram/351668af-7a4c-4891-88c0-a03aece95ce7/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/media/vikram/351668af-7a4c-4891-88c0-a03aece95ce7/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/media/vikram/351668af-7a4c-4891-88c0-a03aece95ce7/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/media/vikram/351668af-7a4c-4891-88c0-a03aece95ce7/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# added by Anaconda2 4.4.0 installer
export PATH="/home/vikram/workspaces/anaconda2/bin:$PATH"

# maven bin path
export PATH="/home/vikram/workspaces/apache-maven-3.5.0/bin:$PATH"

# reverb bin path
export PATH="/home/vikram/workspaces/reverb/core:$PATH"

# ranger related
export RANGER_LOAD_DEFAULT_RC=FALSE


