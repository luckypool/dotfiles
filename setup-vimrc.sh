#!/bin/bash

DIRS=".vim .vim/backup .vim/swp .vim/snippets .vim/dict"

for dir in $DIRS; do
    if [ -d "$HOME/$dir" ]; then
        rm -rf "$HOME/$dir"
    fi
    mkdir "$HOME/$dir"
done

git clone https://github.com/Shougo/neobundle.vim.git "$HOME/.vim/bundle/neobundle.vim"
git clone https://gist.github.com/afecd4b6cb37eb24e4c4.git "$HOME/.vim/snippets"
git clone https://gist.github.com/5c498d514369dcac962b.git "$HOME/.vim/dict"

vim \
    -N \
    -u ~/.vimrc \
    -c "try | NeoBundleUpdate! $* | finally | qall! | endtry" \
    -U NONE \
    -i NONE \
    -V1 \
    -e \
    -s

exit 0
