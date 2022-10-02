# Luke's config for the Zoomer Shell

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/prompt/multiline.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/prompt/multiline.zsh"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/prompt/git-prompt.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/prompt/git-prompt.zsh"
#PS1="
#%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}
#$%b "
#PS1="%B%{$fg[red]%}[ %{$fg[yellow]%}%n%{$fg[blue]%}@%{$fg[green]%}%M %{$fg[magenta]%}%~%{$fg[red]%} ]%{$reset_color%}$%b "
## PS1="%B%{$fg[magenta]%} %~%{$fg[red]%} >%{$reset_color%}%b "

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^F' history-incremental-pattern-search-forward

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'
bindkey -s '^a' 'bc -l\n'
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
bindkey '^[[P' delete-char

bindkey -s '^P' '$(fzf-tmux)\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# load asdf cf. https://asdf-vm.com/
[ -f "${ASDF_DATA_DIR:-$HOME/.local/share/asdf}/asdf.sh" ] && {
        echo "Load asdf..."
        source "${ASDF_DATA_DIR:-$HOME/.local/share/asdf}/asdf.sh"
        fpath=(${ASDF_DIR}/completions $fpath) }

echo "Load completions..."
fpath=(${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins/zsh-completions/src $fpath)
fpath=(${XDG_CONFIG_HOME:-$HOME/.config}/zsh/completions $fpath)
fpath=(/data/data/com.termux/files/usr/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit
clear
# Load fzf
source /data/data/com.termux/files/usr/share/doc/fzf/key-bindings.zsh 2>/dev/null
source /data/data/com.termux/files/usr/share/doc/fzf/completion.zsh 2>/dev/null
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/fzf-extra.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/fzf-extra.zsh"
# Load fzf history
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins/zsh-fzf-history-search/zsh-fzf-history-search.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins/zsh-fzf-history-search/zsh-fzf-history-search.zsh" 2>/dev/null
# Load fish autosuggestions
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" 2>/dev/null
# Load syntax highlighting; should be last.
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 2>/dev/null
