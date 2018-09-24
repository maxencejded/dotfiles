#
# ZSHRC for macOS (edited by Maxence Jacques de Dixmude)
# => https://blog.callstack.io/supercharge-your-terminal-with-zsh-8b369d689770
#

# Enable autocompletions
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
	compinit -i
else
	compinit -C -i
fi
#zmodload -i zsh/complist # Complete list of possibilities

# Save history so we get auto suggestions
HISTFILE=$HOME/.zsh_history
HISTSIZE=200
SAVEHIST=$HISTSIZE

# Options
setopt auto_cd
setopt auto_list
setopt auto_menu
setopt always_to_end
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history
setopt correct_all
setopt interactive_comments

# Improve autocompletion style
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

# Theme (https://denysdovhan.com/spaceship-prompt/)
SPACESHIP_PROMPT_ORDER=(
	user          # Username section
	dir           # Current directory section
	host          # Hostname section
	git           # Git section (git_branch + git_status)
	docker        # Docker section
	exec_time     # Execution time
	#line_sep      # Line break
	vi_mode       # Vi-mode indicator
	jobs          # Background jobs indicator
	exit_code     # Exit code section
	char          # Prompt character
)

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="➤  "
#SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_DIR_TRUNC=1
#SPACESHIP_DIR_SUFFIX='\e[36m%B/%b '

# Simplify prompt if we're using Hyper
if [[ "$TERM_PROGRAM" == "Hyper" ]]; then
	SPACESHIP_PROMPT_SEPARATE_LINE=false
	SPACESHIP_DIR_SHOW=false
	SPACESHIP_GIT_BRANCH_SHOW=false
fi

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Set color for 'ls'
alias ls='ls -G'

# Plugin
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

echo "\e[1mWelcome \e[92m${USER}!\e[8m\e[0m Make great code today"
