for d in /etc/bash.bashrc ~/.bashrc ~/.profile ~/.env_setup ~/.rvm/scripts/rvm
do
   test -s "$d" && source "$d"
done

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
