#!/bin/bash
set -Eeuxo pipefail
if [[ $(which pacman) =~ "^/(usr|bin).*$" ]]; then 
    sudo pacman -Syyu && sudo pacman --needed -S alacritty neovim curl wget arai2 tmux zsh ripgrep bat fd zoxide fzf exa picom nitrogen 
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    curl -L https://git.io/antigen > ~/.config/antigen.zsh
    source ~/.zshrc
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
elif [[ $(which apt) =~ "^/(usr|bin).*$" ]]; then 
    sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && apt install -y zsh tmux curl wget aria2 fzf bat ripgrep neovim tmux exa picom nitrogen zoxide
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    curl -L https://git.io/antigen > ~/.config/antigen.zsh
    source ~/.zshrc
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
    


