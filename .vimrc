set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Bundle 'purescript-contrib/purescript-vim'
Bundle 'kovisoft/slimv'
Bundle 'def-lkb/vimbufsync'
Bundle 'morhetz/gruvbox'
Bundle 'zeis/vim-kolor'
Bundle 'nelsyeung/twig.vim'
Bundle 'NLKNguyen/vim-lisp-syntax'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Plugin 'pbrisbin/vim-syntax-shakespeare'
"Plugin 'enomsg/vim-haskellConcealPlus'
"Bundle 'itchyny/vim-haskell-indent'
Bundle 'Twinside/vim-hoogle'
Bundle 'dag/vim2hs'
Bundle 'vim-scripts/ReplaceWithRegister'
Bundle 'vim-airline/vim-airline'
"Bundle 'farseer90718/vim-taskwarrior'
Bundle 'justinmk/vim-syntax-extra'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/taglist.vim'
Plugin 'tpope/vim-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'Shougo/unite.vim'
Plugin 'rafaqz/citation.vim'
Bundle 'lilydjwg/colorizer'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'derekelkins/agda-vim'
Plugin 'mxw/vim-prolog'
Plugin 'chriskempson/base16-vim'
call vundle#end()
filetype plugin indent on
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set tabstop=2
set showcmd
set visualbell
set background=dark
colorscheme base16-harmonic-dark
syntax on
" colorscheme nord
let g:nord_comment_brightness = 12

" Powerline
let g:airline_powerline_fonts = 1
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
"Linia kończąca linię na 72 znaku
set colorcolumn=72
highlight ColorColumn ctermbg=14

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
autocmd FileType tex,markdown inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
autocmd FileType tex,markdown vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>
autocmd FileType tex nnoremap <C-m> :!make<CR>

" Pastemode
set pastetoggle=<leader>z

" Tabulacje shift + kierunek
noremap <S-l> gt
noremap <S-h> gT

let mapleader = ","
"let maplocalleader = ","

" Unite
nmap <leader>u [unite]
nnoremap [unite] <nop>
nnoremap <silent>[unite]c       :<C-u>Unite -buffer-name=citation-start-insert -default-action=append      citation/key<cr>

" UltiSnips konfiguracja
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Cytaty
let g:citation_vim_bibtex_file="./bibdb.bib"
let g:citation_vim_mode="bibtex"
let g:citation_vim_cache_path='~/.vimcache'
let g:citation_vim_outer_prefix="["
let g:citation_vim_inner_prefix="@"
let g:citation_vim_suffix="]"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Taglist konfiguracja
nnoremap <silent> <F8> :TlistToggle<CR>

"Youcompleteme fix
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Matematyczne
autocmd FileType tex inoremap ;lab \label{}<Esc>hi
autocmd FileType tex inoremap ;ref \eqref{}<Esc>hi
autocmd FileType tex inoremap ;enum \begin{enumerate}[i)]<Enter>\item <++><Enter>\end{enumerate}<Enter><Esc>?<++>"_c4l
autocmd FileType tex inoremap ;eq* \begin{align*}<Enter><++><Enter>\end{align*}<Enter><Esc>?<++><Enter>"_c4l
autocmd FileType tex inoremap ;eq \begin{align}<Enter><++><Enter>\end{align}<Enter><Esc>?<++><Enter>"_c4l
autocmd FileType tex inoremap ;( \(\)<Esc>hi
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

nnoremap ;pcf "=strftime("%F %H:%M:%S")<CR>P
inoremap ;pcf <C-R>=strftime("%F %H:%M:%S")<CR>

nnoremap ;log O<ESC>"=strftime("%c")<CR>P:r ~/.vim/templates/wpis<CR>5gg
nnoremap ;rmd :r ~/.vim/templates/notatki.rmd<CR>ggdd
nnoremap ;pcd O<ESC>"=strftime("%c")<CR>P
nnoremap ;gtk :r ~/.vim/templates/gtk_window.temp<CR>ggdd9gg

inoremap ;up0 ⁰
inoremap ;up1 ¹
inoremap ;up2 ²
inoremap ;up3 ³
inoremap ;up4 ⁴

" QED sign
inoremap ;qed □

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

nnoremap ;bd :bd<CR>

inoremap ;gll λ
inoremap ;glL Λ

" Disables automatic commenting on newline:
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" C-T for new tab
  nnoremap <C-t> :tabnew<cr>

""".bib
  autocmd FileType bib inoremap ;a @article{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>journal<Space>=<Space>"<++>",<Enter><tab>volume<Space>=<Space>"<++>",<Enter><tab>pages<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>8kA,<Esc>i
  autocmd FileType bib inoremap ;b @book{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>publisher<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>6kA,<Esc>i
  autocmd FileType bib inoremap ;c @incollection{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>booktitle<Space>=<Space>"<++>",<Enter><tab>editor<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>publisher<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>8kA,<Esc>i

"MARKDOWN
  autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
  autocmd Filetype markdown,rmd inoremap ;n ---<Enter><Enter>
  autocmd Filetype markdown,rmd inoremap ;b ****<++><Esc>F*hi
  autocmd Filetype markdown,rmd inoremap ;s ~~~~<++><Esc>F~hi
  autocmd Filetype markdown,rmd inoremap ;e **<++><Esc>F*i
  autocmd Filetype markdown,rmd inoremap ;h ====<Space><++><Esc>F=hi
  autocmd Filetype markdown,rmd inoremap ;i ![](<++>)<++><Esc>F[a
  autocmd Filetype markdown,rmd inoremap ;a [](<++>)<++><Esc>F[a
  autocmd Filetype markdown,rmd inoremap ;1 #<Space><Enter><++><Esc>kA
  autocmd Filetype markdown,rmd inoremap ;2 ##<Space><Enter><++><Esc>kA
  autocmd Filetype markdown,rmd inoremap ;3 ###<Space><Enter><++><Esc>kA
  autocmd Filetype markdown,rmd inoremap ;l --------<Enter>
  autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>--pdf-engine=xelatex<space>-o<space><C-r>%.pdf<Enter><Enter>
  autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
  autocmd Filetype rmd inoremap ;r ```{r}<CR>```<CR><CR><esc>2kO
  autocmd Filetype rmd inoremap ;p ```{python}<CR>```<CR><CR><esc>2kO

" Hoogle
    au BufNewFile,BufRead *.hs map <buffer> <F1> :Hoogle
    au BufNewFile,BufRead *.hs map <buffer> <C-F1> :HoogleClose<CR>
    au BufNewFile,BufRead *.hs map <buffer> <S-F1> :HoogleLine<CR>

let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2


" Yesod shakespeare
" let g:hamlet_prevent_invalid_nesting = 0
" let g:hamlet_highlight_trailing_space = 0

