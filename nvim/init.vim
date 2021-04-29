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

set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set smartindent   " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2  " smartindentで増減する幅

"ファイルタイプに合わせたインデントを利用
filetype plugin indent on
"sw=shiftwidth, sts=softtabstop, ts=tabstop, et=expandtabの略
autocmd FileType text setlocal sw=8 sts=8 ts=8 et

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
" vim-plug
" ------------------------------------------------------------
call plug#begin('~/dotfiles/nvim/plugged')
" color scheme
Plug 'arcticicestudio/nord-vim'
  let g:nord_cursor_line_number_background = 0
  let g:nord_uniform_diff_background = 0

" NERDTree
Plug 'preservim/nerdtree'
  let NERDTreeShowHidden=1
  nnoremap <silent><C-a> :NERDTreeFind<CR>:vertical res 30<CR>

" neoterm
Plug 'kassio/neoterm'
  let g:neoterm_autoinsert = 1
  let g:neoterm_default_mod = 'botright'
  let g:neoterm_autoscroll = 1
  let g:neoterm_automap_keys = '<C-c>'
  nnoremap <C-n> :Tnew<CR>
  nnoremap <silent><C-t> :<c-u>exec v:count.'Topen'<CR>
  nnoremap <silent><C-l> :Tclear<CR>
  nnoremap <silent><C-q> :Tclose<CR>
  nnoremap td :Tclose!<CR>
  tnoremap <silent><C-w><C-w> <C-\><C-n><C-w><C-w>
  tnoremap <silent><C-q> <C-\><C-n>:Tclose<CR>

" ウィンドウの幅をctr+eで調整
Plug 'simeji/winresizer'

" airline
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
  let g:airline_powerline_fonts = 0
  let g:airline_theme = 'nord'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let g:airline#extensions#tabline#fnamemod = ':t'

" gitの各種コマンド実行
Plug 'tpope/vim-fugitive'
  :command Gs Gstatus
  :command Gd Gvdiff

" gitのHEADとの差分を表示
Plug 'airblade/vim-gitgutter'

" linters
Plug 'dense-analysis/ale'
  let g:ale_lint_on_text_changed = 0
  let g:ale_lint_on_enter = 1
  let g:ale_lint_on_save = 1
  let g:ale_sign_column_always = 1
  let g:ale_linters = {
    \ 'ruby': ['rubocop', 'solargraph'],
    \ 'dockerfile': ['dockerfile_lint', 'hadolint'],
    \ 'hcl': ['terraform-fmt'],
    \ }
  let g:ale_echo_msg_error_str = 'E'
  let g:ale_echo_msg_warning_str = 'W'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" インデントの可視化
Plug 'Yggdroot/indentLine'

" コメントアウト
Plug 'tpope/vim-commentary'

" 括弧のレインボーハイライト
Plug 'luochen1990/rainbow'
  let g:rainbow_active = 1

" 括弧の補完
Plug 'jiangmiao/auto-pairs'

" 括弧やタグに対するコマンド
Plug 'tpope/vim-surround'

" ドットコマンドの強化
Plug 'tpope/vim-repeat'

" syntax highlighting
Plug 'cespare/vim-toml'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'elzr/vim-json'
  let g:vim_json_syntax_conceal = 0

" ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'

" terraform
Plug 'hashivim/vim-terraform'
  let g:terraform_fmt_on_save=1

" fzf
Plug 'junegunn/fzf', { 'do': './install --all' } | Plug 'junegunn/fzf.vim'
  command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \ : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \ <bang>0)
  nnoremap <C-g> :Rg<Space>
  nnoremap <C-p> :Files<CR>
  nnoremap <C-y> :History<CR>

" vim-lsp
Plug 'prabirshrestha/vim-lsp'
  " lintをオフにする
  let g:lsp_diagnostics_enabled = 0
Plug 'mattn/vim-lsp-settings'
  let g:lsp_settings_servers_dir = '~/.dein/vim-lsp-settings/servers'

" オートコンプリートの使用
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

" ------------------------------------------------------------
" colorscheme
" ------------------------------------------------------------
colorscheme nord
