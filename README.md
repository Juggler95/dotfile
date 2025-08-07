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

$ git clone git@github.com:Juggler95/arch-linux-dotfiles.git
$ cd dotfiles
```


then use GNU stow to create symlinks

```

$ stow .
```
https://www.youtube.com/watch?v=y6XCebnB9gs
