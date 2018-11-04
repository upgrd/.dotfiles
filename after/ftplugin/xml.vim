" ### FT XML ###

""" general settings
"{{{
" set colorscheme
colorscheme mac_classic
UltiSnipsAddFiletypes xml
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
nnoremap <F5> :call XpathQuery()<cr>
function! XpathQuery()
  " boilerplate ; get input
  call inputsave()
  let xpathExpression = input('Xpath expression: ') 
  call inputrestore()
  " command to pass xpathExpression
  execute ':w !saxon-lint.pl --xpath ' . "\'" . xpathExpression . "\' " . @%

endfunction

" XSLT transform to stout or output file
nnoremap <F6> :w !java -jar /usr/local/bin/saxon9he.jar -s:% -a<CR>
nnoremap <F6><F6> :w !java -jar /usr/local/bin/saxon9he.jar -s:% -a -o:

inoremap <A-j> <CR><ESC>ki


