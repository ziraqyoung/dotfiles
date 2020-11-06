function! myspacevim#before() abort
  set listchars=tab:▸\ ,eol:¬,nbsp:·
  set wrap
  set list
  set showbreak=↪
  let g:space_vim_dark_background = 234
  let g:ctrlp_custom_ignore = 'public/packs*\|log\|tmp\|node_modules\|DS_Store\|\.git'
  let g:material_terminal_italics = 1
  let g:material_theme_style = 'palenight'
  let g:oceanic_next_terminal_italic = 1

  let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
  if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
	  let g:coc_global_extensions += ['coc-prettier']
	endif
	if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
	  let g:coc_global_extensions += ['coc-eslint']
	endif
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gr <Plug>(coc-references)
	nmap <leader>do <Plug>(coc-codeaction)


  let g:user_emmet_mode='a'
  " imap ,, <C-y>,
    let g:user_emmet_settings = {
    \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
    \  'erb' : {
    \    'extends' : 'html',
    \  },
    \  'haml' : {
    \    'extends' : 'html',
    \  },
    \}
"
    " let g:ale_fixers = {
      " \    'scss': ['prettier'],
      " \    'css': ['prettier'],
      " \    'html': ['prettier'],
      " \    'ruby': ['rubocop'],
      " \    'javascript': ['prettier']
    " \}
    " let g:ale_fix_on_save = 1
    imap jj <Esc>
endf


function! myspacevim#after() abort
  set listchars=tab:▸\ ,eol:¬,nbsp:·
  let g:user_emmet_leader_key='<Tab>'
  set wrap
  set list
  set showbreak=↪
  let g:ctrlp_custom_ignore = 'public/packs*\|log\|tmp\|node_modules\|DS_Store\|\.git'
  hi Comment guifg=#5C6370 ctermfg=59

  let g:user_emmet_mode='a'
  " imap ,, <C-y>,
    let g:user_emmet_settings = {
    \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
    \  'erb' : {
    \    'extends' : 'html',
    \  },
    \  'haml' : {
    \    'extends' : 'html',
    \  },
    \}
"
    " let g:ale_fixers = {
      " \    'scss': ['prettier'],
      " \    'css': ['prettier'],
      " \    'html': ['prettier'],
      " \    'javascript': ['prettier'],
      " \    'ruby': ['rubocop']
    " \}
    " let g:ale_fix_on_save = 1
endf
