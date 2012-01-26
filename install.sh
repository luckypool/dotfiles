#!/bin/sh
for dotfiles in .?*
do
	if [ $dotfiles != '..' ] && [ $dotfiles != '.git' ]
	then
		ln -Fisv "$PWD/$dotfiles" $HOME
	fi
done

