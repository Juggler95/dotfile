# My Arch linux dotfiles

this directory contains the dotfiles for my arch system

# Requirements

Ensure you have the following installed on your system

### Git

```

pacman -S git
```

### Stow
```

pacman -S stow
```

### Installation

First, check out the dotfiles repo in your $HOME directory using git

```

$ git clone git@github.com:Juggler95/dotfile.git
$ cd dotfile
```


then use GNU stow to create symlinks

```

$ stow .
```

### Zsh Plugins installs
If you are using zsh and want the plugins I use use these commands 

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Video Help

The video I used to set this up

https://www.youtube.com/watch?v=y6XCebnB9gs
