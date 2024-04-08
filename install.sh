#!/bin/sh

#remember to install (vim vifm picom fish i3 tmux)
#you can use (sudo apt install vim vifm picom fish i3 tmux)
#this configuration uses xterm as primary terminal with gruvbox like colorscheme
#some apps needs other apps like vifm which you can find in vifmrc in programs section

cp .vimrc $HOME
cp vifmrc $HOME/.config/vifm/
cp picom.conf $HOME/.config
cp config.fish $HOME/.config/fish
cp -r i3/ $HOME/.config
cp -r i3status/ $HOME/.config
cp .bashrc $HOME
cp .tmux.conf $HOME

xrdb -merge .Xresources
