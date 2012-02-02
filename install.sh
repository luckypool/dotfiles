#!/bin/sh
cd "$(dirname "$0")"
for dotfiles in .?*
do
	if [ $dotfiles != '..' ] && [ $dotfiles != '.git' ]
	then
		ln -Fisv "$PWD/$dotfiles" $HOME
	fi
done

