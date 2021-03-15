# bibtex script
# Make .bib file in current directory and add bibtex citations to it with DOI
# usage: doi2bib DOI
doi2bib ()
{
	printf "\n">> $2
	curl -s "http://api.crossref.org/works/$1/transform/application/x-bibtex" >> $2;
}

# create .tar.gz
targz() { tar -zcvf $1.tar.gz $1; rm -r $1; }

# column -t file | head
colhead() { column -t $1 | head; }
coltail() { column -t $1 | tail; }

# Print string in corner of terminal to remind me where I am 
function named() {
  printf "\e]1337;SetBadgeFormat=%s\a" $(echo "$1" | base64)
  echo -ne "\033]0;"$1"\007"
}

# extract *ANY* compressed file
extract ()
{
      if [ -f $1 ] ; then
        case $1 in
          *.tar.bz2)   tar xjf $1     ;;
          *.tar.gz)    tar xzf $1     ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar e $1     ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xf $1      ;;
          *.tbz2)      tar xjf $1     ;;
          *.tgz)       tar xzf $1     ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)     echo "'$1' cannot be extracted via extract()" ;;
           esac
       else
           echo "'$1' is not a valid file"
       fi
}

# What's the weather?
weather() { curl wttr.in/"$1"; }

# Automagically open Jupyter Lab and have it connected to server
# credit: https://benjlindsay.com/blog/running-jupyter-lab-remotely/
function jllocal {
	cmd="ssh -Y -fN -L localhost:8888:localhost:8888 mschecht@bigmem-3"
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
    
	url=$(ssh mschecht@bigmem-3:/scratch/mschecht/post_msc | grep http | awk '{print $1}')
    echo "URL that will open in your browser:"
    echo "$url"
    open "$url"
  fi
}
# Automgaically open A'nvio and have it connected to server
# DO IT Yourself
# credit: http://merenlab.org/2015/11/28/visualizing-from-a-server/
#

if [[ "$midway_server" =~ "$(uname -n)"  ]]; then

  # Zcat + head 
  zhead() {
    zcat $1 | head
  }
elif [[ "$my_uchicago_macbook" =~ "$(uname -n)" ]]; then

  # Zcat + head 
  zhead() {
    gzcat $1 | head
  }
fi


# tmux function
tmux-dev () {
	tmux new-session bash
	tmux split-window -v 'ipython'
	tmux split-window -h
	tmux new-window 'mutt'
	tmux -2 attach-session -d
}

# anvio stuffs, inspired by here: http://merenlab.org/2016/06/26/installation-v2/#following-the-active-codebase-youre-a-wizard-arry
deactivate_smart () {
	echo "Deactivating"
	{
		deactivate && conda deactivate
	} &> /dev/null
}

# This is where my miniconda base is, you can find out
# where is yours by running this in your terminal:
#
#    conda env list | grep base
#
export MY_MINICONDA_BASE="/Users/$USER/miniconda3"

init_anvio_7 () {
  deactivate &> /dev/null
  conda deactivate &> /dev/null
  export PATH="$MY_MINICONDA_BASE/bin:$PATH"
  . $MY_MINICONDA_BASE/etc/profile.d/conda.sh
	conda activate anvio-7
	echo "anvi'o v7 is now active. If you need master, please run anvi-activate-master."
	PS1="(\$(echo \$CONDA_DEFAULT_ENV | awk -F '/' '{print \$NF}')) $YELLOW[$USER@$HOSTSTYLE\h$YELLOW:$RED$WD$YELLOW]$RED \$git_branch 🌴 $COLOR_DEFAULT"
}

init_anvio_dev () {
  deactivate &> /dev/null
  conda deactivate &> /dev/null
  export PATH="$MY_MINICONDA_BASE/bin:$PATH"
  . $MY_MINICONDA_BASE/etc/profile.d/conda.sh	
  conda activate anvio-dev
	PS1="(\$(echo \$CONDA_DEFAULT_ENV | awk -F '/' '{print \$NF}')) $YELLOW[$USER@$HOSTSTYLE\h$YELLOW:$RED$WD$YELLOW]$RED \$git_branch 🌴 $COLOR_DEFAULT"
}


init_anvio_dev_midway () {
  deactivate &> /dev/null
  conda deactivate &> /dev/null
  export PATH="$MY_MINICONDA_BASE/bin:$PATH"
  . $MY_MINICONDA_BASE/etc/profile.d/conda.sh	
  conda activate /project2/meren/VIRTUAL-ENVS/anvio-dev/
	PS1="(\$CONDA_DEFAULT_ENV) $YELLOW[$USER@$HOSTSTYLE\h$YELLOW:$RED$WD$YELLOW]$RED \$git_branch 🌴 $COLOR_DEFAULT"
}

init_anvio_mschechter () { 
  conda activate /project2/meren/PEOPLE/mschechter/conda-envs/anvio-mschechter
	PS1="(\$(echo \$CONDA_DEFAULT_ENV | awk -F '/' '{print \$NF}')) $YELLOW[$USER@$HOSTSTYLE\h$YELLOW:$RED$WD$YELLOW]$RED \$git_branch 🌴 $COLOR_DEFAULT"
}


