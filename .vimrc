"Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'posva/vim-vue'
Plugin 'dbakker/vim-projectroot'
Plugin 'joonty/vim-phpunitqf.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sekel/vim-vue-syntastic'

call vundle#end()
filetype plugin indent on

"~~~~~~Baseline options~~~~~~
set re=1
syntax on
set background=dark
colorscheme molokai
set backspace=indent,eol,start
let mapleader = ','
set linespace=1
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set nobackup
set nowritebackup
set noswapfile
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile             " add undo files to keep track of undos
set undodir=/Users/john/.vimundo
set noerrorbells         " don't beep
set nocompatible         " turn off compatibility mode
set modelines=0          " No modelines, securitying thing maybe?

"~~~~~~Visuals~~~~~~~

set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=e

"Change the color of the shitty pane border
set foldcolumn=0
hi foldcolumn guibg=bg
hi VertSplit guibg=bg guifg=bg

"Powerline configs
if has("gui_macvim")
    set macligatures
endif
set guifont=Fira\ Mono\ for\ Powerline:h10
set encoding=utf-8
set t_Co=256
set termencoding=utf-8

let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:syntastic_quiet_messages = { "type": "style" }
let g:airline_theme = 'luna'

"Making trailing whitespace visible
set list listchars=tab:»·,trail:·,nbsp:·

"~~~~~~Search~~~~~~~~
set hlsearch
set incsearch

"~~~~~~Mappings~~~~~~
nmap ,ev :tabedit $MYVIMRC<cr>
nmap <Leader><space> :nohlsearch<cr><esc>:ccl<cr>

"Breakpoints
nmap <C-a> <esc>:BreakpointAdd<cr>
nmap <C-s> <esc>:BreakpointDelete<cr>

"Make NERDTree easier to toggle
nmap <C-\> <esc>:NERDTreeToggle<cr>gv
vmap <C-\> <esc>:NERDTreeToggle<cr>gv
"Make CTRL S save the current file
vmap <C-s> <esc>:w<cr>gv
"Make CTRL R open fuzzy finder for current file
nmap <D-r> :CtrlPBufTag<cr>
inoremap <D-r> <esc> :CtrlPBufTag<cr>
vnoremap <D-r> <esc> :CtrlPBufTag<cr>
nmap <D-t> :CtrlP ProjectRootGuess()<cr>
inoremap <D-t> <esc> :CtrlP ProjectRootGuess()<cr>
vnoremap <D-t> <esc> :CtrlP ProjectRootGuess()<cr>
nmap <D-e> :CtrlPMRU<cr>
inoremap <D-e> <esc> :CtrlPMRU<cr>
vnoremap <D-e> <esc> :CtrlPMRU<cr>
nmap <leader>f :tag<space>

nnoremap <F9> :Test<cr>
nnoremap <D-H> <C-w>h
nnoremap <D-J> <C-w>j
nnoremap <D-K> <C-w>k
nnoremap <D-L> <C-w>l
"Disable Ex mode
nnoremap Q <nop>

"jj exits insert mode
inoremap jj <ESC>

"Close current buffer but keep same split open
nnoremap <C-c> :bp\|bd #<CR>

"Reset syntax highlighting
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

"Make space insert one thing
noremap <Space> i_<Esc>r
nmap <C-+> :vertical resize +5<cr>
nmap <C--> :vertical resize -5<cr>

"~~~~~~Plugins~~~~~~~

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,vendor/*,*/\.git/*,node_modules/*,*/resources/assets/*,*/bower_components/*

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --vimgrep\ -Q\ -p\ ~\/\.agignore\ $*
    set grepformat=%f:%l:%c:%m

    " Use ag in CtrlP for listing files. Lightning fast and respects gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" This makes it so syntactic doesn't override the search list
let g:syntastic_auto_loc_list=1

let g:syntastic_php_checkers = ['php']
let g:syntastic_javascript_checkers = ['eslint']

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

let NERDTreeHijackNetrw = 0

"~~~~~~AutoCommands~~~~~~~

"Automatically source the vimrc file

augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

augroup vimrc_tabs
    autocmd!
    autocmd FileType python setl tabstop=4|setl shiftwidth=4|setl softtabstop=4
    autocmd FileType html setl tabstop=4|setl shiftwidth=4|setl softtabstop=4
    autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl softtabstop=4
    autocmd FileType css setl tabstop=4|setl shiftwidth=4|setl softtabstop=4
    autocmd Filetype ruby setlocal tabstop=4|setl shiftwidth=4|setl softtabstop=4
    autocmd Filetype php setlocal tabstop=4|setl shiftwidth=4|setl softtabstop=4
    autocmd Filetype less setlocal tabstop=4|setl shiftwidth=4|setl softtabstop=4
augroup END

augroup filetypedetect
    au BufRead,BufNewFile *.njk setfiletype html
augroup END

"~~~~~~ Vue ESLint ~~~~~~~
let g:syntastic_vue_checkers = ['eslint']
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
    let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
    let g:syntastic_javascript_eslint_exec = local_eslint
    let g:syntastic_vue_eslint_exec = local_eslint
endif
