# this is where I store my binaries when I don't have write access,
export PATH=$PATH:~/bin

# pull from yadm before anything
if hash yadm 2>/dev/null; then
  echo ''
  echo 'yadm pull updates to our dotfiles'
  echo ''
  yadm pull
else
  echo 'yadm binary not found. dotfiles were not pulled. install here: https://github.com/TheLocehiliosan/yadm'
fi

# load all the good stuff
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mschechter/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mschechter/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/mschechter/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mschechter/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
