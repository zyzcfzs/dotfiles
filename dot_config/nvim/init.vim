let mapleader = " "
" Manage Plugins
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/plugin-settings.vim
source ~/.config/nvim/options.vim
source ~/.config/nvim/command.vim
source ~/.config/nvim/maps.vim
" Autocommands
augroup vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    autocmd VimEnter * setlocal formatoptions-=cro
    autocmd Filetype html,xml,xhtml,tex,latex,markdown,text,initex,plaintex,yaml,toml setlocal spell
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({timeout=250})
    " Setup formatexpr specified filetype(s).
    autocmd FileType javascript,typescript,json setlocal formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END
