README
====

### install

clone

```
cd
git clone git@github.com:luckypool/dotfiles.git .dotfiles
```

install prezto see [prezto/README.md](https://github.com/sorin-ionescu/prezto/blob/master/README.md)

```
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

Do re-open new zsh terminal.


### Making symbolic link of dotfile to your home directory

run shell script

```bash
sh ./install-dotfiles.sh
```

### 2) setup vimrc

run shell script

```bash
sh ./setup-vimrc.sh
```
