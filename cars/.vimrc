" noremap jk <ESC>
" let mapleader = "\<Space>"

" execute pathogen#infect()
" filetype plugin indent on
" syntax on
set encoding=utf-8

set nocompatible

" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
"
" Plugin 'SuperTab'
" Plugin 'https://github.com/scrooloose/nerdtree.git'
" Plugin 'https://github.com/vim-scripts/VimClojure.git'
" Plugin 'https://github.com/tpope/vim-fugitive.git'
" Plugin 'https://github.com/kien/ctrlp.vim.git'
" Plugin 'elixir-lang/vim-elixir'
" Plugin 'scrooloose/nerdcommenter'
"
" call vundle#end()

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --exclude-standard']
let g:ctrlp_max_files=0
let g_ctrlp_max_depth=40
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

set number
set ruler
syntax on

" Syntastic linter settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_scss_checkers=["sass_lint"]
" nnoremap <C-w>R :SyntasticToggleMode<CR>

" Set Leader Key
let mapleader = ","

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" tab indents
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Commenting
map <C-_> <Leader>c<Space>

" Numbers
map <C-N><C-N> :set invnumber<CR>

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
map <Leader>s :nohlsearch<CR>

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Status bar
set laststatus=2
set statusline+=[%F]
set statusline+=[FORMAT=%{&ff}]
set statusline+=[TYPE=%Y]
set statusline+=[POS=%04l,%04v]
set statusline+=[%p%%]
set statusline+=%*

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>
autocmd BufEnter * lcd %:p:h

" Command-T configuration
let g:CommandTMaxHeight=20

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

au BufRead,BufNewFile *.txt call s:setupWrapping()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Change Tabs
map <C-Left> :tabp<CR>
map <C-Right> :tabn<CR>

" Change split panes
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l
map <Leader>h <C-w>h

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
" color molokai
set t_Co=256

"Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

set clipboard=unnamed

set mouse=r

imap jk <ESC>
" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

:nmap <leader><Space> <C-w>t<C-w>K
