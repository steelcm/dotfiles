#!/usr/bin/env zsh

STOW_FOLDERS="nvim,zsh,kitty"
DOT_FILES=$HOME/.dotfiles

pushd $DOT_FILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    stow -D $folder
    stow -v $folder
done
popd
