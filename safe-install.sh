#!/bin/sh

#remember to install (vim vifm picom fish i3 tmux)
#you can use (sudo apt install vim vifm picom fish i3 tmux)
#this configuration uses xterm as primary terminal with gruvbox like colorscheme
#some apps needs other apps like vifm which you can find in vifmrc in programs section

#set TERM variable to screen-256color (xterm-256color in case you use xterm)

cp -n .vimrc $HOME
cp -n vifmrc $HOME/.config/vifm/
cp -n picom.conf $HOME/.config
cp -n config.fish $HOME/.config/fish
cp -n -r i3/ $HOME/.config
cp -n -r i3status/ $HOME/.config
cp -n .bashrc $HOME
cp -n .tmux.conf $HOME
cp -n -r oh-my-posh-theme/ $HOME/.config/

#uncomment if you use xterm as your terminal
#xrdb -merge .Xresources

#compile main.cpp in exists as exists (g++ main.cpp -o exists)
#compile main.cpp in git-branch as git-prompt (used by config.fish)
#install both of them to /usr/local/bin (you can uncomment the 2 lines under this one)
#install exists \usr\loca\bin
#install git-prompt \usr\loca\bin

#if you have oh my posh
#cp -n -r oh-my-posh-theme $HOME/.config/

