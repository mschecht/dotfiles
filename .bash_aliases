# essentials
alias ll='ls -lh'
alias la='ls -hla'
alias ld='ls -hlt'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias vi='vim'

# add color to grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# yadm commands
alias yu="yadm add -u; yadm commit -m '$(date)'; yadm push origin master"
alias ys="yadm status"
alias yd="yadm diff"
alias yp="yadm pull"

# quickly edit configuratiosn
alias eb='vim ~/dotfiles/terminal'
alias et='vim ~/dotfiles/tmux/tmux.conf'
alias ev='vim ~/dotfiles/vim/vimrc'

# History commands
alias h="history"
alias h1="history 10"
alias h2="history 20"
alias h3="history 30"

# wget
alias wget="wget -c"

# Keep previous command for later
alias keep="fc -ln -1 | sed 's/^\s\+//'>>COMAND-HIST"

# reload .bash
alias reload_rc='. ~/.bashrc'

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

if [[ "$midway_server" =~ "$(uname -n)"  ]]; then
	alias am="echo Updating anvio from the git repository;cd /project2/meren/VIRTUAL-ENVS/anvio-master/anvio; git pull; cd -;conda activate /project2/meren/VIRTUAL-ENVS/anvio-master/"
	alias anvi-activate-5.5="conda activate /project2/meren/VIRTUAL-ENVS/anvio-5.5";
fi

# Edit anvio fast
if [[ "$midway_server" =~ "$(uname -n)"  ]]; then
	alias ea="vi ~/github/anvio"
elif [[ "$my_uchicago_macbook" =~ "$(uname -n)" ]]; then
	alias ea="subl ~/github/anvio"
fi

# Open RStudio is correct $WHICH_RSTUDIO_R
alias Rstudio="open -na Rstudio"

# ssh to UChicago Midway
alias midway='ssh -L  8180:localhost:8180 -L 8181:localhost:8181 -L 8182:localhost:8182 -L 8183:localhost:8183 -L 8184:localhost:8184 -L 8185:localhost:8185 mschechter@midway2.rcc.uchicago.edu | tee /dev/tty | python3 ~/.ssh/run_webbrowser.py'

#SLURM Aliases that provide information in a useful manner for our clusters
alias si="sinfo -o \"%20P %5D %14F %8z %10m %10d %11l %32f %N\""
alias si2="sinfo -o \"%20P %5D %6t %8z %10m %10d %11l %32f %N\""
alias sq="squeue -o \"%8i %12j %4t %10u %20q %20a %10g %20P %10Q %5D %11l %11L %R\""
alias q="sinfo --partition=meren -N -o '%N %P %11T %20E %C %8m %8e %8d' | column -t; echo ; squeue --partition=meren -o '%11i %35j %5u %5C %13m %8T %10M %9l %6D %R'; echo ; squeue --partition=meren --user=$(id -u -n) -O 'arrayjobid:13,name,nodelist,stdout:120'"

alias qe="squeue --user=$USER -o '%10i %45j %5u %5C %13m %8T %10M %9l %6D %R'"

# Play sounds!
alias bn="printf 'Ugh the lab is so loud... /n';mpg123 ~/opt/brown_noise/Smoothed_Brown_Noise.mp3"

# Meren lab essentials
alias cdm="cd /project2/meren/"

# Use Spacevim cause it's better
alias vim="vim -u ~/.SpaceVim/vimrc"
