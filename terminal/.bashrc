############################
# MAKE TERMINAL GREAT AGAIN!
############################

# Terminal prompt
#PS1=[ -z "$PS1" ] && return
export COLOR_BOLD="\[\033[1;31m\]"
export COLOR_DEFAULT="\[\e[0m\]"
export PROMPT_DIRTRIM=8
export PS1="$COLOR_BOLD[\t] [\u@\h: \w]\$ \e[m\n"

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
