README
====

### 1) Making symbolic link of dotfile to your home directory

run shell script

```bash
./install.sh
```
### 2) install neobundle
 
```bash
git clone git://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
```

then, run vim, and do `:NeoBundleInstall` 

### 3) [optional] clone 'snippets' and 'dict' files for neocomplcache

* clone snippet files

```bash
git clone git@gist.github.com:afecd4b6cb37eb24e4c4.git ~/.vim/snippets
```

* clone dict files

```bash
git clone git@gist.github.com:5c498d514369dcac962b.git ~/.vim/dict
```
