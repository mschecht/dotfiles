# Terminal prompt
#PS1=[ -z "$PS1" ] && return
export COLOR_BOLD="\[\033[1;31m\]"
export COLOR_DEFAULT="\[\e[0m\]"
export PROMPT_DIRTRIM=8
export PS1="$COLOR_BOLD[\t] [\u@\h \w]\$ \e[m\n"

export CLICOLOR=2
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ll='ls -lagh'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

# git aliases
alias gp='git pull'
alias gs='git status'
alias gcm='git commit -m'

# bibtex shit
#doi2bib
doi2bib ()
{
	echo >> bib.bib;
	curl -s "http://api.crossref.org/works/$1/transform/application/x-bibtex" >> bib.bib;
	echo >> bib.bib;
}
