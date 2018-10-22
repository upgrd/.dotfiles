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
"nnoremap <F9> :w !xmllint --valid % --noout<cr>
" Xpath prompt
nnoremap <F9> :call XpathQuery()<cr>
function! XpathQuery()
  " boilerplate ; get input
  call inputsave()
  let xpathExpression = input('Enter xpath expression: ')
  call inputrestore()
  " command to pass xpathExpression
  execute ':w !saxon-lint.pl --xpath ' . "\"" . xpathExpression . "\" " . @%

endfunction

" XSLT transform to stout or output file
nnoremap <F10> :w !java -jar /usr/local/bin/saxon9he.jar -s:% -a<CR>
nnoremap <F10><F10> :w !java -jar /usr/local/bin/saxon9he.jar -s:% -o:
