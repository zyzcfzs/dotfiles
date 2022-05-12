" Define functions
function! NetrwBindings()
  nmap <buffer> <Leader>h u
  nmap <buffer> <Leader>p -
  nmap <buffer> h gh
  nmap <buffer> P <C-w>z
  " open a file and close netrw
  nmap <buffer> o <CR>:Lexplore<CR>
  nmap <buffer> <TAB> mf
  nmap <buffer> <S-TAB> mu
  " assign the target directory for move and copy commands
  nmap <buffer> <Leader>t mt
  " create a new file
  nmap <buffer> fn %:w<CR>
  " rename a file
  nmap <buffer> fr R
  " copy a file
  nmap <buffer> fc mc
  " move a file
  nmap <buffer> fm mm
  " execute a external command on a file
  nmap <buffer> fe mx
  " show target folder and use sm to list marked files
  nmap <buffer> st :echo 'Target Folder: ' . netrw#Expose("netrwmftgt")<CR>
  nmap <buffer> sm :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>
endfunction

" Initialize the buffer so the cursor is at last modifiied position
" and the cursor shape is normal.
" Do nothing is the filetype is help
function! InitBuffer()
    if (&filetype != "help")
        normal ijj
        silent! normal g;
    endif
endfunction

call plug#begin()
if exists('g:vscode')
    Plug 'justinmk/vim-sneak'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'easymotion/vim-easymotion'
else
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'justinmk/vim-sneak'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'easymotion/vim-easymotion'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ap/vim-css-color'
endif
call plug#end()

" Define variables
let mapleader = " "
let g:netrw_keepdir = 0
let g:netrw_winsize = 25
let g:netrw_banner = 0 
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" set cursor shape to be reasonable
let &t_SI = "\e[5 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[1 q"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#formatter = 'unique_tail'
" Set shells and colorscheme for windows and unix separately
if (has('win32'))
    set shell=pwsh\ -NoLogo\ -NoProfile
else
    set shell=$SHELL
endif
" if on unix, bind W to write to a readonly file
if (has('unix') && !has('win32unix'))
    command! W :w !sudo tee > /dev/null %
endif
" use system clipboard if supported
if (has('clipboard'))
    set clipboard+=unnamedplus
endif
" Set Options
colorscheme dracula
set modelines=0 " Security
set lazyredraw " increase proformance on redraw when execute macros
set ttyfast " faster rendering
set display+=lastline
set number
set path+=**
set textwidth=1000
set ignorecase
set encoding=utf-8
set fileencoding=utf-8
set cursorline
set nrformats-=octal
set viewoptions-=options
" set timeout for mapping be 2 seconds, set mappings for escape keys to be 0.1 seconds
set timeoutlen=2000
set ttimeoutlen=100
set title " change title of the current tty
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set smartcase
set expandtab
set formatoptions+=j " Delete comment character when joining commented lines
set nrformats+=alpha
set t_Co=256 " Set true colors for the terminal
set exrc
set noerrorbells
set visualbell
set nobackup
set noswapfile
set nowritebackup
set noundofile
set splitbelow
set splitright
set nowrap
set showcmd
set showmode
set showmatch
set hlsearch
set hidden
set mouse=a " enable mouse support
set updatetime=1000
set spelllang=en_ca,en_us,en_gb
set pastetoggle=<F3>
set wildmenu
set wildmode=list:longest,full
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.pptx,*/.git/*,*/.svn/*,*/node_modules/**,*.DS_STORE,*.db
set history=1000
set undolevels=250
set tabpagemax=25
" Set KeyBindings
inoremap <silent> jj <Esc>
imap <c-_> <Esc>gcc`]i
" auto fix the spelling of the words
inoremap <silent> <c-s> <c-g>u<Esc>[s1z=`]a<c-g>u 
imap <silent> <C-j> <C-o>o
if empty(mapcheck('<C-U>', 'i'))
    inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
    inoremap <C-W> <C-G>u<C-W>
endif
noremap <c-q> <c-w>
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <C-h> <c-w>h
noremap <C-l> <c-w>l
nnoremap go o<Esc>
nnoremap gO O<Esc>
nnoremap * *N
nnoremap Y y$
nnoremap <silent> <Leader>mh :resize<CR>
nnoremap <Leader>mv <c-w><BAR>
nnoremap <silent> <Leader>n :nohlsearch<CR>
nnoremap <Leader>q <c-w>q
nnoremap <Leader>sv <c-w>v
nnoremap <Leader>sh <c-w>s
nnoremap <Leader>se <c-w>=
nnoremap <c-s> 1z=

" tabs keybindings
nnoremap tn gt
nnoremap tp gT
nnoremap <silent> tt :tabs<CR>
nnoremap <silent> to :tabonly<CR>
nnoremap <silent> tf :tabfirst<CR>
nnoremap <silent> tl :tablast<CR>
nnoremap <silent> nt :tabnew<CR>

" buffers keybindings
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bp :bprevious<CR>
nnoremap <silent> <Leader>bd :bdelete<CR>
nnoremap <silent> <Leader>bb :ls<CR>
nnoremap <silent> <Leader>bl :blast<CR>
nnoremap <silent> <Leader>bf :bfirst<CR>
nnoremap <silent> <Leader>bv :vertical ball<CR>
nnoremap <silent> <Leader>bt :tab ball<CR>

" terminal keybindings
map <Leader>t :term<cr>i
tmap <Leader>t <c-w>:term<cr>i
map <Leader>T :tab term<cr>i
tmap <Leader>T <c-w>:tab term<cr>i
tmap <c-q> <c-w>
tnoremap <Leader>q <C-\><C-n>:q!<CR>
tmap <c-j> <c-w>j
tmap <c-k> <c-w>k
tmap <c-h> <c-w>h
tmap <c-l> <c-w>l
" toggle auto commenting
nnoremap <expr> <Leader>c stridx(&formatoptions, "cro") > -1 ? ':set formatoptions-=cro<CR>' : ':set formatoptions+=cro<CR>'
" toggle spell check
nnoremap <expr> <Leader>sc &spell == 0 ? ':set spell<CR>' : ':set nospell<CR>'
nnoremap <silent> <Leader>d :Lexplore<CR>
" open netrw on the directory of the currently opened file
nnoremap <silent> <Leader>D :Lexplore %:p:h<CR>

" Autocommands
augroup vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    autocmd Filetype netrw call NetrwBindings()
    autocmd Filetype html,xml,xhtml,tex,latex,markdown,text,initex,plaintex,yaml,toml setlocal spell
augroup END

" Custom commands
command! RemoveColorCodes :%s/\%x1b\[[0-9;]*m//g
