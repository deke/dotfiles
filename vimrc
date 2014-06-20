set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-commentary.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"" Settings
"
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.

set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2

set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus
"
set noshowmatch                   " Do not show matching brackets by flickering
set nocursorcolumn
set lazyredraw                  " Wait to redraw "
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains uppercase characters
set ttyfast

" speed up syntax highlighting
set nocursorcolumn
set nocursorline
syntax sync minlines=256
set re=1

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

set t_Co=256
syntax enable
set background=dark
"let g:solarized_termcolors = 256  " New line!!
colorscheme monokai
set history=100                 "command history

set ruler                      "always show cursor
" clear search buffer
" :nnoremap § :nohlsearch<cr>

" make sure undo history is kept for files in buffer.
set hidden

" turn indentation on
filetype indent on

" scroll with more context
" set scrolloff=10

" convert tabs to spaces
set expandtab

" set tab size
set tabstop=4

" the number of spaces inserted for a tab
set shiftwidth=4

" highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

" get rid of the delay when pressing O (for example)

" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
" set timeout timeoutlen=1000 ttimeoutlen=100


" set the status line to something useful
" set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" hide the toolbar
" set guioptions-=T

" jump to last cursor
" autocmd BufReadPost *
"   \ if line("'\"") > 0 && line("'\"") <= line("$") |
"  \   exe "normal g`\"" |
"  \ endif

" set-up ctrlp to include hidden files in its search
let g:ctrlp_show_hidden=1

" disable ctrlp's feature where it tries to intelligently work out the
" current working directory to search within
" let g:ctrlp_working_path_mode=0

" don't let ctrlp take over the screen!
let g:ctrlp_max_height=30

" lets make sure we don't show these files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" git gutter
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" golang settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4


" TODO: add javascript and some other languages who doesn't have ctags support
" coffee: https://gist.github.com/michaelglass/5210282
" go: http://stackoverflow.com/a/8236826/462233
" objc:  http://www.gregsexton.org/2011/04/objective-c-exuberant-ctags-regex/
" rust: https://github.com/mozilla/rust/blob/master/src/etc/ctags.rust
let g:ctrlp_buftag_types = {
            \ 'go'     	   : '--language-force=go --golang-types=ftv',
            \ 'markdown'   : '--language-force=markdown --markdown-types=hik'
            \ }

let g:go_fmt_fail_silently = 1

au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)

au FileType go nmap <Leader>i <Plug>(go-info)

au FileType go nmap  <leader>r  <Plug>(go-run)
au FileType go nmap  <leader>b  <Plug>(go-build)
au FileType go nmap  <leader>t  <Plug>(go-test)

au FileType go nmap <Leader>d <Plug>(go-doc-browser)
