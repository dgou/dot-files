# Set architecture flags
export ARCHFLAGS="-arch x86_64"

if [ -e /etc/bash.bashrc ] ; then
  source /etc/bash.bashrc
fi

if [ -e "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi


if [ -e "${HOME}/.bashrc_local" ] ; then
  source "${HOME}/.bashrc_local"
fi

if [ -e "${HOME}/.profile" ] ; then
  source "${HOME}/.profile"
fi

export TMPDIR=/tmp
export EDITOR=vim
export MANPATH=/opt/local/share/man:$MANPATH
export DISPLAY=:0.0

export CVS_RSH=ssh

export HISTTIMEFORMAT="%H:%M:%S "

export WORKON_HOME="${HOME}/.virtual_envs"
if [ ! -d "${WORKON_HOME}" ]; then
    echo mkdir "${WORKON_HOME}"
    mkdir "${WORKON_HOME}"
fi

export PYTHONDONTWRITEBYTECODE=1

for d in \
         "/c/Program Files/GnuWin32/bin" \
         /Library/Frameworks/Python.framework/Versions/Current/bin \
         /usr/texbin \
         /c/Python24/Scripts \
        "${HOME}/bin" \
        "${CFM_HOME}/bin"
do
    if [ -d "$d" ];
    then
        export PATH="$d":"$PATH"
    fi
done

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
