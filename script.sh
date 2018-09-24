#!/bin/bash

VIMRC=.vimrc
ZSHRC=.zshrc
BACKUPDIR=Backup
COLOiRRED="\033[31m"
COLORGREEN="\033[32m"
COLOREDEND="\033[0m"
INTRA="42.us.org"

# Install brew
if [ ! -d $HOME/.brew ]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Create backup folder
[[ -d dir ]] || mkdir .macOS/$BACKUPDIR/

# VIM

printf "VIM Prefrences\n"
if [ -f $VIMRC ]; then
	printf "Backup your $VIMRC"
	mv $VIMRC .macOS/$BACKUPDIR/$VIMRC
	printf "$COLORGREEN\tDone!$COLOREDEND\n"
fi

ln -s .macOS/vim/vimrc $VIMRC

# ZSHRC

# Add them

if [[ $HOSTNAME = *$INTRA* ]] &&  [ ! -d $ZSH/themes/spaceship-prompt ]; then
	git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/themes/spaceship-prompt"
	ln -s "$ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme"
else
	if [ -d .npm ]; then
		npm install -g spaceship-prompt
	else
		brew install npm
		npm install -g spaceship-prompt
		npm uninstall npm -g
		rm -rf /usr/local/{lib/node{,/.npm,_modules},bin,share/man}/npm*
	fi
fi

printf "ZSH Prefrences\n"
if [ -f $ZSHRC ]; then
	printf "Backup your $ZSHRC"
	mv $ZSHRC .macOS/$BACKUPDIR/$ZSHRC
	printf "$COLORGREEN\tDone!$COLOREDEND\n"
fi

if [[ $HOSTNAME = *$INTRA* ]]; then
	ln -s .macOS/zsh/zshrc42 $ZSHRC
else
	ln -s .macOS/zsh/zshrc $ZSHRC
fi

# iTerm

# Add the fonts
git clone https://github.com/powerline/fonts.git --depth=1
sh fonts/install.sh ; rm -rfR fonts
