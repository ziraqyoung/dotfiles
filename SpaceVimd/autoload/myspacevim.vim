function! myspacevim#before() abort
  set listchars=eol:¬,nbsp:·
  set wrap
  set list

  let g:ctrlp_custom_ignore = 'public/packs*\|log\|tmp\|node_modules\|DS_Store\|\.git'

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

  let g:oceanic_material_background = 'medium' " medium, ocean, deep, darker
	let g:oceanic_material_allow_bold = 1
	let g:oceanic_material_allow_italic = 1

  let g:gruvbox_material_enable_italic = 1
  let g:gruvbox_material_background = 'soft' " soft, hard, medium(default)
  let g:gruvbox_material_enable_bold = 1

  let g:material_terminal_italics = 1
  let g:material_theme_style = 'default-community' " darker, lighter, default, ocean, palenight, palenight-community


  let g:edge_style = 'aura' " default, aura, neon
  let g:edge_enable_italic = 1

  let g:sonokai_style = 'maia' " shusia, maia, espresso, default, atlantis, andromeda
  let g:sonokai_enable_italic = 1

  " highlight ALEError ctermbg=none ctermfg=none
  " highlight ALEWarning ctermbg=none ctermfg=none

  let g:ale_set_signs = 1
  let g:ale_set_highlights = 0

  highlight ALEError ctermbg=NONE ctermfg=none
  highlight ALEWarning ctermbg=NONE ctermfg=none
	highlight ALEErrorSign ctermbg=NONE ctermfg=red
	highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

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
  set listchars=eol:¬,nbsp:·
  set wrap
  set list

  hi Comment guifg=#5C6370 ctermfg=59

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

  imap ,, <C-y>,
  " imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

  " hi LineNr ctermbg=NONE guibg=NONE

  " let g:ale_sign_error = "◉"
	" let g:ale_sign_warning = "◉"

  let g:ale_set_signs = 1
  let g:ale_set_highlights = 0

  highlight Visual term=bold cterm=bold ctermbg=NONE ctermfg=NONE guibg=Grey40
  " highlight Visual term=bold cterm=bold ctermfg=NONE guibg=Grey40
  hi MatchWord ctermfg=NONE cterm=underline gui=underline

  highlight ALEError ctermbg=NONE ctermfg=none
  highlight ALEWarning ctermbg=NONE ctermfg=none
	highlight ALEErrorSign ctermbg=NONE ctermfg=red
	highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

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
