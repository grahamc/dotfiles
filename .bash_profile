# Personal bin's
PATH=~/bin:~/pear/bin:$PATH

# MySQL Bits:
PATH=$PATH:/usr/local/mysql-5.5.8-osx10.6-x86/bin/:/usr/local/mysql/bin

# Really only OSX, but...
export NODE_PATH="/usr/local/lib/node_modules"

# Gems on Ubuntu:
PATH=/var/lib/gems/1.8/bin:$PATH

if [[ -x /usr/local/bin/vim ]]
then
    export EDITOR=/usr/local/bin/vim
fi


`hash ctags 2> /dev/null`
if [[ $? -eq 0 ]]
then
    `hash ctags-exuberant 2> /dev/null`
    if [[ $? -eq 1 ]]
    then
        alias "ctags-exuberant"="ctags"
    fi
fi

export PATH=$PATH

# Ruby Version Manager
[[ -s "~/.rvm/scripts/rvm" ]] && source "~/.rvm/scripts/rvm"

# Brew:
`hash brew 2> /dev/null`
if [[ $? -eq 0 ]]
then
    source `brew --prefix git`/etc/bash_completion.d/git-completion.bash
    PATH=`brew --prefix`/bin:$PATH
fi

# Add color to `ls`
export CLICOLORS=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls='ls -pFG'

# Git Prompt Magic
if [ -x "/etc/git-prompt.sh" ]; then
    [[ $- == *i* ]]   &&   . /etc/git-prompt.sh
fi

# Source my private settings, nothing special...
if [ -f ~/.bash_private ]
then
    source ~/.bash_private
fi
