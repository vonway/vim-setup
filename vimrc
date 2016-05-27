set nu
syntax on
set nocompatible
set laststatus=2
filetype off

" Color setting
colorscheme desert

" Format settings
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\[TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\[LEN=%L]

" Settings for cscope
set csprg=/usr/local/bin/cscope
set csto=0
set cst
nmap <C-[>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-[>i :cs find i ^<C-R>=expand("<cfile>")<CR><CR>
nmap <C-[>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-\' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.
nmap <C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :scs find d <C-R>=expand("<cword>")<CR><CR>

set foldmethod=syntax
set foldlevel=99

set tabstop=4
set tags=tags

" cs add cscope.out

au BufWinLeave * mkview
au BufWinEnter * silent loadview

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on

" :map to show key map

set showcmd
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

