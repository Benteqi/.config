#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\[\e[01;36m\][\u@\h \w]\$ \[\e[00m\]'
export EDITOR=nvim
export PATH=$PATH:/home/benteqi/.local/bin
set -o vi
clear
fastfetch
