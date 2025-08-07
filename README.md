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

### Hyprland Programs Installs
I use kitty for my terminal, nautilus for my file mananger, wofi for menu, and firefox for browser

```

sudo pacman -S kitty
```

```

sudo pacman -S nautilus
```

```
sudo pacman -S wofi
```

```

sudo pacman -S firefox
```


### Other prgrams used with hyprland keybindings
I use Swww for wallpapers, grim/slurp for screen shots.


```

sudo pacman -S swww
```

```

sudo pacman -S slurp grim wl-clipboard
```
You'll also need playerctl for my spotify controlls.

```

sudo pacman -S playerctl
```

I also use swaync for my notifcations but I do not have that in my dotfiles currently.

### Video Help

The video I used to set this up

https://www.youtube.com/watch?v=y6XCebnB9gs
