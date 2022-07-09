inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>do <Plug>(coc-codeaction)

call coc#config('coc.preferences', {
			\ "autoTrigger": "always",
			\ "maxCompleteItemCount": 5,
			\ "codeLens.enable": 1,
			\ "diagnostic.virtualText": 1,
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
			\]

for extension in s:coc_extensions
	call coc#add_extension(extension)
endfor
