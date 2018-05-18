"""""" VUNDLE CONFIG HERE
set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8            " be modern, required
set hidden                    " required for ctrlspace
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'istepura/vim-toolbar-icons-silk'
if !has('nvim')
    Bundle 'Valloric/YouCompleteMe'
endif
Plugin 'scrooloose/nerdtree'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'christoomey/vim-tmux-navigator'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Plugin 'rking/ag.vim'

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
"""""" END VUNDLE CONFIG
"
" set solarized colorscheme
colorscheme solarized
set background=dark

set updatetime=250
syntax on
if !has('nvim')
    set ttymouse=xterm2
endif
set mouse=a

"Information on the following setting can be found with
":help set
set tabstop=4
set expandtab
set autoindent 
set shiftwidth=4  "this is the level of autoindent, adjust to taste
set ruler
set number
set backspace=indent,eol,start
set visualbell

" Uncomment below to make screen not flash on error
set vb t_vb=""
" map <F3> ggVGg?

" Make <S-D> just use black hole register to not clobber yanked text
noremap <S-D> "_dd

" set font
let g:airline_powerline_fonts = 1
if has('gui_running')
    set guifont=Cousine\ For\ Powerline\ 10
endif

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif
" look for ctags
set tags=tags;/

" cycle buffers with F11/F12
nnoremap <F11> gT
nnoremap <F12> gt

" map :Rep to .,$s

command! Rep .,$s

" Make W work like w
command! W w

" feed open file (like tail -f)
map <silent> M :silent<CR>:view<CR>G:sleep 100m<CR>M

" insert blank lines in normal mode with Enter
nnoremap <Enter> o<ESC>

"YouCompleteMe
"-----------------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1
let g:ycm_max_diagnostics_to_display = 1000
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion = 1

"this is experimental, these should be default settings!
let g:ycm_auto_trigger = 1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_collect_identifiers_from_tags_files = 1

"diagmode of ycm
nnoremap <F3> <Esc> :YcmDiags<CR>
nnoremap <F2> :YcmCompleter FixIt<CR>
nnoremap <F7> :YcmCompleter GoToDefinition<CR>
nnoremap <F8> :YcmCompleter GoToDeclaration<CR>

"always show gutter aka sign column, and clear its colour
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
highlight clear SignColumn

"Only enable ycm for certain types of file
let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python': 1}

" use F9 for quickfix toggling
" this needs asyncrun.vim to work
noremap <F9> :call asyncrun#quickfix_toggle(8)<CR>

" <leader>p,[,{ to paren/bracket wrap a selection
vnoremap <leader>p c()<ESC>Pl
vnoremap <leader>[ c[ ]<ESC>Pl
vnoremap <leader>] c{ }<ESC>Pl

" auto comma a line
noremap <leader>, :s/\(.*\)/\1,/<CR>
noremap <leader>< :s/,\w*$//<CR>

" easier navigating thorugh wrapped lines
nnoremap j gj
nnoremap k gk

" split down and right
set splitright
set splitbelow

" mouse me
set mouse=a

" NERDTree quit on open file
let g:NERDTreeQuitOnOpen=1
" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

" Use ^G to list current function
autocmd BufNewFile,BufRead *.cpp map <C-g> :echo getline(search('\v^[[:alpha:]$_]', "bn", 1, 100))<CR>
autocmd BufNewFile,BufRead *.py map <C-g> :echo getline(search('\v^.*def]', "bn", 1, 100))<CR>
