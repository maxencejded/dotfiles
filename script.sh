#!/bin/bash

COLORRED="\033[31m"
COLORGREEN="\033[32m"
COLOREDEND="\033[0m"

# Vim
printf "Copy$COLORGREEN vim$COLOREDEND preferences files\n"
mv vim $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc

if [ "$SHELL" == "/bin/bash" ]; then
	printf "Using$COLORGREEN Bash$COLOREDEND\n"
	mv profile $HOME/.profile
else
	printf "Using$COLORGREEN Zsh$COLOREDEND\n"
	mv zshrc $HOME/.zshrc
fi

# Add the fonts
git clone https://github.com/powerline/fonts.git --depth=1
sh fonts/install.sh ; rm -rfR fonts

# EOF