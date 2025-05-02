# essential, essential, essential mix
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -hla'
alias ld='ls -rhlt'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias col="column -t"
alias h="head -n"
alias t="tail -n"
alias tf="tail -F"
alias tre="tree -C"
alias rf="readlink -f"

# add color to grep.... PERTY COLORSS
alias grep="grep --color"

# yadm commands... because who wants to waste time editing their dotfiles AM I RIGHT!?
# yadm IS the way to go for managing dotfiles: https://yadm.io/
# Thanks for the suggestions Evan and Florian
alias yu="yadm add -u; yadm commit -m '$(date)'; yadm push origin master"
alias ys="yadm status"
alias yd="yadm diff"
alias yp="yadm pull"

# quickly edit configurations... because nobody got time... wise words from Evan
alias eb='vim ~/.bashrc'
alias et='vim ~/.tmux.conf'
alias eu="vim ~/.bash_utils"
alias ea="vim ~/.bash_aliases"
alias ep="vim ~/.bash_prompt"
alias ef="vim ~/.bash_functions"
alias ev="vim ~/.vimrc"

# History commands
alias h1="history 10"
alias h2="history 20"
alias h3="history 30"

# wget
alias wget="wget -c"

# reload .bash
alias reload_rc='source ~/.bash_profile'

# git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# Switch to simple bash prompt
alias s='export PS1="\u:\w\\$ "'

# Show $PATH in prettier format
# credit: https://github.com/stephenturner/oneliners
alias showpath='echo $PATH | tr ":" "\n" | nl'

# Deactivate ALL conda envs currently open
alias ds=deactivate_smart

# Edit anvio fast
if [[ "$midway_server" =~ "$host"  ]]; then
  
	# Activate anvio
	alias aad="init_anvio_dev_midway"
	alias anvi-activate-5.5="conda activate /project2/meren/VIRTUAL-ENVS/anvio-5.5";
  alias aamss=init_anvio_mschechter

	# Edit anvio fast
	alias eanvio="vim /project2/meren/PEOPLE/mschechter/github/anvio"

	# Meren lab essentials
	alias cdm="cd /project2/meren/"
	alias cdb="cd /project/lbarreiro/"
	alias cdmss="cd /project2/meren/PEOPLE/mschechter"
	alias gpmss="cd /project2/meren/PEOPLE/mschechter/github/anvio && git pull && cd -"


# ─── SLURM control ─────────────────────────────────────────────────────────
	#SLURM Aliases that provide information in a useful manner for our clusters
	alias si="sinfo -o \"%20P %5D %14F %8z %10m %10d %11l %32f %N\""
	alias si2="sinfo -o \"%20P %5D %6t %8z %10m %10d %11l %32f %N\""
	alias sq="squeue -o \"%8i %12j %4t %10u %20q %20a %10g %20P %10Q %5D %11l %11L %R\""
	alias q="sinfo --partition=meren -N -o '%N %P %11T %20E %C %8m %8e %8d' | column -t; \
			 echo ; \
			 squeue --partition=meren -o '%11i %35j %5u %5C %13m %8T %10M %9l %6D %R'; \
			 echo ; \
			 squeue --partition=meren --user=$(id -u -n) -O 'arrayjobid:13,name,nodelist,stdout:120'"
	alias qlb="sinfo --partition=lbarreiro -N -o '%N %P %11T %20E %C %8m %8e %8d' | column -t; \
			 echo ; \
			 squeue --partition=lbarreiro -o '%11i %35j %5u %5C %13m %8T %10M %9l %6D %R'; \
			 echo ; \
			 squeue --partition=lbarreiro --user=$(id -u -n) -O 'arrayjobid:13,name,nodelist,stdout:120'"
	alias sc="scancel"
	alias si="sinteractive --partition=meren --time=08:00:00 --mem=20G --ntasks-per-node=20"
	alias qe="squeue --user=$USER -o '%10i %45j %5u %5C %13m %8T %10M %9l %6D %R'"

elif [[ "$my_uchicago_macbook" =~ "$host" ]]; then

	# Edit anvio fast
	alias eanvio="code ~/github/anvio"
	alias cda="cd ~/github/anvio"
	
	# activating anvio
	alias aas=init_anvio_7
	alias aad=init_anvio_dev
fi

# Open RStudio is correct $WHICH_RSTUDIO_R
alias Rstudio="open -na Rstudio"

# ssh to UChicago Midway
alias midway='ssh -L  8180:localhost:8180 -L 8181:localhost:8181 -L 8182:localhost:8182 -L 8183:localhost:8183 -L 8184:localhost:8184 -L 8185:localhost:8185 mschechter@midway2.rcc.uchicago.edu | tee /dev/tty | python3 ~/.ssh/run_webbrowser.py'
alias midway3='ssh -L  8180:localhost:8180 -L 8181:localhost:8181 -L 8182:localhost:8182 -L 8183:localhost:8183 -L 8184:localhost:8184 -L 8185:localhost:8185 mschechter@midway3.rcc.uchicago.edu | tee /dev/tty | python3 ~/.ssh/run_webbrowser.py'

# ─── Sound Control Aliases ─────────────────────────────────────────────
# Play brown noise to reduce ambient distractions in the lab
alias bn="printf 'Ugh the lab is so loud... \n\n'; mpg123 ~/opt/brown_noise/Smoothed_Brown_Noise.mp3"

# Add more aliases below for different soundscapes (e.g., white noise, rain, music)

# Edit NOTES quickly
alias en="vim Google_drive_uchicago/NOTES/"

# Inkscape - open a file quickly from the terminal
alias ink="open -a Inkscape"
