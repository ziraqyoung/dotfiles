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
			 \ 'coc-tailwindcss',
			 \ 'https://github.com/ziraqyoung/coc-tailwind-intellisense',
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
			 \ 'coc-jest',
			\]

for extension in s:coc_extensions
	call coc#add_extension(extension)
endfor
