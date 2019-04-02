
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)
"
" An example for a Japanese version vimrc file.
" 日本語版のデフォルト設定ファイル(vimrc) - Vim7用試作
"
" Last Change: 24-Jul-2017.
" Maintainer:  MURAOKA Taro <koron.kaoriya@gmail.com>
"
" 解説:
" このファイルにはVimの起動時に必ず設定される、編集時の挙動に関する設定が書
" かれています。GUIに関する設定はgvimrcに書かかれています。
"
" 個人用設定は_vimrcというファイルを作成しそこで行ないます。_vimrcはこのファ
" イルの後に読込まれるため、ここに書かれた内容を上書きして設定することが出来
" ます。_vimrcは$HOMEまたは$VIMに置いておく必要があります。$HOMEは$VIMよりも
" 優先され、$HOMEでみつかった場合$VIMは読込まれません。
"
" 管理者向けに本設定ファイルを直接書き換えずに済ませることを目的として、サイ
" トローカルな設定を別ファイルで行なえるように配慮してあります。Vim起動時に
" サイトローカルな設定ファイル($VIM/vimrc_local.vim)が存在するならば、本設定
" ファイルの主要部分が読み込まれる前に自動的に読み込みます。
"
" 読み込み後、変数g:vimrc_local_finishが非0の値に設定されていた場合には本設
" 定ファイルに書かれた内容は一切実行されません。デフォルト動作を全て差し替え
" たい場合に利用して下さい。
"
" 参考:
"   :help vimrc
"   :echo $HOME
"   :echo $VIM
"   :version

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noautoindent
set nosmartindent
set expandtab
set nosmarttab
" テキストの折り返し幅は0にしちゃいます。
set textwidth=0
autocmd FileType text setlocal textwidth=0
" 行末、行頭間の移動設定
set whichwrap=b,s,<,>,~,[,]
" 保存していないバッファがあっても、切り替えができる
set hidden
" ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ;
" ノーマルモードのときに、IMEをOFFにする
" set imdisable

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
" set nonumber
set number
" タブや改行を表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
set listchars=tab:~`,trail:^,extends:>,precedes:<,nbsp:%
" 長い行を折り返して表示 (nowrap:折り返さない)
"set wrap
set nowrap
" ステータスラインの表示
set statusline=\ %M%n\ %<%f\ %R%H%W\ %{'['.(&fenc!=''?&fenc:&enc).','.&fileformat.']'}%=%c@%l/%L\ [%B]

"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup
set noundofile
" set autochdir

"---------------------------------------------------------------------------
" 外部アプリとのコピペ連携
" set clipboard=unnamed,autoselect,unnamedplus
set clipboard=unnamedplus

" ファイルタイプ
filetype plugin indent on

" 自動インクリメントから8進数を除去
set nf=alpha,hex

set colorcolumn=81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100

" Copyright (C) 2009-2013 KaoriYa/MURAOKA Taro



" gvimrc
" scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)
"
" An example for a Japanese version gvimrc file.
" 日本語版のデフォルトGUI設定ファイル(gvimrc) - Vim7用試作
"
" Last Change: 28-Mar-2016.
" Maintainer:  MURAOKA Taro <koron.kaoriya@gmail.com>
"
" 解説:
" このファイルにはVimの起動時に必ず設定される、GUI関連の設定が書かれていま
" す。編集時の挙動に関する設定はvimrcに書かかれています。
"
" 個人用設定は_gvimrcというファイルを作成しそこで行ないます。_gvimrcはこの
" ファイルの後に読込まれるため、ここに書かれた内容を上書きして設定することが
" 出来ます。_gvimrcは$HOMEまたは$VIMに置いておく必要があります。$HOMEは$VIM
" よりも優先され、$HOMEでみつかった場合$VIMは読込まれません。
"
" 管理者向けに本設定ファイルを直接書き換えずに済ませることを目的として、サイ
" トローカルな設定を別ファイルで行なえるように配慮してあります。Vim起動時に
" サイトローカルな設定ファイル($VIM/gvimrc_local.vim)が存在するならば、本設
" 定ファイルの主要部分が読み込まれる前に自動的に読み込みます。
"
" 読み込み後、変数g:gvimrc_local_finishが非0の値に設定されていた場合には本設
" 定ファイルに書かれた内容は一切実行されません。デフォルト動作を全て差し替え
" たい場合に利用して下さい。
"
" 参考:
"   :help gvimrc
"   :echo $HOME
"   :echo $VIM
"   :version

"---------------------------------------------------------------------------
" カラー設定:
" colorscheme morning
" colorscheme darkblue

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

"全角スペースをハイライト表示
" function! ZenkakuSpace()
"     highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
" endfunction

" if has('syntax')
"     augroup ZenkakuSpace
"         autocmd!
"         autocmd ColorScheme       * call ZenkakuSpace()
"         autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
"     augroup END
"     call ZenkakuSpace()
" endif

" if has('multi_byte_ime') || has('xim')
"   " IME ON時のカーソルの色を設定(設定例:紫)
"   highlight CursorIM guibg=Purple guifg=NONE
"   " 挿入モード・検索モードでのデフォルトのIME状態設定
"   set iminsert=0 imsearch=0
"   if has('xim') && has('GUI_GTK')
"     " XIMの入力開始キーを設定:
"     " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
"     "set imactivatekey=s-space
"   endif
"   " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
"   "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
" endif

"---------------------------------------------------------------------------
" メニューに関する設定:
"
" 解説:
" "M"オプションが指定されたときはメニュー("m")・ツールバー("T")供に登録され
" ないので、自動的にそれらの領域を削除するようにした。よって、デフォルトのそ
" れらを無視してユーザが独自の一式を登録した場合には、それらが表示されないと
" いう問題が生じ得る。しかしあまりにレアなケースであると考えられるので無視す
" る。
"
" " set guioptions-=m
" set guioptions-=T
" set guioptions-=r
" set guioptions-=R
" set guioptions-=l
" set guioptions-=L
" set guioptions-=b
" set winaltkeys=yes
" " set guioptions=mM


if &compatible
  set nocompatible               " Be iMproved
endif

" " Required:
" set runtimepath+=/home/sugiyama/.cache/dein/repos/github.com/Shougo/dein.vim
" 
" " Required:
" if dein#load_state('/home/sugiyama/.cache/dein')
"   call dein#begin('/home/sugiyama/.cache/dein')
" 
"   " Let dein manage dein
"   " Required:
"   call dein#add('/home/sugiyama/.cache/dein/repos/github.com/Shougo/dein.vim')
"   call dein#add('prabirshrestha/vim-lsp')
"   " Add or remove your plugins here like this:
"   "call dein#add('Shougo/neosnippet.vim')
"   "call dein#add('Shougo/neosnippet-snippets')
" 
"   " Required:
"   call dein#end()
"   call dein#save_state()
" endif

" if executable('typescript-language-server')
"   au User lsp_setup call lsp#register_server({
"     \ 'name': 'javascript support using typescript-language-server',
"     \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"     \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
"     \ 'whitelist': ['javascript', 'javascript.jsx'],
"     \ })
" endif

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim' " fzfいれる？
" Plug 'w0rp/ale'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'othree/yajs.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'posva/vim-vue'
Plug 'tomasr/molokai'
Plug 'raphamorim/lucario'
Plug 'freeo/vim-kalisi'
Plug 'tpope/vim-abolish'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-rooter'
Plug 'mattn/vim-sl'
Plug 'scrooloose/nerdtree'
call plug#end()

let g:NERDTreeWinSize = 200
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" call sl#animate()

" let g:lsp_diagnostics_enabled = 0
" debug
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript', 'javascript.jsx']
      \ })
endif

"if ! empty(neobundle#get("vim-rooter"))
  " Change only current window's directory
let g:rooter_use_lcd = 1
  " files/directories for the root directory
let g:rooter_change_directory_for_non_project_files = 'current'
  " Automatically change the directory
  "autocmd! BufEnter *.c,*.cc,*.cxx,*.cpp,*.h,*.hh,*.java,*.py,*.sh,*.rb,*.html,*.css,*.js :Rooter
"endif

" if executable('docker-langserver')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'docker-langserver',
"         \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
"         \ 'whitelist': ['dockerfile'],
"         \ })
" endif

" au User lsp_setup call lsp#register_server({
"     \ 'name': 'intelephense',
"     \ 'cmd': {server_info->['node', expand('~/.npm/intelephense/lib/intelephense.js'), '--stdio']},
"     \ 'initialization_options': {"storagePath": "PATH_TO_TEMP_FOLDER/intelephense"},
"     \ 'whitelist': ['php'],
"     \ })

" if executable('typescript-language-server')
"   au User lsp_setup call lsp#register_server({
"     \ 'name': 'javascript support using typescript-language-server',
"     \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"     \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
"     \ 'whitelist': ['javascript', 'javascript.jsx'],
"     \ })
" endif
" 
" if executable('typescript-language-server')
"   au User lsp_setup call lsp#register_server({
"     \ 'name': 'typescript-language-server',
"     \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"     \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
"     \ 'whitelist': ['typescript'],
"     \ })
" endif

" colorscheme molokai
colorscheme lucario
" colorscheme desert
" colorscheme kalisi
" set background=dark

" highlight MatchParen ctermfg=208 ctermbg=233 cterm=underline
" highlight MatchParen guifg=#FD971F guibg=#000000 gui=underline
let loaded_matchparen = 1

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

" inotifyでコードを監視するときに、そのままだとMOVE_SELFイベントが走ってしまい、
" 変更が検知できないが、それを防ぐ設定
set nowritebackup
set backupcopy=yes

" キャッシュディレクトリ
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
" キャッシュを終了時に削除しない
let g:ctrlp_clear_cache_on_exit = 0
" 遅延再描画
let g:ctrlp_lazy_update = 200
" ルートパスと認識させるためのファイル
let g:ctrlp_root_markers = ['.git', 'docker-compose.yml', 'docker-compose.yaml']
" CtrlPのウィンドウ最大高さ
let g:ctrlp_max_height = 20
" 無視するディレクトリ
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|vendor)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:ctrlp_use_migemo = 0

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype javascript inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype typescript inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype jsx inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype tsx inoremap <buffer> </ </<C-x><C-o>
augroup END

