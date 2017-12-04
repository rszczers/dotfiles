set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Bundle 'kovisoft/slimv'
Bundle 'def-lkb/vimbufsync'
Bundle 'morhetz/gruvbox'
Bundle 'zeis/vim-kolor'
Bundle 'NLKNguyen/vim-lisp-syntax'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Plugin 'arcticicestudio/nord-vim'
Bundle 'itchyny/vim-haskell-indent'
Bundle 'vim-scripts/ReplaceWithRegister'
Bundle 'vim-airline/vim-airline'
Bundle 'farseer90718/vim-taskwarrior'
"Bundle 'lilydjwg/colorizer'
call vundle#end()
filetype plugin indent on
set expandtab
set shiftwidth=4
set tabstop=4

set background=dark
"colorscheme kolor
syntax on
colorscheme nord
let g:nord_comment_brightness = 12

" Powerline
let g:airline_powerline_fonts = 1
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Relatywne numerowanie linii
function! NumberToggle()
  if (&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" lisp
let g:lisp_rainbow=1
let g:slimv_swank_cmd = '! gnome-terminal -e "sbcl --load /usr/share/common-lisp/source/slime/start-swank.lisp &"'
let g:slimv_impl = 'sbcl'

" Rysowanie marginesu
" highlight ColorColumn ctermbg=gray
" set colorcolumn=80

nnoremap <C-n> :call NumberToggle()<cr>
inoremap <C-l> <Space><Space>
nnoremap <F4> :NERDTreeToggle<CR>  
vnoremap <C-c> "*y
nnoremap <C-t> :tabnew<cr>
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>
autocmd FileType tex nnoremap <C-m> :!make<CR>

" Matematyczne
autocmd FileType tex inoremap ;lab \label{}<Esc>hi
autocmd FileType tex inoremap ;ref \eqref{}<Esc>hi
autocmd FileType tex inoremap ;enum \begin{enumerate}[i)]<Enter>\item <++><Enter>\end{enumerate}<Enter><Esc>?<++>"_c4l
autocmd FileType tex inoremap ;eq* \begin{align*}<Enter><++><Enter>\end{align*}<Enter><Esc>?<++><Enter>"_c4l
autocmd FileType tex inoremap ;eq \begin{align}<Enter><++><Enter>\end{align}<Enter><Esc>?<++><Enter>"_c4l
autocmd FileType tex inoremap ;( \(\)<Esc>2hi
autocmd FileType tex inoremap ;rest \left.<++>\right<Bar>_{<++>}<Esc>2?<++><Enter>"_c4l
autocmd Filetype tex inoremap ;frac \frac{<++>}{<++>}<Esc>2?<++><Enter>"_c4l
autocmd FileType tex inoremap ;Cinf \mathrm{C}^{\infty}(M)
autocmd FileType tex inoremap ;Cpinf \mathrm{C}_p^{\infty}(M)
autocmd FileType tex inoremap ;svec \mathfrak{X}(M)
autocmd FileType tex inoremap ;sfun \mathcal{F}(M)
autocmd FileType tex inoremap ;stensor \mathcal{T}_q^p(V)

nnoremap ;rts :%s/\s\+$//e<CR>
nnoremap ;pcd "=strftime("%c")<CR>P
inoremap ;pcd <C-R>=strftime("%c")<CR>
nnoremap ;log O<ESC>"=strftime("%c")<CR>P:r ~/.vim/templates/wpis<CR>5gg

inoremap ;na â
inoremap ;nA Â
inoremap ;no ô
inoremap ;nO Ô
inoremap ;ni î
inoremap ;nI Î
inoremap ;nu û
inoremap ;nU Û
inoremap ;ne ê
inoremap ;nE Ê

" Fêhu
inoremap ;nrf ᚠ
" ÛruR
inoremap ;nru ᚢ
" ÞusaR
inoremap ;nrÞ ᚦ
" AnsuR
inoremap ;nra ᚨ
" Raiþô
inoremap ;nrr ᚱ
" Kauna
inoremap ;nrk ᚲ
" Gebô
inoremap ;nrg ᚷ
" Wina
inoremap ;nrw ᚹ
" HagalaR
inoremap ;nrh ᚺ
" Nauþi
inoremap ;nrn ᚾ
" ÎsaR
inoremap ;nri ᛁ
" Jêra
inoremap ;nrj ᛃ
" ÎwaR
inoremap ;nry ᛇ
" Perþi
inoremap ;nrp ᛈ
" AlgiR
inoremap ;nrz ᛉ
" Sôwili
inoremap ;nrs ᛊ
" TîwaR
inoremap ;nrt ᛏ
" Barkô
inoremap ;nrb ᛒ
" EwaR
inoremap ;nre ᛖ
" MannR
inoremap ;nrm ᛗ
" LaguR
inoremap ;nrl ᛚ
" InguR
inoremap ;nring ᛜ
" DagaR
inoremap ;nrd ᛞ
" Ôþala  
inoremap ;nro ᛟ
