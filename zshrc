#
# .zshrc
# 	edited by Maxence Jacques de Dixmude
#

# Enable colors
autoload -U colors && colors

# Completion
autoload -Uz compinit
compinit -i -C
zmodload -i zsh/complist
setopt completealiases
setopt always_to_end
setopt complete_in_word
setopt list_ambiguous

# Improve autocompletion
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:::::' completer _expand _complete _ignored _approximate

# Bell
unsetopt beep
unsetopt list_beep

# History
HISTFILE=~/.zsh_history
HISTSIZE=2048
SAVEHIST=2048
setopt append_history
setopt hist_ignore_all_dups
unsetopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history

# Options
setopt auto_cd
setopt auto_list
setopt auto_menu
setopt interactive_comments

at_normal=$'\e[0m'
at_italics=$'\e[3m'

# Prompt
#PROMPT='%{${at_italics}%}➤  %{${at_normal}%}'
setopt PROMPT_SUBST
_setup_ps1() {
	if [ $SSH_CLIENT ]; then
		SSH="%{$fg[magenta]%}%n%{${at_normal}%} at %M:"
	else
		SSH=""
	fi
	#PS1='%B%3~%b %(?.%{$fg[green]%}.%{$fg[red]%})%{${at_italics}%}➤  %{$reset_color%}'
	PS1='$SSH%B%(4~|%-1~/../%2~|%3~)%b %(?.%{$fg[green]%}.%{$fg[red]%})%{${at_italics}%}➤  %{$reset_color%}'
}
_setup_ps1

# Aliases
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -lAG'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin'
alias mkcd='f() { mkdir $1 && cd $1 }; f'

alias code='open -a "Visual Studio Code"'

function delete() {
	if [ -d "$HOME/.Trash" ]; then
		mv $@ "$HOME/.Trash"
	else
		rm -rf $@
	fi
}

# EOF