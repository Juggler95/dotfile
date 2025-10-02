# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'

 See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
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
