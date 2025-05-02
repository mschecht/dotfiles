# 🛠️ Dotfiles – Personal Terminal Configuration for Development & HPC

This repository contains my personal dotfiles, managed with [YADM](https://yadm.io/). It includes shell customizations, aliases, and environment settings tailored for:

- Daily development on macOS
- High-performance computing on an SLURM HPC
- Reproducible configuration with Git

## 🔧 Core Components

Each component has a **single responsibility**, which makes debugging easier and encourages clean organization:

| File              | Purpose                                                                 |
|-------------------|-------------------------------------------------------------------------|
| `.bashrc`         | Main entry point for interactive shells. Sources other components and handles machine-specific logic. |
| `.bash_profile`   | Loaded for login shells; primarily used on macOS. Delegates to `.bashrc` to ensure consistent behavior. |
| `.bash_prompt`    | Defines the command prompt, including color-coded Git status, time, and path. |
| `.bash_aliases`   | Contains all command aliases. Divided by theme (navigation, git, SLURM, Anvi’o, etc.). |
| `.bash_functions` | Miscellaneous custom Bash functions to improve productivity.             |
| `.bash_welcome` | Nice welcome message.             |


## 🚀 Quick Start


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

## 🧪 Tips
- Use `ys` to check dotfile status
- Use `yu` to commit and push tracked changes (add -u, timestamp commit)
- Keep all config edits in modular files (.bash_aliases, .bash_utils, etc.)
- `reload_rc` to refresh shell config without restarting your terminal

## 🙌 Credits
Thanks to:
- @ekiefl and @FlorianTrigodet for inspiration and snippets
- [yadm.io](https://yadm.io/) for making dotfile management sane
