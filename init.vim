set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
"
"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/mkrass1/.dein.vim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/mkrass1/.dein.vim')
    call dein#begin('/home/mkrass1/.dein.vim')

    " Let dein manage dein
    " Required:
    call dein#add('/home/mkrass1/.dein.vim/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here:
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('zchee/deoplete-clang')
    call dein#add('neomake/neomake')

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
"
" Use deoplete.
let g:deoplete#enable_at_startup = 1

" deocomplete settings
let g:deoplete#sources#clang#libclang_path = '/opt/bb/lib/llvm-5.0/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/opt/bb/lib/llvm-5.0/lib64/clang/5.0.1/include'
let g:neomake_cpp_pcomp_maker = {
  \ 'exe': 'pcomp',
  \ 'args': ['-a sundev1'],
  \ 'errorformat': '%f:%l:%c: %m',
  \ }

" complete with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" fix ctrlspace
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
