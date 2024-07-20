#!/bin/sh

# remember to install (vim vifm picom fish i3 tmux)
# you can use (sudo apt install vim vifm picom fish i3 tmux)
# this configuration uses xterm as primary terminal with gruvbox like colorscheme
# some apps needs other apps like vifm which you can find in vifmrc in programs section
  
# set TERM variable to screen-256color (xterm-256color in case you use xterm)
# ftplugin depends on some programs as (pdflatex (tex files) and pandoc (for markdown) )
 
# if you know what to do, it's better to configure your system with the help of these files (not install scripts)

cp .vimrc .bashrc .tmux.conf $HOME
cp vifmrc $HOME/.config/vifm/
cp config.fish $HOME/.config/fish
cp -r picom.conf i3/ i3status/ oh-my-posh-theme/ $HOME/.config
cp zathurarc $HOME/.config/zathura/
cp -r ftplugin/ $HOME/.vim/ftplugin/
cp scripts/* /usr/local/bin

#uncomment if you use xterm as your terminal
#xrdb -merge .Xresources
