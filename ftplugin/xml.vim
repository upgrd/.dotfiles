" ### FT XML ###

""" general settings
"{{{
" set colorscheme
colorscheme mac_classic
" enable HTML snippets
UltiSnipsAddFiletypes xml.html.css
" XML tab settings
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab
"}}}

""" mappings
"{{{
" map F9 to validate
nnoremap <F9> :w !xmllint --valid % --noout<cr>
" Xpath prompt
nnoremap <F8> :call XpathQuery()<cr>
function! XpathQuery()
  " boilerplate ; get input
  call inputsave()
  let xpathExpression = input('Enter xpath expression: ')
  call inputrestore()
  " command to pass xpathExpression
  execute ':w !xmllint % --xpath ' . "\"" . xpathExpression . "\""

endfunction
"}}}
