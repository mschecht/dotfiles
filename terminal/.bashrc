############################
# MAKE TERMINAL GREAT AGAIN!
############################

#----------------
# Terminal prompt
#----------------

# Variables
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

# Prompt layout
export PS1="$COLOR_A[$TIME] $COLOR_B[$USER@$HOST:$COLOR_C$WD$COLOR_B]$ $COLOR_DEFAULT\n"

#-----------------
# LS color options
#-----------------

# Here is a good link to changing colors: https://geoff.greer.fm/lscolors/

OS=$(uname) # Run `uname` command to get current OS

# Run necessary colors setting for IOS or Linux
if [[ "$OS" == "Linux" ]]; then
	export LSCOLORS=di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;43 # Linux
elif [[ "$OS" == "Darwin" ]]; then
    export CLICOLOR=2    
	export LSCOLORS=GxFxCxDxBxegedabagaced # IOS
fi

#-------------
# BASH Aliases
#-------------

# All aliases are here
if [ -f ~/.bash-aliases ]; then
   . ~/.bash-aliases
fi

#---------------
# BASH Functions
#---------------

# All BASH functions are here
if [ -f ~/.bash-functions ]; then
. ~/.bash-functions
fi

