#!/bin/bash
set -Eeuxo pipefail
function common_set_up() {
    if [[ ! -f ~/.config/antigen.zsh ]]; then
        curl -L https://git.io/antigen > ~/.config/antigen.zsh
    fi
    if [[ ! -d ~/.oh-my-zsh ]]; then
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        source ~/.zshrc
    fi
    if [[ ! -d ~/.tmux/plugins/tpm ]]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        ~/.tmux/plugins/tpm/scripts/install_plugins.sh
    fi
    if [[ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]]; then
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        nvim -c 'PlugInstall'
    fi
}
if [[ "$(which pacman)" =~ ^.*pacman$ ]]; then 
    sudo pacman -Syyu && sudo pacman --needed -S xclip nodejs npm alacritty neovim curl wget aria2 tmux zsh ripgrep bat zoxide fzf exa picom nitrogen qtile && common_set_up
elif [[ "$(which apt)" =~ ^.*apt$ ]]; then 
    sudo apt update && sudo apt dist-upgrade -y && sudo apt install -y xclip nodejs npm zsh tmux curl wget aria2 fzf bat ripgrep neovim tmux exa picom nitrogen zoxide && common_set_up
fi
