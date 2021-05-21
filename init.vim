" Vim plugins "
call plug#begin('~/.vim/plugged')

Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chemzqm/vim-jsx-improve'  " use =G to indent
Plug 'ctrlpvim/ctrlp.vim'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

call plug#end()

let g:coc_disable_startup_warning = 1

syntax on

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

" setup Python
let g:python3_host_prog = '/usr/bin/python'
" disable python 2
let g:loaded_python_provider = 0

" vim-jsx-pretty config
let g:vim_jsx_pretty_colorful_config = 1
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_template_tags = ['html', 'jsx']

" open NERDTree when runing Vim "
autocmd VimEnter * NERDTree
" " close Vim when closing the only file on the buffer "
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" define Vim's themewith gruvbox "
colorscheme gruvbox
set background=dark

" change leader key to space bar "
let mapleader = " "

" remap vim's windows movements "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" display/hide Undotree "
nnoremap <leader>u :UndotreeShow<CR>

" configure NERDTree git plugin "
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" configure fzf "
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_branch_actions = {
      \ 'rebase': {
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" coc-highlight "
autocmd CursorHold * silent call CocActionAsync('highlight')
" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \]

let g:ackprg = 'ag --nogroup --nocolor --column'
