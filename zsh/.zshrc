# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of plugins to load (must be before sourcing oh-my-zsh)
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration --------------------------------------------------

export PATH="$HOME/.tmuxifier/bin:$PATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Example aliases
# alias zshconfig="nvim ~/.zshrc"
# alias ohmyzsh="nvim ~/.oh-my-zsh"

# Case-sensitive completion
CASE_SENSITIVE="true"

# ----------------------------
# Starship Prompt (load AFTER Oh My Zsh)
# ----------------------------
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

# ----------------------------
# fzf
# ----------------------------
if command -v fzf &>/dev/null; then
    eval "$(fzf --zsh)"
fi

# ----------------------------
# zoxide
# ----------------------------
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
fi

# ----------------------------
# fastfetch
# ----------------------------
if command -v fastfetch &>/dev/null && [[ -f "$HOME/.config/fastfetch/ascii.txt" ]]; then
    fastfetch -l "$HOME/.config/fastfetch/ascii.txt"
fi

eval "$(tmuxifier init -)"

# ----------------------------
# NVIDIA fix for GLFW / Waywall
# ----------------------------
# if [[ -n "$NVIDIA_VISIBLE_DEVICES" ]] || command -v nvidia-smi &>/dev/null; then
#     export __GL_THREADED_OPTIMIZATIONS=0
# fi

# Add custom PATH entries
# export PATH="$HOME/Desktop/MCSR/waywall/build/waywall:$PATH"
