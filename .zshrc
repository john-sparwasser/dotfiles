# Path variable
export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/john/.oh-my-zsh

# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# Set name of the theme to load.
ZSH_THEME="agnoster"

#Plugins
plugins=(git)

#Aliases
alias ll="ls -la"
alias ..="cd .."
alias vi="vim"
alias count="ls -l | wc -l"
alias sbp="source ~/.zshrc"
alias ebp="vim ~/.zshrc"
alias psg="ps -ef | grep "

alias desktop="cd ~/Desktop"
alias projects="cd ~/projects"

alias ssh_config="cat ~/.ssh/config"
alias artisan="php artisan"
