#!/bin/bash

VIMRC=.vimrc
COLOiRRED="\033[31m"
COLORGREEN="\033[32m"
COLOREDEND="\033[0m"

# vim
printf "VIM Prefrences\n"
if [ -f $VIMRC ]; then
	printf "Backup your $VIMRC"
	mv $VIMRC "$VIMRC"_old
	printf "$COLORGREEN\tDone!$COLOREDEND\n"
fi

mv .macOS/vim ~/.vim
ln -s .vim/vimrc $VIMRC

# Add the fonts
git clone https://github.com/powerline/fonts.git --depth=1
sh fonts/install.sh ; rm -rfR fonts
