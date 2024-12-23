" Display a friendly cat whenever opening Vim
echo ">^.^<" 
let mapleader = ","

set nocompatible

imap jj <ESC>

syntax on
filetype on
filetype plugin on
filetype indent on	
set shortmess+=I


set number
set hlsearch

set norelativenumber
"set tw=0
set laststatus=2
"set colorcolumn=0
set backspace=indent,eol,start

set noshowmode
set hidden
set cmdheight=1

set ignorecase
set smartcase

set incsearch

set tabstop=4
set expandtab
set shiftwidth=4
"set autoindent
"set smartindent
set mouse=a

set clipboard=unnamedplus




"set noerrorbells visualbell t_vb=


" opening .vimrc fast
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source .vimrc fast
nnoremap <leader>sv :source $MYVIMRC<cr>
" open terminal and move it to the bottom
nnoremap <leader>tt :terminal<cr><C-w>r<C-w>N10<C-w>-a
" move the cursor to previous line
nnoremap <leader>b <C-o>
" quit all
nnoremap <leader>q :qa<cr>


" save file
nnoremap <leader>w :wa<cr>

nnoremap <leader>= <C-w>+<cr>
nnoremap <leader>- <C-w>-<cr>


nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h

" buffer
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
" buffer: bbye
nnoremap <leader>d :Bdelete<cr>
nnoremap <leader>1 :b1<cr>
nnoremap <leader>2 :b2<cr>
nnoremap <leader>3 :b3<cr>
nnoremap <leader>4 :b4<cr>
nnoremap <leader>5 :b5<cr>
nnoremap <leader>6 :b6<cr>



" terminal
tnoremap <leader>n <C-w>N<cr>
tnoremap <leader>c clear<cr>
tnoremap <leader>k <C-w>k
tnoremap <leader>j <C-w>j
tnoremap <leader>l <C-w>l
tnoremap <leader>h <C-w>h
" change terminal hight
tnoremap <leader>= <C-w>+<cr>
tnoremap <leader>- <C-w>-<cr>


" tagbar
nmap <leader>8 :TagbarToggle<CR>
" nerdtree
nnoremap <leader>o :NERDTreeToggle<CR>


" autocmd
augroup spam
    au!
    au! BufRead,BufNewFile *.py setfiletype python
    au! BufRead,BufNewFile *.cpp setfiletype cpp
    au! BufRead,BufNewFile *.c setfiletype cpp
    au! BufRead,BufNewFile *.h setfiletype cpp

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

    " Save file whenever the buffer changes
    "autocmd TextChanged,TextChangedI <buffer> silent write



    " nerdtree setup
" Start NERDTree and put the cursor back in the other window.
    autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    " nerdtree automatically update
    autocmd BufEnter NERD_tree_* | execute 'normal R'

augroup END

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline-themes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
Plug 'preservim/tagbar'

Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'moll/vim-bbye'
call plug#end()

let g:airline_theme='luna'
"let g:airline_theme='onedark'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" air-line
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show=1


let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


" coc.nvim setup
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"inoremap <silent><expr> <Tab>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
set updatetime=300
set signcolumn=yes
set pumheight=10

 
