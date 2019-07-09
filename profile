PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

__prompt_command() {
    local EXIT="$?"             # This needs to be first
    local RCol='\[\e[0m\]'
    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[38;5;57m\]'
    local Pur='\[\e[0;35m\]'

    PS1="${BBlu}\w ${RCol}"
    if [ $EXIT != 0 ]; then
        PS1+="${Red}\$${RCol}"      # Add red if exit code non 0
    else
        PS1+="${Gre}\$${RCol}"
    fi

    PS1+=" ${RCol}"
}

export HISTCONTROL=ignorespace:ignoredups
export HISTSIZE=500

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
