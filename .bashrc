##########################
# >>> SHELL INITIALIZATION
##########################

#-----------------------------------------------
# If we're scping or rsyncing... we're done here
#-----------------------------------------------
if [ -z "$PS1" ]; then
    return
fi

#----------------------------------------------------------------------------
# Global variables to change functionality depending on which computer I'm on
#----------------------------------------------------------------------------
export my_uchicago_macbook="MED42040.lan:MED42040.local:MED42040.local:MED42040.fios-router.home:10-17-10-236.ddhcp.uni-oldenburg.de"
midway_hosts=(midway2-login{1,2}.rcc.local midway-l16b-28.rcc.local midway2-070{1,5,6}.rcc.local midway3-login{1,2,3,4}.rcc.local)
export midway_server=$(IFS=:; echo "${midway_hosts[*]}")

# welcome message
if shopt -q login_shell; then
  bash ~/.bash_welcome
fi

export LSCOLORS=ExFxCxDxBxegedabagacad

#----------------------------------------------
# Load different stuffs depending on where I am
#----------------------------------------------
host=$(uname -n) # define host variable

if [[ "$midway_server" =~ "$host"  ]]; then # UChicago HPC
	# Here is a good link to changing colors: https://geoff.greer.fm/lscolors/
  # because everyone likes colors
  export LSCOLORS="di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;43" # colors
  # Loading programs that midway does not load automatically and I want!
  module load midway2; module load tmux/current; module load python/anaconda-2020.02 # the correct tmux

  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/software/Anaconda3-5.3.0-el7-x86_64/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/software/Anaconda3-5.3.0-el7-x86_64/etc/profile.d/conda.sh" ]; then
            . "/software/Anaconda3-5.3.0-el7-x86_64/etc/profile.d/conda.sh"
        else
            export PATH="/software/Anaconda3-5.3.0-el7-x86_64/bin:$PATH"
        fi
    fi
  unset __conda_setup
  [[ -z $TMUX ]] || conda deactivate; conda activate base # THANK YOU https://github.com/conda/conda/issues/6826#issuecomment-397287212
  
  # Loading paths to programs that anvio needs! 
  source /project2/meren/VIRTUAL-ENVS/shared/00_load_all.sh
  export PATH="$PATH:/project2/meren/RESOURCES/PUBLIC/SOFTWARE/EXECUTABLES/"


elif [[ "$my_uchicago_macbook" =~ "$host" ]]; then # Locals only
	# Note to self:
	# native ls does not support coloring by file extension. To implement this I would need to run gnu ls: gls
	export LS_COLORS=GxFxCxDxBxegedabagaced

	# PATH for downloading NCBI files: https://github.com/ncbi/sra-tools
	export PATH=$PATH:/Users/mschechter/opt/sratoolkit.2.11.3-mac64/bin
fi

#------------------------------
# BASH command history settings
#------------------------------
# Great resource: https://www.shellhacks.com/tune-command-line-history-bash/

# ignorespace: don’t save lines which begin with a <space> character; erasedups: eliminate duplicates across the whole history
export HISTCONTROL=ignorespace:erasedups
# Increase size
export HISTSIZE=100000000000
export HISTFILESIZE=10000000000
# Append Bash Commands to History File
shopt -s histappend
# History time format
HISTTIMEFORMAT="%d/%m/%y %T "

#----------
# Miniconda
#----------
export PATH="$HOME/miniconda3/bin:$PATH"

#------
# Ruby
#------
export PATH="/usr/local/opt/ruby/bin:$PATH"

#---------
# Language
#---------
export LANG=en_US.UTF-8

#----------------------
# Pointing RStudio to R
#----------------------
# This has never worked and is so irritating: https://support.rstudio.com/hc/en-us/articles/200486138-Changing-R-versions-for-RStudio-desktop
#export RSTUDIO_WHICH_R=/Users/mschechter/miniconda3/bin/r
#export RSTUDIO_WHICH_R=/Users/mschechter/miniconda3/envs/anvio-master/bin/r

#-------------------------
# Changing HOMEBREW editor
#-------------------------

#export HOMEBREW_EDITOR="/usr/local/bin/vim"

#---------------------------
# Load all BASH dotfiles
#---------------------------
for file in ~/.{bash_prompt,bash_functions,bash_aliases}; do
    if    [ -e "${file}" ] ; then
        source "${file}"
    fi;
done;
unset file;


#---------------------------
# Install tabset
#---------------------------

# Tabset is a nice program extension of iterm2 to add a color to the tab and label in the top right corner to help organize tabs
# Installation instructions: https://github.com/jonathaneunice/iterm2-tab-set#readme
