# macOS Preferences

Small list of preferences, I'll update the list as soon as I learn how to make nice scripts.

```MAKEFILE
git clone https://github.com/maxencejded/macOS.git ~/.macOS
```

## Automatic Mode
### Normal
```MAKEFILE
sh .macOS/script.sh
```
### 42 Silicon Valley
```MAKEFILE
export ZSH="$HOME/.macOS/oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sh .macOS/script.sh
```
After go to iTerm > Preferences > Profils and change the Colors Dracula and the Text > Font by `14pt
Roboto Mono for Powerline`

### Requirements
* Plugin\
-> https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md

## To Do
Make a script to automate everything
