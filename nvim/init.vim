set shell=/usr/local/bin/zsh

scriptencoding utf8
set fileencoding=utf-8
set termencoding=utf8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
" set ambiwidth=double

set nobackup
set noswapfile
set nowritebackup

set hidden        " バッファが編集中でもその他のファイルを開けるように

filetype plugin indent on
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set smartindent   " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2  " smartindentで増減する幅

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
set ignorecase    " 検索パターンに大文字小文字を区別しない
set smartcase     " 検索パターンに大文字を含んでいたら大文字小文字を区別する

" ヤンクをクリップボードへ繋ぐ
set clipboard=unnamed

set title         " タイトルを表示
set number        " 行番号表示
set cursorline    " カーソルラインをハイライト
set showmatch     " 括弧入力時の対応する括弧を表示

" ------------------------------------------------------------
"  key bind
" ------------------------------------------------------------
" insertモードでemacsのキーバインドを使えるようにする
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>

" 入力モードでjjと入力した場合はESCとみなす
inoremap jj <Esc>

" 理論行が折り返しでも表示行単位で移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" バッファ移動の操作
nnoremap 8 :bprev<CR>
nnoremap 9 :bnext<CR>
nnoremap bf :bfirst<CR>
nnoremap bl :blast<CR>
" バッファの削除
nnoremap bd :bdelete<CR>

" コマンドラインモードでbashのキーバインドを使えるようにする
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" コマンド履歴をフィルタリングして辿る
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" コマンドラインモードで現在のファイルの相対パスのディレクトリを展開
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" terminal emulatorでノーマルモードに戻る
tnoremap <silent> <ESC> <C-\><C-n>

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

" ------------------------------------------------------------
" dein.vim
" ------------------------------------------------------------
if &compatible
  set nocompatible
endif

set runtimepath+=~/.dein/repos/github.com/Shougo/dein.vim
let s:dein_dir = expand('~/.dein')
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml('~/.dein.toml')
  call dein#end()
  call dein#save_state()
endif

" インストールしていないプラグインがあればインストールを実行
if dein#check_install()
  call dein#install()
endif

" ------------------------------------------------------------
" colorscheme
" ------------------------------------------------------------
colorscheme nord
