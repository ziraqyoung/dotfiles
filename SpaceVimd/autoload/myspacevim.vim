function! myspacevim#before() abort
  set listchars=tab:▸\ ,eol:¬,nbsp:·
  set wrap
  set list
  set showbreak=↪
  let g:ctrlp_custom_ignore = 'public/packs*\|log\|tmp\|node_modules\|DS_Store\|\.git'
  let g:oceanic_next_terminal_italic = 1

  augroup my-glyph-palette
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType nerdtree,startify call glyph_palette#apply()
  augroup END


  imap ,, <C-y>,
  " imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

  let g:user_emmet_settings = {
  \  'javascript' : {
  \      'extends' : 'jsx',
  \  },
  \  'erb' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \ 'typescript' : {
  \     'extends' : 'jsx',
  \ },
  \}

  autocmd FileType html,css,javascriptreact,javascript.jsx,javascript EmmetInstall
  let g:user_emmet_mode='a'
  " let g:user_emmet_install_global = 0 

  imap jj <Esc>

  nmap <silent> gi <Plug>(coc-implementation)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

endf


function! myspacevim#after() abort
  set listchars=tab:▸\ ,eol:¬,nbsp:·
  set wrap
  set list
  set showbreak=↪
  let g:ctrlp_custom_ignore = 'public/packs*\|log\|tmp\|node_modules\|DS_Store\|\.git'
  hi Comment guifg=#5C6370 ctermfg=59

  augroup my-glyph-palette
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType nerdtree,startify call glyph_palette#apply()
  augroup END

  imap ,, <C-y>,
  " imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

  let g:user_emmet_settings = {
  \  'javascript' : {
  \    'extends' : 'jsx',
  \  },
  \  'erb' : {
  \     'extends' : 'html',
  \  },
  \  'haml' : {
  \   'extends' : 'html',
  \  },
  \ 'typescript' : {
  \   'extends' : 'jsx',
  \ },
  \}

  autocmd FileType html,css,javascriptreact,javascript.jsx,javascript EmmetInstall
  let g:user_emmet_mode='a'
  " let g:user_emmet_install_global = 0 

  imap jj <Esc>

  nmap <silent> gi <Plug>(coc-implementation)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

endf
