if exists('g:vscode')
    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
    nnoremap <Leader>d <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
    xnoremap <Leader>d <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
else
    inoremap <silent> jj <Esc>
    imap <c-_> <Esc>gcc`]i
    " auto fix the spelling of the words
    inoremap <silent> <c-s> <c-g>u<Esc>[s1z=`]a<c-g>u 
    imap <silent> <C-j> <C-o>o
    noremap <c-q> <c-w>
    noremap <c-k> <c-w>k
    noremap <c-j> <c-w>j
    noremap <c-h> <c-w>h
    noremap <c-l> <c-w>l
    nnoremap <Leader>q <c-w>q
    nnoremap <silent> <Leader>mh :resize<CR>
    nnoremap <Leader>mv <c-w><BAR>
    nnoremap <Leader>E <c-w>=
    nnoremap <Leader>H :split<CR>
    nnoremap <Leader>V :vsplit<CR>
    " buffers keybindings
    nnoremap <silent> <Leader>bn :bnext<CR>
    nnoremap <silent> <Leader>bp :bprevious<CR>
    nnoremap <silent> <Leader>bc :bdelete<CR>
    nnoremap <silent> <Leader>bb :ls<CR>
    nnoremap <silent> <Leader>bl :blast<CR>
    nnoremap <silent> <Leader>bf :bfirst<CR>
    nnoremap <silent> <Leader>bv :vertical ball<CR>
    nnoremap <silent> <Leader>bt :tab ball<CR>
    " tabs keybindings
    nnoremap <silent> <Leader>tt :tabs<CR>
    nnoremap <silent> <Leader>to :tabonly<CR>
    nnoremap <silent> <Leader>tf :tabfirst<CR>
    nnoremap <silent> <Leader>tl :tablast<CR>
    nnoremap <silent> <Leader>tc :tabclose!<CR>
    nnoremap <silent> <Leader>tn :tabnew<CR>
endif
" normal mode mappings
nnoremap go o<Esc>
nnoremap gO O<Esc>
nnoremap * *N
nnoremap Y y$
nnoremap <silent> <Leader>n :nohlsearch<CR>

" Fix indendtations on visual mode
vmap < <gv
vmap > >gv

if !exists("g:vscode")
    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : CheckBackspace() ? "\<TAB>" : coc#refresh()
    inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gdt <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    nmap <Leader>f <Plug>(Prettier)
    xmap <Leader>f <Plug>(Prettier)
    " Symbol renaming.
    nmap <F2> <Plug>(coc-rename)
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <Leader>af  <Plug>(coc-fix-current)

    " Run the Code Lens action on the current line.
    nmap <leader>cl  <Plug>(coc-codelens-action)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Remap <C-f> and <C-b> for scroll float windows/popups.
    if has('nvim-0.4.0') || has('patch-8.2.0750')
      nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
      inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
      inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
      vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif
    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of language server.
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)
    
    " Coc explorer
    nmap <Leader>d <Cmd>CocCommand explorer<CR>
    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <Leader>cd  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <Leader>ce  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <Leader>cc  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <Leader>co  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <Leader>cs  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <Leader>cn  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <Leader>cp  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <Leader>cr  :<C-u>CocListResume<CR>
endif
