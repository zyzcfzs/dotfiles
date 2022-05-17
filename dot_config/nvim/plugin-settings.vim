if !exists('g:vscode')
    """ Coc Config """
    let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-json', 'coc-css', 'coc-emmet', 
                \'coc-explorer', 'coc-sh', 'coc-marketplace', 'coc-vimlsp', 'coc-pairs',
                \'coc-xml', 'coc-yaml' , 'coc-pyright' , 'coc-html', 'coc-snippets']
    " Set color scheme
    colorscheme dracula
    " Define variables
    let g:auto_save = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1 
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    let g:airline_section_c='%f    %{strftime("%c")}'
    let g:prettier#exec_cmd_async = 1
    let g:vim_markdown_folding_disabled = 1
    let g:vim_markdown_toc_autofit = 1
    let g:vim_markdown_autowrite = 1
    let g:vim_markdown_math = 1
    let g:vim_markdown_frontmatter = 1
    let g:vim_markdown_strikethrough = 1
    let g:vim_markdown_no_extensions_in_markdown = 1
    let g:mkdp_auto_start = 1
    let g:mkdp_port = '54730'
endif
let g:qs_buftype_blacklist = ['terminal', 'nofile']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
