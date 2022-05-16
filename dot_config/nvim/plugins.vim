function! Condition(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin()
if exists('g:vscode')
    Plug 'justinmk/vim-sneak'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'unblevable/quick-scope'   
else
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'justinmk/vim-sneak'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'godlygeek/tabular' 
    Plug 'plasticboy/vim-markdown'
    Plug 'voldikss/vim-floaterm'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ap/vim-css-color'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug '907th/vim-auto-save'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'unblevable/quick-scope'   
    Plug 'github/copilot.vim'
    Plug 'honza/vim-snippets'
    Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
endif
Plug 'easymotion/vim-easymotion', Condition(!exists('g:vscode'))
Plug 'asvetliakov/vim-easymotion', Condition(exists('g:vscode'), { 'as': 'vsc-easymotion' })
call plug#end()

