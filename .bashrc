############################
# MAKE TERMINAL GREAT AGAIN!
############################

#---------------------------------------------------------------------------
# Global variables to change functionality depending on which computer im on
#---------------------------------------------------------------------------
export my_uchicago_macbook="MED42040.lan:MED42040.local:MED42040.local"
export midway_server="midway2-login1.rcc.local:midway2-login2.rcc.local:midway-l16b-28.rcc.local:midway2-0701.rcc.local:midway2-0705.rcc.local:midway2-0706.rcc.local"

# welcome message
bash ~/.bash_welcome

export LSCOLORS=ExFxCxDxBxegedabagacad

#-----------------
# LS color options
#-----------------

# Here is a good link to changing colors: https://geoff.greer.fm/lscolors/

# Load various things depending on which computer I'm on
if [[ "$midway_server" =~ "$(uname -n)"  ]]; then
	export LSCOLORS="di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;43" # colors 
	echo ""
	echo "Loading up modules!"
	module load midway2; module load tmux/current; module load python/anaconda-2020.02 # the correct tmux
	source /project2/meren/VIRTUAL-ENVS/shared/00_load_all.sh

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

elif [[ "$my_uchicago_macbook" =~ "$(uname -n)" ]]; then
	export LSCOLORS=GxFxCxDxBxegedabagaced # IOS
	export CLICOLOR=2
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/Users/evan/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/evan/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/Users/evan/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/evan/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

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

#after each command save and reload history

log_bash_persistent_history()
{
        [[
        $(history 1) =~ ^\ *[0-9]+\ +([^\ ]+\ [^\ ]+)\ +(.*)$
        ]]
        local date_part="${BASH_REMATCH[1]}"
        local command_part="${BASH_REMATCH[2]}"
        if [ "$command_part" != "$PERSISTENT_HISTORY_LAST" ]
        then
                echo $date_part "|" "$command_part" >> ~/.persistent_history
                export PERSISTENT_HISTORY_LAST="$command_part"
        fi
}

# Stuff to do on PROMPT_COMMAND
run_on_prompt_command() {
        log_bash_persistent_history
}

export PROMPT_COMMAND="history -a; history -c; history -r; run_on_prompt_command; $PROMPT_COMMAND"

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
	if	[ -e "${file}" ] ; then
		source "${file}"
	fi;
done;
unset file;
