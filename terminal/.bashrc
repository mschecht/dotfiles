############################
# MAKE TERMINAL GREAT AGAIN!
############################

# Terminal prompt
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
export PS1="$COLOR_A[$TIME] $COLOR_B[$USER@$HOST:$COLOR_C$WD$COLOR_B]$ $COLOR_DEFAULT\n"

##################
# LS color options
#################
# Here is a good link to changing colors: https://geoff.greer.fm/lscolors/

OS=$(uname) # Run `uname` command to get current OS

# Run necessary colors setting for IOS or Linux
if [[ "$OS" == "Linux" ]]; then
	export LSCOLORS=di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;43 # Linux
elif [[ "$OS" == "Darwin" ]]; then
    export CLICOLOR=2    
	export LSCOLORS=GxFxCxDxBxegedabagaced # IOS
fi

#########
# Aliases
#########

## INCLUDE aliases
if [ -f ~/.bash-aliases ]; then
   . ~/.bash-aliases
fi

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

# Jupyter lab through ssh tunnel on remote server
# Credit: http://benjlindsay.com/blog/running-jupyter-lab-remotely/
function jllocal {
  cmd="ssh -Y -fN -L localhost:8885:localhost:8888 mschecht@bigmem-3"
  running_cmds=$(ps aux | grep -v grep | grep "$cmd")
  if [[ "$1" == 'kill' ]]; then
    if [ ! -z $running_cmds ]; then
      for pid in $(echo $running_cmds | awk '{print $2}'); do
        echo "killing pid $pid"
        kill -9 $pid
      done
    else
      echo "No jllocal commands to kill."
    fi
  else
    if [ ! -z $n_running_cmds ]; then
      echo "jllocal command is still running. Kill with 'jllocal kill' next time."
    else
      echo "Running command '$cmd'"
      eval "$cmd"
    fi
    url=$(ssh USERNAME@HOSTNAME \
            '/REMOTE/PATH/TO/jupyter notebook list' \
            | grep http | awk '{print $1}')
    echo "URL that will open in your browser:"
    echo "$url"
    open "$url"
  fi
}
