############################
# MAKE TERMINAL GREAT AGAIN!
############################

# Terminal prompt
#PS1=[ -z "$PS1" ] && return
export COLOR_A="\[\033[0;31m\]"
export COLOR_B="\[\033[0;33m\]"
export COLOR_C="\[\033[0;32m\]"
export COLOR_d="\[\033[0;34m\]"
export COLOR_DEFAULT="\[\e[0m\]"
export PROMPT_DIRTRIM=8
export TIME="\t"
export USER="\u"
export HOST="\h"
export WD="\w" # working directory
export PS1="$COLOR_A[$TIME] $COLOR_B[$USER@$COLOR_C$HOST:$COLOR_D$WD$COLOR_B]$ $COLOR_DEFAULT\n"
#export PS1="$COLOR_BOLD[\t] [\u@\h: \w]\$ \e[m\n"
#export PS1="$COLOR_BOLD[\t] \e[m$NEXT_COLOR\u\e[m@\h: \w]\$ \n"

# ==== alias for colors ========
BLACK="tput setf 0"
BLUE="tput setf 1"
GREEN="tput setf 2"
CYAN="tput setf 3"
RED="tput setf 4"
MAGENTA="tput setf 5"
YELLOW="tput setf 6"
WHITE="tput setf 7"


RETURN="tput sgr0"
BOLD="tput bold"
REV="tput rev"


# Some examples of use

#PS1="`$REV``$RED`[$netip `$BLUE`/\W]#`$RETURN` "


export CLICOLOR=2
export LSCOLORS=GxFxCxDxBxegedabagaced

#########
# Aliases
#########

alias ll='ls -lagh'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

##############
# Miscilaneous
##############

# bibtex script
# Make .bib file in current directory and add bibtex citations to it with DOI
# usage: doi2bib DOI
doi2bib ()
{
	echo >> bib.bib;
	curl -s "http://api.crossref.org/works/$1/transform/application/x-bibtex" >> bib.bib;
	echo >> bib.bib;
}
