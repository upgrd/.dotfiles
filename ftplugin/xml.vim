" ### FT XML ###

""" general settings
"{{{
" set colorscheme
colorscheme mac_classic
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
