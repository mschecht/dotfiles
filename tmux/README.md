# Instructions for deploying tmux configurations

1. Move new machine's tmux.conf file into a file for safe keeping

``` 
mv ~/.tmux.conf ~/dotfiles/oldconfig
```

2. add .gitignore to ~/dotfiles/ , this make it so that the old bag configurations from the current machine are not tracked
```
ls ~/dotfiles/oldconfig >> .gitignore
```
