How to install on new system:

1. [Install yadm](https://yadm.io/docs/install#download:~:text=PATH%20and%20situation.-,Clone,-You%20might%20wish)

The git clone strategy is the most reliable
```bash
git clone https://github.com/TheLocehiliosan/yadm.git ~/.yadm-project
ln -s ~/.yadm-project/yadm ~/bin/yadm
```

2. [Connect yadm to dotfiles rep](https://yadm.io/docs/getting_started#:~:text=If%20you%20have%20an%20existing%20remote%20repository)

```bash
yadm clone https://github.com/mschecht/dotfiles.git -f

# double check
yadm status
```
