# pull from yadm before anything
if hash yadm 2>/dev/null; then
    yadm pull
else
    echo 'yadm binary not found. dotfiles were not pulled. install here: https://github.com/TheLocehiliosan/yadm'
fi

# load all the good stuff
if [ -f ~/.bashrc ]; then
	source .bashrc
fi
