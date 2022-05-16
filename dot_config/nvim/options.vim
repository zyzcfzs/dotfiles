if !exists("g:vscode")
    set exrc
    set title " change title of the current tty
    set cursorline
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set smartindent
    set smartcase
    set expandtab
    set mouse=a " enable mouse support
    set number
    set visualbell
    set spelllang=en_ca,en_us,en_gb
    if (has('win32'))
        set shell=pwsh\ -NoLogo\ -NoProfile
    endif
    " use system clipboard if supported
    if (has('clipboard'))
        set clipboard+=unnamedplus
    endif
    set cmdheight=2
    set shortmess+=c
    if has("nvim-0.5.0") || has("patch-8.1.1564")
      set signcolumn=number
    else
      set signcolumn=yes
    endif
    set conceallevel=1
endif
set path+=**
set timeoutlen=3000
set ttimeoutlen=100
set updatetime=300
set textwidth=1000
set lazyredraw " increase proformance on redraw when execute macros
set splitbelow
set splitright
set nrformats+=alpha
set modelines=0 " Security
set nowrap
set showmatch
set pastetoggle=<F3>
set wildmode=list:longest,full
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.pptx,*/.git/*,*/.svn/*,*/node_modules/**,*.DS_STORE,*.db
