# base-files version 3.2-1

# User dependent .bashrc file

# See man bash for more options...
# Don't wait for job termination notification
set -o notify

# Don't use ^D to exit
set -o ignoreeof

# Don't put duplicate lines in the history.
export HISTCONTROL=ignoredups:ignorespace

alias ..='cd ..' # Go up one directory
alias ...='cd ../..' # Go up two directories
alias ....='cd ../../..' # And for good measure

alias rm='rm -i'
alias ls='ls -F'
alias ll='ls -l'
alias la='ls -A'

alias ,nocr='tr -d \\015'
alias ,nobs='sed -e "s,.,,g"'

#from Nathan:
#alias activate=". ~/code/env/bin/activate"
alias ,proxy="export http_proxy=localhost:8080;export https_proxy=localhost:8080"
alias ,proxy-no="unset http_proxy;unset https_proxy"
alias ,initp="touch __init__.py"
#alias token_production="python ~/code/cloudscripts/get_token_production.py"
#alias token_staging="python ~/code/cloudscripts/get_token_staging.py"
alias ,pycnuke='find . -iname \*.pyc -delete'
alias ,pypath-set='export PYTHONPATH=`pwd`'
alias ,pypath-no='unset PYTHONPATH'

alias ,path-here='PATH=`pwd`:"$PATH"'

# testing short cut:
alias ,curl='curl -H "Content-Type: application/json" -H "X-Auth-Token: ${TOKEN}"'

# Cute and very helpful functions that I got from Dan Bloch a long time ago.
# Very useful if your home directory is on a network file system, such as AFS.
function G() {
    cd "`cat ~/.scratch/.M"$1" `"
}

function M() {
    pwd | ,nocr > ~/.scratch/.M"$1"
}

function R() {
    rm -i ~/.scratch/.M"$1"
}

function L() {
    cat ~/.scratch/.M | sed -e 's,^,	,'
    for d in `ls -A ~/.scratch | cut -c3-`
    do
        cat ~/.scratch/.M$d | sed -e "s,^,$d	,"
    done
}

PS1='\n\D{%s %H:%M:%S}\n\! \w\n\$ '

alias e=emacs
alias vi=vim

#PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
#PS1='\[\e]0;\w\a\]\n\u@\h \w\n\$ '
#PS1='\u@\h \w\n\$ '
#PS1='\n\D{%s %Y.%m.%d.%H.%M.%S}\n\! \w\n\$ '

#alias root='hg root'
#alias cdr='cd `root`'

# misc helpers

# convert epoch seconds to UTC
alias ,es2UTC='date -ujr'

# pew helpers
alias ,tmpvenv="pew mktmpenv -p python3"

# Behave helpers
alias ,plain="sed -E -e 's/^(default_format=).*/\1plain/' -i '' .behaverc"
alias ,progress="sed -E -e 's/^(default_format=).*/\1progress/' -i '' .behaverc"
alias ,stop="sed -E -e 's/^(stop=).*/\1true/' -i '' .behaverc"
alias ,go="sed -E -e 's/^(stop=).*/\1false/' -i '' .behaverc"

# flake8 helpers
alias ,f8='flake8 > /tmp/f8 ; vim /tmp/f8'

# git helpers
alias ,add='git add'
alias ,b=',branch'
alias ,bplain=",b --list -q | sed -e 's/^[* ]*//'"
alias ,branch='git branch'
alias ,cleanup-branches="git branch | sed -e 's/^.* //' | grep -v master | xargs git branch -d"
alias ,commit='git commit'
alias ,current-branch='git rev-parse --abbrev-ref HEAD'
alias ,d0=',d -U0'
alias ,d=',diff'
alias ,dc=',diff --cached'
alias ,dc0=',dc -U0'
alias ,dcno=',dc --name-only'
alias ,dno=',d --name-only'
alias ,dev=',tobranch develop'
alias ,diff='git diff'
alias ,fetch-all='git fetch --all'
alias ,fog=',mirror --dry-run'
alias ,glass=',mirror;,mirror;,mirror'
# And because I mistype this so much:
alias ,gof=,fog
alias ,l=',log'
alias ,log-all=',log --all'
alias ,log='git log --oneline --decorate --graph'
alias ,master=',tobranch master'
alias ,mirror=',push origin --mirror'
alias ,new-branch='git checkout -b'
alias ,pom=',push origin master'
alias ,push='git push'
alias ,s=',status'
alias ,sall=',status -uall'
alias ,sa=',sall'
alias ,sno=',status -uno'
alias ,sn=',sno'
alias ,status='git status'
alias ,tip=',l -n1 --name-status'
alias ,top='cd "$(git rev-parse --show-toplevel)"'
alias ,tdf='tree --dirsfirst --noreport'
alias ,ups='git pull upstream master'
alias ,whacklogs='git clean -fXd logs'
alias :e='vim'
alias :q='exit'

function ,context() {
    ack --output '       $&' 'context\.\w+' | sort -t: -k 3 
}

function ,tobranch() {
    git branch | sed -n -e 's/^.* //' -e /"$1"/p  | xargs -n 1 git checkout
}

function ,rall() {

    for x in $(git for-each-ref --format '%(refname:short)' refs/heads/)
    do
      git checkout "$x"
      git rebase master || return
      echo
    done
}

command -v pew >& /dev/null && source $(pew shell_config)


# NOTES: pushing --mirror in git is easy.
#        Pulling, not so much.
# From:
#    https://stackoverflow.com/questions/67699/how-to-clone-all-remote-branches-in-git
#        git clone --mirror path/to/original path/to/dest/.git
#        cd path/to/dest
#        git config --bool core.bare false
#        git checkout anybranch

test -s ~/.bashrc_local && source ~/.bashrc_local
