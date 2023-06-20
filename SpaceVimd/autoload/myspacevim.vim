function! myspacevim#before() abort
  " set listchars=eol:¬,nbsp:·
  set wrap
  set list
  set guicursor=n-v-c-i:block

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
  " setup mapping to call :LazyGit
  nnoremap <silent> <leader>gg :LazyGit<CR>

  filetype plugin indent on
  autocmd Filetype * AnyFoldActivate
  set foldlevel=99

  let g:vimwiki_listsyms = '✗○◐●✓'

  let g:oceanic_material_background = 'deep' " medium, ocean, deep, darker
	let g:oceanic_material_allow_bold = 1
	let g:oceanic_material_allow_italic = 1
	let g:oceanic_material_allow_underline = 1
	let g:oceanic_material_allow_undercurl = 1

  let g:gruvbox_material_enable_italic = 1
  let g:gruvbox_material_background = 'hard' " soft, hard, medium(default)
  let g:gruvbox_material_enable_bold = 1

  let g:material_style = 'palenight' " 'darker', 'lighter', 'oceanic', 'palenight', 'deep ocean'
  let g:material_terminal_italics = 1
  let g:material_theme_style = 'palenight'

  let g:srcery_italic = 1
  let g:srcery_bold = 1

  let g:gruvbox_baby_function_style = "italic"
  let g:gruvbox_baby_keyword_style = "italic"

  " style: dark, darker, cool, deep, warm, warmer
  let g:onedark_config = {
    \ 'style': 'deep',
    \ 'ending_tildes': v:true,
    \ 'code_style': {
      \ 'comments': 'italic',
      \ 'strings': 'italic',
      \ 'functions': 'italic',
      \ 'keywords': 'italic',
      \ 'variables': 'italic',
    \ },
  \ }

  let g:tokyodark_enable_italic_comment = 1
  let g:tokyodark_enable_italic = 1
  let g:tokyodark_color_gamma = "1.0"

  let g:gruvbox_baby_telescope_theme = 1
  let g:gruvbox_baby_function_style = "italic"
  let g:gruvbox_baby_keyword_style = "italic"

  " highlight ALEError ctermbg=none ctermfg=none
  " highlight ALEWarning ctermbg=none ctermfg=none

  let g:ale_set_signs = 1
  let g:ale_set_highlights = 0

  let g:vista_default_executive = 'coc'
  let g:vista_fzf_preview = ['right:80%']

  let g:floaterm_keymap_toggle = '<C-\>'
  let g:floaterm_width = 0.9
  let g:floaterm_height = 0.9

  au BufWritePost * lua require('lint').try_lint()

  highlight ALEError ctermbg=NONE ctermfg=none
  highlight ALEWarning ctermbg=NONE ctermfg=none
  highlight ALEErrorSign ctermbg=NONE ctermfg=red
  highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
endfunction

function! myspacevim#after() abort
  set wrap
  set list
  set guicursor=n-v-c-i:block

  imap jj <Esc>
  " setup mapping to call :LazyGit
  nnoremap <silent> <Space>gg :LazyGit<CR>
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
