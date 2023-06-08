#!/bin/bash
set -Eeuxo pipefail
function common_set_up() {
    if [[ ! -f ~/.config/antigen.zsh ]]; then
        curl -L https://git.io/antigen > ~/.config/antigen.zsh
    fi
    if [[ ! -d ~/.tmux/plugins/tpm ]]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        echo 'Use Ctrl + z + I to Install tmux packages'
    fi
    if [[ ! -d ~/.oh-my-zsh ]]; then
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
    curl https://raw.githubusercontent.com/zyzcfzs/dotfiles/main/dot_zshrc > ~/.zshrc
}
if [[ "$(which pacman >/dev/null; echo -n $?)" == "0" ]]; then 
    sudo pacman -Syyu && sudo pacman --needed -S fd xclip nodejs npm alacritty curl wget aria2 tmux zsh ripgrep bat zoxide fzf exa picom nitrogen yarn
elif [[ "$(which apt >/dev/null; echo -n $?)" == "0" ]]; then 
    sudo apt update && sudo apt dist-upgrade -y && sudo apt install -y fd-find xclip nodejs npm zsh tmux curl wget aria2 fzf bat ripgrep tmux exa picom nitrogen zoxide
    if [[ "$(which yarn >/dev/null; echo -n $?)" != "0" ]]; then 
        sudo npm install -g yarn
    fi
    if [[ "$(which batcat >/dev/null; echo -n $?)" == "0" ]]; then 
        sudo mv $(which batcat) $(dirname $(which batcat))"/bat"
    fi
    if [[ "$(which fdfind >/dev/null; echo -n $?)" == "0" ]]; then 
        sudo mv $(which fdfind) $(dirname $(which fdfind))"/fd"
    fi
fi
common_set_up
