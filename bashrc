# base-files version 3.2-1

# User dependent .bashrc file

# See man bash for more options...
# Don't wait for job termination notification
set -o notify

# Don't use ^D to exit
set -o ignoreeof

# Don't put duplicate lines in the history.
export HISTCONTROL=ignoredups:ignorespace

PS1='\n${VIRTUAL_ENV:+[[}${VIRTUAL_ENV}${VIRTUAL_ENV:+]]\n}\D{%s %H:%M:%S}\n\! \w\n\$ '

#PS1='\n\D{%s %H:%M:%S}\n\! \w\n\$ '
#PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
#PS1='\[\e]0;\w\a\]\n\u@\h \w\n\$ '
#PS1='\u@\h \w\n\$ '
#PS1='\n\D{%s %Y.%m.%d.%H.%M.%S}\n\! \w\n\$ '

source ~/.aliases

test -s ~/.bashrc_local && source ~/.bashrc_local
