# Personal bin's
PATH=~/bin:~/pear/bin:$PATH

# MySQL Bits:
PATH=$PATH:/usr/local/mysql-5.5.8-osx10.6-x86/bin/:/usr/local/mysql/bin

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


# Editor
if [ -x "/Applications/TextMate.app/Contents/Resources/mate" ]; then
    alias mate="/Applications/TextMate.app/Contents/Resources/mate"
    EDITOR="/Applications/TextMate.app/Contents/Resources/mate"
fi

# Ruby Version Manager
[[ -s "~/.rvm/scripts/rvm" ]] && source "~/.rvm/scripts/rvm"

# Brew:
`hash brew 2> /dev/null`
if [[ $? -eq 0 ]]
then
	source `brew --prefix git`/etc/bash_completion.d/git-completion.bash
	PATH=`brew --prefix`/bin:$PATH
else
	# MacPorts
	PATH=/opt/local/bin:/opt/local/sbin:$PATH
fi


# Aliases
# Use s1 to set g1's directory
# Save the results by executing `mdump`
alias s1='alias g1="cd `pwd`"'
alias s2='alias g2="cd `pwd`"'
alias s3='alias g3="cd `pwd`"'
alias s4='alias g4="cd `pwd`"'
alias s5='alias g5="cd `pwd`"'
alias s6='alias g6="cd `pwd`"'
alias s7='alias g7="cd `pwd`"'
alias s8='alias g8="cd `pwd`"'
alias s9='alias g9="cd `pwd`"'
alias mdump='alias|grep -e "alias g[0-9]"|grep -v "alias s" > ~/.bookmarks'
alias lma='alias | grep -e "alias g[0-9]"|grep -v "alias s"|sed "s/alias //"'
touch ~/.bookmarks
source ~/.bookmarks

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
