#!/bin/bash

clone() {
  repo=$1
  directory=$2

  if [ -d "$directory" ]; then
    return
  fi

  git clone "$repo" "$directory"
}

createSymlink() {
  if [ -e ~/.vimrc ]; then
    echo "~/.vimrc exists, so symlink will not be created"
    return
  fi

  ln -s "$PWD/.vimrc" ~/.vimrc
}

run() {
  clone git@github.com:fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
  clone git@github.com:scrooloose/nerdtree.git ~/.vim/pack/dist/start/nerdtree
  clone git@github.com:ryanoasis/vim-devicons.git ~/.vim/pack/plugins/start/vim-devicons
  clone git@github.com:vim-airline/vim-airline.git ~/.vim/pack/dist/start/vim-airline
  clone git@github.com:vim-airline/vim-airline-themes.git ~/.vim/pack/dist/start/vim-airline-themes
  clone git@github.com:tpope/vim-fugitive.git ~/.vim/pack/dist/start/vim-fugitive
  clone git@github.com:wakatime/vim-wakatime.git ~/.vim/pack/plugins/start/vim-wakatime
  clone git@github.com:isobit/vim-caddyfile.git ~/.vim/pack/plugins/start/vim-caddyfile
  
  createSymlink
}

run
