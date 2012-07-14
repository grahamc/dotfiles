# unalias gb

function add_path
{
    export PATH=${@}:$PATH;
}

add_path ~/bin;
add_path /usr/local/mysql/bin;

# Add homebrew's bin directories to the path
hash brew 2> /dev/null && {
   add_path `brew --prefix`/bin
   add_path `brew --prefix`/sbin
}

# Ruby Version Manager
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"
[[ -s "${HOME}/.settings-private" ]] && source "${HOME}/.settings-private"

export EDITOR=vim
export NODE_PATH="/usr/local/lib/node_modules"
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib/"

alias c="composer"
alias activate=". venv/bin/activate"

