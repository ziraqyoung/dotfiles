inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

call coc#config('coc.preferences', {
			\ "autoTrigger": "always",
			\ "maxCompleteItemCount": 5,
			\ "codeLens.enable": 1,
			\ "diagnostic.virtualText": 1,
			\ "suggest.echodocSupport": 1,
			\})


let s:coc_extensions = [
			 \ 'coc-dictionary',
			 \ 'coc-json',
			 \ 'coc-sql',
			 \ 'coc-yaml',
			 \ 'coc-git',
			 \ 'coc-stylelintplus',
			 \ 'coc-stylelint',
			 \ 'coc-tsserver',
			 \ 'coc-solargraph',
			 \ '@yaegassy/coc-tailwindcss3',
			 \ 'coc-go',
			 \ 'coc-snippets',
			 \ 'coc-tag',
			 \ 'coc-graphql',
			 \ 'coc-actions',
			 \ 'coc-docker',
			 \ 'coc-svg',
			 \ 'coc-pairs',
			 \ 'coc-prettier',
			 \ 'coc-calc',
			 \ 'coc-html',
			 \ '@yaegassy/coc-nginx',
			 \ 'coc-rust-analyzer',
			 \ 'coc-jest',
			 \ 'coc-emmet',
			 \ 'coc-highlight',
			 \ '@yaegassy/coc-marksman',
			\]

for extension in s:coc_extensions
	call coc#add_extension(extension)
endfor
