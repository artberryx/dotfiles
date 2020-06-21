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

" Search highlight
" augroup vimrc-incsearch-highlight
"   autocmd!
"   autocmd CmdlineEnter /,\? :set hlsearch
"   autocmd CmdlineLeave /,\? :set nohlsearch
" augroup end

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

