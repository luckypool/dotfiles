#!/bin/sh
cd "$(dirname "$0")"
for dotfiles in .?*
do
	if [ $dotfiles != '..' ] && [ $dotfiles != '.git' ]
	then
        cp $HOME/$dotfiles $HOME/$dotfiles.old
		ln -Fisv "$PWD/$dotfiles" $HOME
	fi
done

