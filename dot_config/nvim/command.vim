if !exists('g:vscode')
    if (has('unix') && !has('win32unix'))
        command! W :w !sudo tee > /dev/null %
    endif
    command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, 
                \ {'options': [ '--bind', 'ctrl-j:preview-down,ctrl-k:preview-up', '--preview':'bat {}']}, <bang>0)
    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocActionAsync('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
endif
command! RemoveColorCodes :%s/\%x1b\[[0-9;]*m//g
