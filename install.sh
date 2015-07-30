#! /bin/bash

ln -s conkyrc ~/.conkyrc
ln -s tmux.conf ~/.tmux.conf
ln -s vim ~/.vim
ln -s vim/vimrc ~/.vimrc
ln -s xinitrc ~/.xinitrc
ln -s Xresources ~/.Xresources
ln -s zshrc ~/.zshrc
ln -s ncmpcpp ~/.nmcpcpp

if [ ! -d "$HOME/.config" ]; then
	mkdir ~/.config
fi

ln -s i3 ~/.config/i3
ln -s mpd ~/.config/mpd
ln -s touchegg ~/.config/touchegg
