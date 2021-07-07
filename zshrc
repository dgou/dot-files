set -o notify

set -o ignore_eof

set -o hist_ignore_dups
set -o hist_ignore_space

PROMPT='
%D{%s %H:%M:%S}
%! %/
%# '

source ~/.aliases

test -s ~/.zshrc_local && source ~/.zshrc_local

# No matter what our editor/visual setting,
# I am used to emacs at the command line.
bindkey -e
