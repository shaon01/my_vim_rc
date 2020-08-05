set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'

" Specify a directory for plugins
" " - For Neovim: stdpath('data') . '/plugged'
" " - Avoid using standard Vim directory names like 'plugin'
"call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plugin 'tpope/vim-sensible.git'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-system-copy.git'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'vbundles/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'godlygeek/tabular.git'
Plugin 'jiangmiao/auto-pairs.git'
Plugin 'mileszs/ack.vim'
Plugin 'Yggdroot/indentLine.git'
Plugin 'vim-scripts/xoria256.vim.git'
Plugin 'itchyny/lightline.vim.git'
Plugin 'kana/vim-textobj-user.git'
Plugin 'kana/vim-textobj-line.git'
Plugin 'edkolev/tmuxline.vim.git'
" Plug 'jeaye/color_coded.git'
Plugin 'christoomey/vim-tmux-navigator.git'
Plugin 'tpope/vim-vinegar.git'
" Plug 'vim-scripts/Conque-GDB.git'
Plugin 'suan/vim-instant-markdown.git'
Plugin 'panozzaj/vim-autocorrect'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-misc'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'simplyzhao/cscope_maps.vim'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
" Plug 'w0rp/ale.git'

" Initialize plugin system
" call plug#end()

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
au VimEnter *  NERDTree
colorscheme xoria256
"colorscheme zellner

" To ignore plugin indent changes, instead use:
"filetype plugin on

" Highlight the search pattern.
let mapleader="\<Space>"

set hidden
set directory=/tmp
set history=1000
set hlsearch
set incsearch
set ignorecase
set smartcase
set showbreak=…
set linebreak
set listchars=tab:►-,eol:¬,trail:●
"set relativenumber
set number
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
retab

" Underline current cursor line
set cursorline
augroup CustomCursorLine
    au!    
    au ColorScheme * :hi clear CursorLine
    au ColorScheme * :hi! CursorLine gui=underline cterm=underline
augroup END


" esc in insert mode
inoremap kj <esc>
"
" " esc in command mode
cnoremap kj <C-C>
" " Note: In command mode mappings to esc run the command for some odd
" " historical vi compatibility reason. We use the alternate method of
" " existing which is Ctrl-C

nnoremap <leader>l :set list!<cr>

nnoremap <silent><F8> :nohlsearch<cr>

nnoremap <leader>vv :vsp<cr>
nnoremap <leader>ss :sp<cr>

" Toggle the Tlist window using <F4>
nnoremap <silent><F4> :TagbarToggle<cr>

nnoremap <leader>fb :CtrlPBuffer<cr>
nnoremap <leader>fm :CtrlPMixed<cr>
nnoremap <leader>ff :CtrlP getcwd()<cr>
nnoremap <leader>ft :CtrlPTag<cr>

nnoremap <silent><leader>sv :source ~/.vimrc<cr>
nnoremap <silent><leader>ev :edit ~/.vimrc<cr>
nnoremap <silent><leader>et :edit ~/.tmux.conf<cr>
nnoremap <silent><leader>eb :edit ~/.bashrc<cr>

nnoremap <silent><F9>       :cprev<cr>zz
nnoremap <silent><F10>      :cnext<cr>zz
nnoremap <silent><C-F9>     :lprev<cr>zz
nnoremap <silent><C-F10>    :lnext<cr>zz
nnoremap <silent><M-F9>     :cfirst<cr>
nnoremap <silent><M-F10>    :clast<cr>
nnoremap <silent><leader>mm :set lines=10000 columns=1000<cr>
nnoremap <silent><leader>mn :set lines=999 columns=90<cr>

" ================ Plugin Configuraiton  ====================
 
" -------------- gutentags  -----------------
"let g:gutentags_modules = ['ctags', 'gtags_cscope']
"
"" config project root markers.
"let g:gutentags_project_root = ['.root', '.git']
"
"" generate datebases in my cache directory, prevent gtags files polluting my project
"let g:gutentags_cache_dir = expand('~/.cache/tags')
"
"" change focus to quickfix window after search (optional).
"let g:gutentags_plus_switch = 1
"
"let g:gutentags_define_advanced_commands = 1
"let g:gutentags_cscope_executable = 'gtags-cscope' 

" -------------- YouCompleteMe  -----------------
let g:ycm_always_populate_location_list            = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_error_symbol                             = 'E>'
let g:ycm_warning_symbol                           = 'W>'
let g:ycm_confirm_extra_conf                       = 0

" -------------- lightline  -----------------

" display the plugin name at the mode component?
function! LightlineMode()
  return expand('%:t') ==# '__Tagbar__' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ lightline#mode()
endfunction

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'mode': 'LightlineMode',
      \ },
      \ }



" -------------- indentLine -----------------
let g:indentLine_char = '|'

" -------------- tagbar -----------------
let g:tagbar_autoclose        = 1
let g:tagbar_autofocus        = 1
let g:tagbar_sort             = 1
let g:tagbar_autoshowtag      = 1
let g:tagbar_foldlevel        = 99
let g:tagbar_show_linenumbers = -1

" -------------- Ack -----------------
let g:ackprg = 'ag --nogroup --nocolor --column'

" -------------- diff ------------------
if &diff
    set cursorline
    map ] ]c
    map [ [c
    hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
    hi DiffChange ctermbg=white  guibg=#ececec gui=none   cterm=none
    hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
endif


" -- restore from the last position https://vim.fandom.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session

" Tell Vim to  remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

"
" Cscope
"
if has("cscope")
    " Use both cscope and ctag for 'ctrl+]', 'ta', and 'vim -t'
    set cscopetag
    set csto=0
    
    let &tags=$CTAGS_DB
    "if filereadable("cscope.out")
    "    cs add cscope.out
    "elseif $CSCOPE_DB != ""
    "    cs add $CSOPE_DB
    "endif

    " Show msg when any other cscope db added
    " set cscopeverbose

    ""nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    ""nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    ""nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    ""nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    ""nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    ""nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    ""nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    ""nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

endif
" -------------- cscope_maps override  -----------------
" The following maps all invoke one of the following cscope search types:
"
"   's'   symbol: find all references to the token under cursor
"   'g'   global: find global definition(s) of the token under cursor
"   'c'   calls:  find all calls to the function name under cursor
"   't'   text:   find all instances of the text under cursor
"   'e'   egrep:  egrep search for the word under cursor
"   'f'   file:   open the filename under cursor
"   'i'   includes: find files that include the filename under cursor
"   'd'   called: find functions that function under cursor calls
"
noremap <leader>s :scs find s <C-R>=expand("<cword>")<CR><CR>   
noremap <leader>g :scs find g <C-R>=expand("<cword>")<CR><CR>   
noremap <leader>c :scs find c <C-R>=expand("<cword>")<CR><CR>   
noremap <leader>t :scs find t <C-R>=expand("<cword>")<CR><CR>   
noremap <leader>e :scs find e <C-R>=expand("<cword>")<CR><CR>   
noremap <leader>f :scs find f <C-R>=expand("<cfile>")<CR><CR>   
noremap <leader>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
noremap <leader>d :scs find d <C-R>=expand("<cword>")<CR><CR>


