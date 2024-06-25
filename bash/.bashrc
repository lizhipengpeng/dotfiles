#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l'
alias c='clear'
alias h='htop'
alias n='neofetch'
alias r='ranger'
alias s='startx'
alias sus='systemctl suspend'
alias wetr='curl http://wttr.in/dalian'
export EDITOR='vim'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/killer/anaconda3/envs/py39/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/killer/anaconda3/envs/py39/etc/profile.d/conda.sh" ]; then
        . "/home/killer/anaconda3/envs/py39/etc/profile.d/conda.sh"
    else
        export PATH="/home/killer/anaconda3/envs/py39/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
source /usr/share/bash-completion/completions/*

alias setproxy="export https_proxy=http://127.0.0.1:7890;export http_proxy=http://127.0.0.1:7890;export all_proxy=socks5://127.0.0.1:1080"
alias unsetproxy="unset ALL_PROXY"

alias rm="~/trash.sh"
