
function add_path
{
    export PATH=$argv[1]:$PATH;
}

add_path ~/bin;
add_path /usr/local/mysql/bin

# Add homebrew's bin directories to the path
`hash brew 2>&1 > /dev/null` && {
    add_path `brew --prefix`/bin
    add_path `brew --prefix`/sbin
}

# Ruby Version Manager
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"
[[ -s "${HOME}/.settings_private" ]] && source "${HOME}/.settings_private"

# Put the editor in vim mode
set -o vi
export EDITOR=vim

export NODE_PATH="/usr/local/lib/node_modules"
