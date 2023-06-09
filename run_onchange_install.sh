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
    curl https://gist.githubusercontent.com/zyzcfzs/33e7940448456aafc8c7973fdb886a2c/raw/d25cab7f91e655c8a52fd065eb8f38d37c65b349/.vimrc > ~/.vimrc
}
if [[ "$(which pacman >/dev/null; echo -n $?)" == "0" ]]; then 
    sudo pacman -Syyyu && sudo pacman --needed -S fd xclip nodejs npm alacritty curl wget aria2 tmux zsh ripgrep bat zoxide fzf exa yarn
elif [[ "$(which apt >/dev/null; echo -n $?)" == "0" ]]; then 
    sudo apt update && sudo apt dist-upgrade -y && sudo apt install -y fd-find xclip nodejs npm zsh tmux curl wget aria2 fzf bat ripgrep tmux exa zoxide
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
