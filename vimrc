set nu
syntax on
set nocompatible
set laststatus=2
set hlsearch
set incsearch
set showmatch
set showmode
set showcmd
set nobackup
set ruler
set smartindent
set ai

filetype off

" Color setting
colorscheme desert
" change the comment color to lightblue
highlight comment ctermfg=lightblue guifg=lightblue

" Format settings
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\[TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\[LEN=%L]
" set statusline=[%F]%m%r%h%w\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]
" Settings for cscope
" set csprg=/usr/local/bin/cscope

if has("cscope")  
    " set csprg=/usr/local/bin/cscope  
    set csto=0  
    set cst  
    set nocsverb  
    set cspc=3  
    "add any database in current dir  
    if filereadable("cscope.out")  
        silent cs add cscope.out  
    "else search cscope.out elsewhere  
    else  
       let cscope_file=findfile("cscope.out", ".;")  
       let cscope_pre=matchstr(cscope_file, ".*/")  
       if !empty(cscope_file) && filereadable(cscope_file)  
           exe "cs add" cscope_file cscope_pre  
       endif
       silent cs add ~/cscope.out   
     endif  
    set csverb
endif  

set csto=0
set cst
nmap <C-[>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-[>i :scs find i ^<C-R>=expand("<cfile>")<CR><CR>
nmap <C-[>d :scs find d <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-\' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-space>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


set foldmethod=syntax
" set foldmethod=manual
set foldlevel=99

set tabstop=4
set autochdir
set tags=tags;
set mouse=a

" cs add cscope.out

au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'taglist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'TabBar'
call vundle#end()
filetype plugin indent on

" :map to show key map

let mapleader='\'

if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gr :Gread<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>ge :Gedit<CR>
    " Mnemonic _i_nteractive
    nnoremap <silent> <leader>gi :Git add -p %<CR>
	nnoremap <silent> <leader>gg :SignifyToggle<CR>
endif

" let Tlist_Auto_Open=1
map <silent> <leader>tl :Tlist<cr>:wincmd j<cr>
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1

" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
map <silent> <leader>nt :NERDTreeToggle<cr>:wincmd p<cr>

let Tb_MaxSize = 2
let Tb_TabWrap = 1
map <silent> <leader>tb :TbToggle<cr>

" add path for your src file dir
set path+=~/src

set hidden

hi cursorline cterm=bold

map <silent> <leader>[ :set mouse=a<cr>
map <silent> <leader>] :set mouse=""<cr>


