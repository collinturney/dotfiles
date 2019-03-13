# .bashrc

# vi: ts=3 sw=3 expandtab nu

# ----------------------------------------------------------------------
#  SHELL OPTIONS
# ----------------------------------------------------------------------

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# system bashrc
if [ -r /etc/bashrc ]; then
   . /etc/bashrc
fi

# don't let me lock my terminal
if [ -t 0 ]; then
    stty -ixon -ixoff
fi

# don't log me out with ctrl-d
set -o ignoreeof

# immediate notification of bg job completion
set -o notify

# update display size when window resized
shopt -q -s checkwinsize

# append rather than overwrite history
shopt -s histappend

# allow multi-line commands in history
shopt -q -s cmdhist

# ahh, solitude
mesg n

# cores. always.
ulimit -c unlimited

# kill an entire line with ctrl-x
bind "\C-x:backward-kill-line"

# ----------------------------------------------------------------------
#  PATHS
# ----------------------------------------------------------------------

if [ -d "$HOME/bin" ]; then
   PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/lib" ]; then
   LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"
fi

export PATH LD_LIBRARY_PATH

# ----------------------------------------------------------------------
#  MISC ENVIRONMENT VARIABLES
# ----------------------------------------------------------------------

export TERM="xterm-256color"
export EDITOR="vim"
export PAGER="less"
unset MAILCHECK

# enable colors for less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;208m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;111m'

# ----------------------------------------------------------------------
#  COLORS
# ----------------------------------------------------------------------

# Reset
export Color_Off='\[\e[0m\]'   # Text Reset

# Regular Colors
export Black='\[\e[0;30m\]'    # Black
export Red='\[\e[0;31m\]'      # Red
export Green='\[\e[0;32m\]'    # Green
export Yellow='\[\e[0;33m\]'   # Yellow
export Blue='\[\e[0;34m\]'     # Blue
export Purple='\[\e[0;35m\]'   # Purple
export Cyan='\[\e[0;36m\]'     # Cyan
export White='\[\e[0;37m\]'    # White

# Bold
export BBlack='\[\e[1;30m\]'   # Black
export BRed='\[\e[1;31m\]'     # Red
export BGreen='\[\e[1;32m\]'   # Green
export BYellow='\[\e[1;33m\]'  # Yellow
export BBlue='\[\e[1;34m\]'    # Blue
export BPurple='\[\e[1;35m\]'  # Purple
export BCyan='\[\e[1;36m\]'    # Cyan
export BWhite='\[\e[1;37m\]'   # White

# Underline
export UBlack='\e[4;30m\]'     # Black
export URed='\e[4;31m\]'       # Red
export UGreen='\e[4;32m\]'     # Green
export UYellow='\e[4;33m\]'    # Yellow
export UBlue='\e[4;34m\]'      # Blue
export UPurple='\e[4;35m\]'    # Purple
export UCyan='\e[4;36m\]'      # Cyan
export UWhite='\e[4;37m\]'     # White

# Background
export On_Black='\[\e[40m\]'   # Black
export On_Red='\[\e[41m\]'     # Red
export On_Green='\[\e[42m\]'   # Green
export On_Yellow='\[\e[43m\]'  # Yellow
export On_Blue='\[\e[44m\]'    # Blue
export On_Purple='\[\e[45m\]'  # Purple
export On_Cyan='\[\e[46m\]'    # Cyan
export On_White='\[\e[47m\]'   # White

# High Intensity
export IBlack='\[\e[0;90m\]'   # Black
export IRed='\[\e[0;91m\]'     # Red
export IGreen='\[\e[0;92m\]'   # Green
export IYellow='\[\e[0;93m\]'  # Yellow
export IBlue='\[\e[0;94m\]'    # Blue
export IPurple='\[\e[0;95m\]'  # Purple
export ICyan='\[\e[0;96m\]'    # Cyan
export IWhite='\[\e[0;97m\]'   # White

# Bold High Intensity
export BIBlack='\[\e[1;90m\]'      # Black
export BIRed='\[\e[1;91m\]'        # Red
export BIGreen='\[\e[1;92m\]'      # Green
export BIYellow='\[\e[1;93m\]'     # Yellow
export BIBlue='\[\e[1;94m\]'       # Blue
export BIPurple='\[\e[1;95m\]'     # Purple
export BICyan='\[\e[1;96m\]'       # Cyan
export BIWhite='\[\e[1;97m\]'      # White

# High Intensity backgrounds
export On_IBlack='\[\e[0;100m\]'   # Black
export On_IRed='\[\e[0;101m\]'     # Red
export On_IGreen='\[\e[0;102m\]'   # Green
export On_IYellow='\[\e[0;103m\]'  # Yellow
export On_IBlue='\[\e[0;104m\]'    # Blue
export On_IPurple='\[\e[0;105m\]'  # Purple
export On_ICyan='\[\e[0;106m\]'    # Cyan
export On_IWhite='\[\e[0;107m\]'   # White

# ----------------------------------------------------------------------
#  PROMPT
# ----------------------------------------------------------------------

# Unicode Characters
# https://mkaz.github.io/2014/04/17/the-bash-prompt/
export unicode_Circle="\342\227\211"
export unicode_Arrow="\342\236\244"

export PROMPT_COMMAND=__prompt_command

function __prompt_command() {
    local EXIT="$?"

    PS1=""

    if [ $EXIT != 0 ]; then
        PS1+="${IRed}${unicode_Circle}${Color_Off}"
    else
        PS1+="${IGreen}${unicode_Circle}${Color_Off}"
    fi

    PS1+="${IBlue} \W ${Color_Off}"

    if [ $EXIT != 0 ]; then
        PS1+="${IRed}${unicode_Arrow}${Color_Off} "
    else
        PS1+="${IGreen}${unicode_Arrow}${Color_Off} "
    fi
}

# ----------------------------------------------------------------------
#  ALIASES
# ----------------------------------------------------------------------

alias sl="ls" # -_-
alias x='exit'
alias ls='ls -FG'
alias ll='ls -lFG'
alias lll='ls -l | less'
alias calc="python"
alias lsps="pgrep -u $USER -l"
alias status="svn status | grep -v '^\?'"
alias laststatus='echo $?'
alias serve="python -m SimpleHTTPServer"
alias top='top -s1 -o cpu -R -F'
alias clock="watch -n 1 date"
alias tcping="nc -w 3 -z -v $*"
alias portscan="nc -z -v $* 1-1024"
alias scp="rsync --progress -avz $*"

# ----------------------------------------------------------------------
#  FUNCTIONS
# ----------------------------------------------------------------------

### >:-)
#function ls(){ /bin/ls "$@" | rev; }

### whitespace strip
wsstrip() { sed 's/[ \t]\+/ /g; s/^ //;'; }

### fast find in current directory
ff() { find . -name "*$1*" 2>/dev/null; }

### local locate (updated via cron)
#locate() { command locate --database=$HOME/.locatedb $@; }

### svn diff and view
svndiff() { git diff $1 | view -; }
gitdiff() { git diff $1 | view -; }

### useful ways to ls
latest() { ls -lhF -t $* | head; }
newest() { ls -lhF -t $* | head; }
oldest() { ls -lhF -t -r $* | head; }
largest() { ls -lhF -S $* | head; }
biggest() { ls -lhF -S $* | head; }
smallest() { ls -lhF -S -r $* | head; }

# ----------------------------------------------------------------------
#  MISC UTILITIES
# ----------------------------------------------------------------------

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi
