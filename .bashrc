set -ha
umask 022
stty istrip 2> /dev/null
setterm -blength 2> /dev/null
stty erase '^?' 2> /dev/null
shopt -s histappend
#shopt -s cdspell
shopt -s checkwinsize

export BASHRC=true

export HISTCONTROL=ignoredups
export HISTSIZE=16384
export HISTFILESIZE=1048576
export HISTIGNORE="exit:fg:bg"

export PS1='[\u@\h \w] '

export EDITOR=vim
export VISUAL=vim
if [ -e /usr/bin/gvim ]; then
    export VISUAL="gvim -f"
fi
export PAGER=less

export PATH=/bin:/sbin:/usr/bin:/usr/sbin:~/bin:~/chromium/tools/depot_tools:/usr/local/bin:/usr/software/bin:/usr/X11R6/bin:/opt/kde3/bin:/usr/software/utils/bin

export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib

# Colorized ls output (only works on Linux)
if [ -e "`which dircolors`" ]; then
    eval $(dircolors -b ~/.colors)
    alias ls="ls --color"
fi

# General aliases
alias l="ls -alh"
alias exti="exit"

unset GREP_OPTIONS

. ~/.bashrc-lenovo

