#!/usr/bin/env bash

packages=(
    git
    zsh
    zsh-syntax-highlighting
    zsh-autosuggestions
    tmux
    fd
    fzf
    rg
    cmake
    bat
    nvim
)
sudo dnf dsync -y
sudo dnf install "${packages[*]}" -y

mkdir -p ~/.local/bin ~/.config

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl \
    https://raw.githubusercontent.com/danblok/config/refs/heads/main/.gitconfig -o ~/.gitconfig \
    https://raw.githubusercontent.com/danblok/config/refs/heads/main/tmux/tmux.conf -o ~/.tmux.conf \
    https://raw.githubusercontent.com/danblok/config/refs/heads/main/.zshrc -o ~/.zshrc

git clone --branch=v3 --depth=1 git@github.com:danblok/nvim-config.git ~/.config/nvim
