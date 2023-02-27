function! myspacevim#before() abort
  " set listchars=eol:¬,nbsp:·
  set wrap
  set list

  hi Comment guifg=#5C6370 ctermfg=59

  let g:ctrlp_custom_ignore = 'public/packs*\|log\|tmp\|node_modules\|DS_Store\|\.git'

  " imap ,, <C-y>,
  " imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
  " let g:user_emmet_settings = {
  " \  'javascript' : {
  " \      'extends' : 'jsx',
  " \  },
  " \  'eruby' : {
  " \    'extends' : 'html',
  " \  },
  " \  'erb' : {
  " \    'extends' : 'html',
  " \  },
  " \  'haml' : {
  " \    'extends' : 'html',
  " \  },
  " \ 'typescript' : {
  " \     'extends' : 'jsx',
  " \ },
  " \}
  " autocmd FileType html,eruby,erb,css,javascriptreact,javascript.jsx,javascript EmmetInstall
  " let g:user_emmet_mode='a'
  " let g:user_emmet_install_global = 0
 
  " https://github.com/ms-jpq/coq_nvim
  " let g:coq_settings = { 'auto_start': 'shut-up' }

  imap jj <Esc>

  let g:vimwiki_listsyms = '✗○◐●✓'

  let g:oceanic_material_background = 'medium' " medium, ocean, deep, darker
	let g:oceanic_material_allow_bold = 1
	let g:oceanic_material_allow_italic = 1

  let g:catppuccin_flavour = "frappe" " latte, frappe, macchiato, mocha

  let g:gruvbox_material_enable_italic = 1
  let g:gruvbox_material_background = 'hard' " soft, hard, medium(default)
  let g:gruvbox_material_enable_bold = 1

  let g:tokyodark_enable_italic_comment = 1
  let g:tokyodark_enable_italic = 1
  let g:tokyodark_color_gamma = "1.0"

  let g:material_theme_style = 'palenight' " darker, lighter, default, ocean, palenight, palenight-community
  let g:material_terminal_italics = 1

  let g:material_style = 'palenight' " 'darker', 'lighter', 'oceanic', 'palenight', 'deep ocean'

  let g:newpaper_style = 'dark' " 'darker', 'lighter', 'oceanic', 'palenight', 'deep ocean'

  let g:aurora_italic = 1     " italic
  let g:aurora_bold = 1     " bold

  " style: dark, darker, cool, deep, warm, warmer
  let g:onedark_config = {
  \ 'style': 'cool',
  \ 'ending_tildes': v:true,
  \ 'code_style': {
    \ 'comments': 'italic',
    \ 'strings': 'italic',
    \ 'functions': 'italic',
    \ 'keywords': 'italic',
  \ },
\ }

  " style: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  let g:kimbox_config = {
    \ 'style': 'deep',
    \ 'popup': {'background': v:false},
    \ 'transparent': v:false,
    \ 'allow_bold': v:true,
    \ 'toggle_style_list': [
    \   'medium',
    \   'ocean',
    \   'vscode',
    \   'deep',
    \   'darker'
    \ ],
    \ 'toggle_style_key': '<Leader>ts',
    \ 'allow_italic': v:true,
    \ 'ending_tildes': v:true,
    \ 'allow_underline': v:false,
\ }

  let g:edge_style = 'aura' " default, aura, neon
  let g:edge_enable_italic = 1

  let g:sonokai_style = 'maia' " shusia, maia, espresso, default, atlantis, andromeda
  let g:sonokai_enable_italic = 1

  let g:srcery_italic = 1
  let g:srcery_italic_types = 1


  " let g:everforest_background = 'soft' " soft, medium, hard
  let g:everforest_enable_italic = 1



  " highlight ALEError ctermbg=none ctermfg=none
  " highlight ALEWarning ctermbg=none ctermfg=none

  let g:ale_set_signs = 1
  let g:ale_set_highlights = 0

  highlight ALEError ctermbg=NONE ctermfg=none
  highlight ALEWarning ctermbg=NONE ctermfg=none
	highlight ALEErrorSign ctermbg=NONE ctermfg=red
	highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
endfunction

function! myspacevim#after() abort
  " set listchars=eol:¬,nbsp:·
  set wrap
  set list

  " hi Comment guifg=#5C6370 ctermfg=59


  imap jj <Esc>

  imap ,, <C-y>,
  " imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
  let g:user_emmet_settings = {
  \  'javascript' : {
  \      'extends' : 'jsx',
  \  },
  \  'eruby' : {
  \    'extends' : 'html',
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
  autocmd FileType html,eruby,haml,erb,css,javascriptreact,javascript.jsx,javascript EmmetInstall
  let g:user_emmet_mode='a'
  let g:user_emmet_install_global = 0

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
endfunction
