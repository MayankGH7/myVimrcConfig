" Defaults -- {{{
if v:progname =~? "evim"
  finish
endif
" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file (restore to previous version)
"  if has('persistent_undo')
"    set undofile	" keep an undo file (undo changes after closing)
"  endif
"endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
 " }}}


" <c-a> - increment int
" <c-x> - decrement int


" Plugin installed --- {{{
call plug#begin()
Plug 'catppuccin/vim', { 'as': 'catppuccin' },
" Plug 'prabirshrestha/vim-lsp'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline-themes'
" Plug 'altercation/solarized'
Plug 'frazrepo/vim-rainbow'
" Plug 'valloric/youcompleteme'
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'sainnhe/sonokai'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/ReplaceWithRegister'
" Plug 'nvim-treesitter/nvim-treesitter'
Plug 'morhetz/gruvbox'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'ghifarit53/tokyonight-vim'
" Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-easy-align'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'vim-python/python-syntax'
Plug 'sheerun/vim-polyglot'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'andymass/vim-matchup'
call plug#end()
" }}}


" <--------- Vim-airline ------------>

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
"blet g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#formatter = 'unique_tail'



let g:rainbow_active = 1   " For vim-raninbow


" CODE DARK THEME CUSTOM
let g:codedark_modern = 1
" let g:codedark_italics = 1
let g:codedark_transparent=1

" Colorschemes ----- {{{
" colorscheme torte
" colorscheme wildcharm
" colorscheme retrobox
" colorscheme slate
" colorscheme habamax
colorscheme catppuccin_mocha	
colorscheme gruvbox
" }}}

" Basic set commands --- {{{
filetype plugin on
set encoding=UTF-8
set shell=/bin/zsh
set clipboard=unnamedplus
" set clipboard+=unnamed
set autoindent
set tabstop=2
set shiftwidth=2
set nu rnu
set sts=2 et
set autoindent
set termguicolors
set go=a
set nohlsearch
set softtabstop=2
set expandtab " convert tab to space
set fileformat=unix
set splitbelow splitright
set breakindent
set noshowmode
set undofile
set undodir=~/undofiles
set timeout timeoutlen=300
set numberwidth=3
" }}}


"" <----- Cursor bar in insert mode --------->
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


" Basic mappings ------ {{{
let mapleader = "\<Space>"
let maplocalleader = ","
inoremap <c-u> <Esc>viwUi
inoremap <c-l> <Esc>viwui
nnoremap <leader>d yyp
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>c ea"<esc>bi"<esc>lwl
nnoremap <leader>q :q!<cr>
inoremap jk <esc>
nnoremap cd :
nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap <leader>cw <c-w>w
nnoremap <c-s> :w<cr>
" nnoremap <leader>nn :set nonu nornu<cr>
nnoremap c "_c
onoremap in( :<c-u>normal! f(vi(<cr>
nnoremap <leader>w ZZ
nnoremap <leader>pi :PlugInstall<CR>
vnoremap <C-x> :!termux-clipboard-set<CR>
vnoremap <C-c> :w !termux-clipboard-set<CR><CR>
inoremap <C-v> <ESC>:read !termux-clipboard-get<CR>i


" }}}

" Abbrevations -- {{{
iabbrev cpptemp #include <iostream><CR>using namespace std;<CR><CR>int main()<CR>{<CR>return 0;
" }}} 


" Autogroup Filetype mappings ----- {{{
augroup main
	autocmd!	

	autocmd InsertLeave * :write
	autocmd FileType python set tabstop=2 shiftwidth=2
	autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
	autocmd FileType python nnoremap <buffer> <leader>r :w<CR>:!python3 %<CR>
	autocmd FileType javascript nnoremap <buffer> <leader>r :w<CR>:!node %<CR>
	autocmd FileType lua nnoremap <buffer> <leader>r :w<CR>:!lua %<CR>
  autocmd FileType javascript iabbrev log console.log()<left>
  autocmd Filetype json nnoremap <buffer> <leader>f :%!jq .<CR>
	autocmd FileType cpp nnoremap <buffer> <leader>r :w <bar> !clang++ -o %< % && ./%< <cr>
	autocmd FileType c nnoremap <buffer> <leader>r :w <bar> !clang -o %< % && ./%< <cr>
	autocmd FileType python :iabbrev <buffer> iff if:<left>
	autocmd FileType html nnoremap <buffer> <localleader>f Vatzf

	" stop autocomment on new line
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
  autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
        \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
augroup END
" }}}


" Vim Marker enable
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


" autocmd BufRead,BufNewFile * syn match parens /[(){}]/ | hi parens ctermfg=blue


" Vim script ---------{{{
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggleAll
" }}}

" rainbow brakets colos ------- {{{
" let g:rbpt_colorpairs = [
"     \ ['darkgray',    'DarkOrchid3'],
"     \ ['darkgreen',   'firebrick3'],
"     \ ['darkcyan',    'RoyalBlue3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['gray',        'RoyalBlue3'],
"     \ ['black',       'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['darkgreen',   'RoyalBlue3'],
"     \ ['darkcyan',    'SeaGreen3'],
"     \ ]

let g:rainbow_active = 1
" }}}


" <--------- Tab autocompletation for coc -------->

" use <tab> to trigger completion and navigate to the next complete item
" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" inoremap <silent><expr> <CR>
"       \ coc#pum#visible() ? coc#pum#confirm() :
"       \ CheckBackspace() ? "\<CR>" :
"       \ coc#refresh()




" inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" autocmd CursorHold * silent call CocActionAsync('highlight')



" Emmet vim
let g:user_emmet_leader_key = ','
" let g:user_emmet_mode = 'n'


" Emmet default template ------ {{{
let g:user_emmet_settings = {
\  'variables': {'lang': 'ja'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}
" }}}

" Make bg transparent
" hi Normal guibg=NONE ctermbg=NONE
" let g:codedark_modern = 1
" let g:codedark_transparent = 1



" Vim motion plugin
" nmap s <Plug>(easymotion-s)
" nmap s <Plug>(easymotion-s2)
nnoremap  <leader><leader>/ <Plug>(easymotion-sn)



" vim sneak plugin
" let g:sneak#label = 1




" VIM ALIGN PLUGIN 
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" PYTHON SYNTAX PLUGIN
let g:python_highlight_all        = 2 
let g:python_highlight_builtins   = 2 
let g:python_highlight_func_calls = 2 
let g:python_highlight_class_vars = 2 
let g:python_highlight_operators  = 2 
 


"NERD TREE settings
let NERDTreeShowHidden = 1

