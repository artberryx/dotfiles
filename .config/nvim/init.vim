set encoding=utf-8
set fileencoding=utf-8

" Numbers
set number relativenumber
set numberwidth=4
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  autocmd FileType nerdtree set number relativenumber
augroup end

" Tab
set tabstop=4
set shiftwidth=4
set expandtab
set shiftround

" Split
set splitbelow
set splitright

" Scroll
set scrolloff=3
if exists('##TermEnter')
  " Disable scrolloff in terminal buffers (to avoid flickering)
  " Note: scrolloff is a global option until neovim 0.5 (neovim/neovim#11915)
  augroup termscrollfix
    autocmd!
    autocmd TermOpen,TermEnter * setlocal scrolloff=0
    autocmd TermLeave          * setlocal scrolloff=3        " workaround for nvim<0.5
  augroup end
endif

" Temporary files
set noswapfile
set nobackup
set nowritebackup

" Appearance
set cmdheight=2
set showtabline=2
set cursorline
set cursorcolumn
set title
set listchars=tab:»\ ,trail:·,extends:>,precedes:<

" Etc
set mouse=a
set autoindent
set ignorecase
set smartcase
set hidden
set updatetime=300
set shortmess+=c
set foldopen+=jump

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

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
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
Plug 'szw/vim-maximizer'
Plug 'jiangmiao/auto-pairs'

" Plugins related to themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'artberryx/onehalf', { 'rtp': 'vim/' }
Plug 'dracula/vim'
call plug#end()

" Theme
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
" colorscheme dracula
" let g:airline_theme='dracula'
set termguicolors
let g:airline_highlighting_cache = 1

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=[]
" Close NERDTree when it is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" floaterm
let g:floaterm_width = 0.9
let g:floaterm_height = 0.7
let g:floaterm_winblend = 20

" auto-pairs
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutBackInsert = ''

" Keymaps
map <Space> <Leader>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap q: <nop>
nnoremap Q <nop>
nnoremap <silent> <M-t> :tabnew<CR>
nnoremap <silent> <Esc><Esc> :noh<CR>
nnoremap <silent> <Leader>rc :vs $MYVIMRC<CR>
nnoremap <silent> <Leader>rso :so $MYVIMRC<CR>

" Windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap _ <C-w>-
nnoremap + <C-w>+
nnoremap <S-Right> <C-w>>
nnoremap <S-Left> <C-w><
nnoremap <S-Down> <C-w>-
nnoremap <S-Up> <C-w>+
nnoremap <silent> <C-w>z :MaximizerToggle<CR>
let g:maximizer_set_default_mapping = 0  " do not map <F3> (default mapping of vim-maximizer)

" fzf
nnoremap <silent> <C-p> :Files<CR>

" NERDTree
noremap <silent> <Leader>n :NERDTreeToggle<CR>
noremap <silent> <Leader>m :NERDTreeFind<CR>
noremap <silent> <Leader>b :NERDTreeFocus<CR>

" floaterm
tnoremap <silent> <C-[><C-[> <C-\><C-n>
tnoremap <silent> <C-\><C-\> <C-\><C-n>
nnoremap <silent> <M-p> :FloatermToggle<CR>
tnoremap <silent> <M-p> <C-\><C-n>:FloatermToggle<CR>

" coc.nvim recommendation
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <M-space> to trigger completion.
inoremap <silent><expr> <M-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gb <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

