############################
# MAKE TERMINAL GREAT AGAIN!
############################

#---------------------------------------------------------------------------
# Global variables to change functionality depending on which computer im on
#---------------------------------------------------------------------------
export my_uchicago_macbook="MED42040.lan:MED42040.local:MED42040.local"
export midway_server="midway2-login1.rcc.local:midway2-login2.rcc.local:midway-l16b-28.rcc.local:midway2-0701.rcc.local:midway2-0705.rcc.local:midway2-0706.rcc.local"

# welcome message
bash ~/.bash-welcome

export LSCOLORS=ExFxCxDxBxegedabagacad

#if shopt -q login_shell; then
	# Make sure dotfiles are updates
#	echo "Updating dotfiles..."
#	echo ""
#	cd ~/dotfiles && git pull && cd - 
#fi

#-----------------
# LS color options
#-----------------

# Here is a good link to changing colors: https://geoff.greer.fm/lscolors/

# Load various things depending on which computer I'm on
if [[ "$midway_server" =~ "$(uname -n)"  ]]; then
	export LSCOLORS="di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;43" # colors 
	echo ""
	echo "Loading up tmux!"
	module load midway2; module load tmux/current # the correct tmux
	source /project2/meren/VIRTUAL-ENVS/shared/00_load_all.sh
elif [[ "$my_uchicago_macbook" =~ "$(uname -n)" ]]; then
	export LSCOLORS=GxFxCxDxBxegedabagaced # IOS
	export CLICOLOR=2
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
for file in ~/.{bash-prompt,bash-functions,bash-aliases}; do
	if	[ -e "${file}" ] ; then
		source "${file}"
	else
		touch "${file}" # need to fix this section
		dot=$(basename "${file}")
		echo "source ~/dotfiles/terminal/"${dot}"" > "${file}"
		source "${file}"
	fi;
done;
unset file;