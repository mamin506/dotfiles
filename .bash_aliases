# User:	Min Ma <mamin506@gmail.com>
# Last Change:	$Date: 2015/06/02 13:10:34 $

# ~/.bash_aliases file from user
# User specific aliases and functions

# prompt before every removal
alias rm='rm -i'

# Disk free in human terms
alias df='df -h'

# Clear the terminal
alias cls='clear'

# List paths
alias path='echo -e ${PATH//:/\\n}'

# please use v2.16 above 'which'
alias which='alias | /usr/local/bin/which --tty-only --read-alias --show-dot --show-tilde'

# vim: set ft=sh: ":help modeline"
