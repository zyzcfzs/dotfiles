#!/bin/bash
set -Eeuxo pipefail
if [[ "$(which pacman)" =~ ^.*pacman$ ]]; then 
    sudo pacman -Syyu && sudo pacman --needed -S nodejs npm alacritty neovim curl wget arai2 tmux zsh ripgrep bat zoxide fzf exa picom nitrogen 
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    curl -L https://git.io/antigen > ~/.config/antigen.zsh
    source ~/.zshrc
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
elif [[ "$(which apt)" =~ ^.*apt$ ]]; then 
    sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && apt install -y nodejs npm zsh tmux curl wget aria2 fzf bat ripgrep neovim tmux exa picom nitrogen zoxide
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    curl -L https://git.io/antigen > ~/.config/antigen.zsh
    source ~/.zshrc
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
    


