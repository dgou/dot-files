# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

if [ -e "${HOME}/.bashrc_local" ] ; then
  source "${HOME}/.bashrc_local"
fi

export TMPDIR=/tmp
export EDITOR=vim
export DISPLAY=:0.0
export CVS_RSH=ssh
export HISTTIMEFORMAT="%H:%M:%S "
export WORKON_HOME="${HOME}/.virtual_envs"
if [ ! -d "${WORKON_HOME}" ]; then
    echo mkdir "${WORKON_HOME}"
    mkdir "${WORKON_HOME}"
fi

export PYTHONDONTWRITEBYTECODE=1

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
