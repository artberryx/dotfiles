set encoding=utf-8
set fileencoding=utf-8

" Numbers
set number relativenumber
set numberwidth=4
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup end

" Indentation
set autoindent

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab
set shiftround

" Split
set splitbelow
set splitright

" Etc
set mouse=a
set clipboard=unnamedplus

" Plugins
call plug#begin(stdpath('data') . '/plugged')

" Should be sorted (using :sort)
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/ReplaceWithRegister'

call plug#end()

" Keymaps
map <Space> <Leader>
let mapleader = "\<Space>"
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
noremap <Leader>n :NERDTreeToggle<CR>

" EasyMotion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>a <Plug>(easymotion-jumptoanywhere)

