#
# .profile
# 	edited by Maxence Jacques de Dixmude
#

local RCol='\[\e[0m\]'
local Red='\[\e[0;31m\]'
local Gre='\[\e[0;32m\]'
local BBlu='\[\e[38;5;57m\]'
local Pur='\[\e[0;35m\]'
local Bold='\[\e[1m\]'

__prompt() {
	local EXIT="$?"

	PS1="${Bold}${BBlu}\w ${RCol}"
	if [ $EXIT != 0 ]; then
		PS1+="${Red}➤ ${RCol}"
	else
		PS1+="${Gre}➤ ${RCol}"
	fi

	PS1+=" "
}

PROMPT_COMMAND=__prompt

# History
export HISTCONTROL=ignorespace:ignoredups
export HISTSIZE=2048

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# EOF