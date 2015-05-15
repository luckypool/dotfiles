README
====

### Prepare zsh & prezto


```
zsh
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

### Cloen repo

```
cd
git clone git@github.com:luckypool/dotfiles.git .dotfiles
```

### Making symbolic link of dotfile to your home directory

```
cd ~/.dotfiles
```

run shell script

```bash
./install-dotfiles.sh
```

### 2) setup vimrc

run shell script

```bash
./setup-vimrc.sh
```
