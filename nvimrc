" Begin .vimrc
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'ElmCast/elm-vim'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'leafgarland/typescript-vim'
Plug 'bling/vim-airline'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fireplace'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mhartington/oceanic-next'
Plug 'mhinz/vim-grepper' 

" Initialize plugin system
call plug#end()

let g:python2_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

python3 <<EOF
import vim

def comment_a_line(line, comment_text):
    if line.startswith(comment_text):
        return line[1:]
    else:
        return comment_text + line

def get_mark_position(cb, marker):
    return cb.mark(marker)

def set_content_at_line(cb, line_number, line_content):
    cb[line_number] = line_content

def toggle_comment(comment_text):
    cb = vim.current.buffer
    lnum1, col1 = get_mark_position(cb, '<')
    lnum2, col2 = get_mark_position(cb, '>')
    for i in range(lnum1-1, lnum2):
        set_content_at_line(cb, i, comment_a_line(cb[i], comment_text)) 
EOF
" let Tlist_Ctags_Cmd="/usr/bin/ctags"
set nocompatible   "Stops vim from behaving in a strongly vi
"set columns=80     "Number of columns used on screen
syntax on          "syntax highlighing
filetype on
filetype plugin on
filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8
set nobackup
set nowb
set noswapfile
set number         "show line numbers
set ruler          "show the cursor position all the time
set ignorecase     "ignore case when searching
set hlsearch       "highlight searches
set expandtab      "Space for tab
set tabstop=4      "number of spaces of tab character
set shiftwidth=4   "number of spaces to (auto)indent
set autoindent     "always set auto indenting on
set smartindent    "smart indent
set cindent        "cindent
" Show  tab characters. Visual Whitespace.
set list
set listchars=tab:>.
set pastetoggle=<F12>    "Bind for easy pasting
set background=dark

let mapleader = ","

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>

tnoremap <Esc> <C-\><C-n>

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:ctrlp_max_files=0
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

if (has("termguicolors"))
  set termguicolors
 endif

colorscheme OceanicNext

" Open the grepper
 nnoremap <leader>gg :Grepper<CR> 
