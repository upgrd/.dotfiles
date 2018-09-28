""" UPGRD vimrc

" KEEP .vimrc clean! -->  http://vim.wikia.com/wiki/Keep_your_vimrc_file_clean

""" VUNDLE section
"{{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

""" Plugins
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"}}}

""" UltiSnips section
" docs: https://github.com/SirVer/ultisnips/blob/master/doc/UltiSnips.txt
"{{{
"from https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme/14903149
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"}}}

""" Linting via ALE
Plugin 'w0rp/ale'

""" XML section
"{{{
"}}}


" Disable automatic comment insertion
" See http://vim.wikia.com/wiki/Disable_automatic_comment_insertion 

" highlight settings
"
set hlsearch incsearch
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

""" Simultanious hybrid numbers
set number
set relativenumber
"autocmd VimEnter * RltvNmbr

""" set color at vim/colors
"colorscheme vorange
"colorscheme srcery-drk
colorscheme monokai

""" map tab to 4 spaces
"{{{
" from https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
"}}}

""" LEADERS
" mapleader
let mapleader = "\\"
"localleader
"let maplocalleader = ""

"""AUTOCMDs 
"{{{
"put all autocmds in cleared groups!
"augrp <grp_name>
"   autocmd!
"   autocmd <cmd>
"augrp END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

"}}}

" start with all folded
set foldlevel=0

""" MAPPINGS
"{{{
" ctrl-c/v to copy/yank
vnoremap <C-c> "+yy
noremap <C-v> "+p
nnoremap <F10> :NERDTreeToggle<CR>
nnoremap <F11> :TagbarToggle<CR>
" ale mappings
nnoremap <C-j> :ALENext<cr>
nnoremap <C-k> :ALEPrevious<cr>
nnoremap <cr> o<esc>
" Show syntax highlighting groups for word under cursor
noremap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nnoremap ft :call FoldlevelToggle()<cr>
function! FoldlevelToggle()
    echom &foldlevel
    if &foldlevel
        setlocal foldlevel=0
    else
        setlocal foldlevel=1
    endif
endfunction

"}}}

""" Snippets dir
"let g:UltiSnipsSnippetsDir=$HOME/.vim/bundle/ultisnips/

let g:ale_xml_xmllint_options="--dtdvalid --relaxng --schema"

""" COMMANDS
"xpath command
command! -nargs=1 Xpath w !xmllint --xpath "<args>" %


let g:UltiSnipsSnippetDirectories=["UltiSnips", "mycoolUltisnippets"]
