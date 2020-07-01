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
set cursorline
set mouse=a
set clipboard=unnamedplus

" Auto-install Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif

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
Plug 'vim-scripts/ReplaceWithRegister'

" Plugins related to themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sonph/onehalf', { 'rtp': 'vim/' }

call plug#end()

" Theme
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
set termguicolors

" NERDTree
let NERDTreeShowHidden=1

" Keymaps
map <Space> <Leader>
map <Leader> <Plug>(easymotion-prefix)
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

