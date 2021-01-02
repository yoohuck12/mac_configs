set hlsearch " 검색어 하이라이팅
set nu " 줄번호
set autoindent " 자동 들여쓰기
set scrolloff=10
set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1 " 스크롤바 너비
set autowrite " 다른 파일로 넘어갈 때 자동 저장
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set cindent " C언어 자동 들여쓰기
set bs=eol,start,indent
set history=256
set laststatus=2 " 상태바 표시 항상
"set paste " 붙여넣기 계단현상 없애기
set showmatch " 일치하는 괄호 하이라이팅
set smartcase " 검색시 대소문자 구별
"set smarttab
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4
set ruler " 현재 커서 위치 표시
set incsearch
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set ignorecase
"autocmd FileType python set shiftwidth=2
"autocmd FileType python set tabstop=2
"autocmd FileType python set softtabstop=2

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"" 마지막으로 수정된 곳에 커서를 위치함
"au BufReadPost *
" if line("'\"") > 0 && line("'\"") <= line("$") |
" exe "norm g`\"" |
" endif
"" 파일 인코딩을 한국어로
"if $LANG[0]=='k' && $LANG[1]=='o'
"set fileencoding=korea
"endif
" 구문 강조 사용
if has("syntax")
 syntax on
endif

"colorscheme desert

set tags+=/home/work/trunk/src/tags
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'The-NERD-tree'
Plugin 'taglist.vim'
Plugin 'taglist-plus'
Plugin 'altercation/vim-colors-solarized'
Plugin 'google/vim-searchindex'
Plugin 'valloric/youcompleteme'
Plugin 'jeetsukumaran/vim-pythonsense'
call vundle#end()   

map <F6> :NERDTreeToggle<cr>

nmap <C-h> <C-w>h
"nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

function Blame() range
    execute '!git blame -L ' . a:firstline . ',' . a:lastline . ' %'
endfunction
vnoremap b :call Blame()<CR>

set csprg=/usr/local/bin/cscope
set csto=1
set cst
set nocsverb

if filereadable("./cscope.out")
cs add cscope.out
else
cs add /home/work/trunk/cscope.out
endif
set csverb

let g:quickr_cscope_keymaps = 0
nmap <Leader>s <plug>(quickr_cscope_symbols)
nmap <Leader>c <plug>(quickr_cscope_callers)


"<taglist>
"filetype plugin on
let Tlist_Show_One_File = 1
let Tlist_WinWidth = 60
let Tlist_Display_Prototype = 1
"map <Leader>t :TlistToggle<CR>

syntax enable
set background=dark
"colorscheme solarized

set colorcolumn=80
autocmd FileType python  setlocal colorcolumn=80

execute pathogen#infect()
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
"To avoid conflict snippets
let g:ycm_key_list_select_completion = ['<C-u>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1

nmap <C-g> :YcmCompleter GoTo<CR>
" nnoremap gg :YcmCompleter GoToImprecise
nmap <C-d> :YcmCompleter GoToDeclaration<CR>
nmap <C-t> :YcmCompleter GetType<CR>
