# dotfiles

## Setup a fresh bare repo

```sh
git init --bare $HOME/dotfiles

alias dotgit="git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
dotgit config --local status.showUntrackedFiles no
dotgit remote add origin git@github.com:lopez-brau/dotfiles.git
```

## Cloning on a new machine

```sh
git clone \
    --separate-git-dir=$HOME/dotfiles \
    git@github.com:lopez-brau/dotfiles.git \
    dotfiles-tmp
rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
rm -rf dotfiles-tmp
```
