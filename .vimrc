scriptencoding utf-8

if &compatible
  set nocompatible " Be iMproved
endif

""" tab """
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noautoindent
set nosmartindent
set expandtab
set nosmarttab

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'
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
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-rooter'
Plug 'mattn/vim-sl'
Plug 'scrooloose/nerdtree'
call plug#end()

""" colorscheme """
" colorscheme molokai
colorscheme lucario
" colorscheme desert
" colorscheme kalisi

" let loaded_matchparen = 1 " 括弧の対応ハイライトoff
" Required:
filetype plugin indent on
syntax enable

""" NERDTree """
" let g:NERDTreeWinSize = 200
" nnoremap <silent><C-e> :NERDTreeToggle<CR>
" 標準ディレクトリビューワとして使うので特に不要

""" vim-rooter """
if executable('vim-rooter')
  let g:rooter_use_lcd = 1 " Change only current window's directory
  let g:rooter_change_directory_for_non_project_files = 'current' " files/directories for the root directory
  "autocmd! BufEnter *.c,*.cc,*.cxx,*.cpp,*.h,*.hh,*.java,*.py,*.sh,*.rb,*.html,*.css,*.js :Rooter " Automatically change the directory
endif
" set autochdir " vim-routerでやっているのでoff

""" vim-lsp """
" debug
" let g:lsp_log_verbose = 1
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:lsp_diagnostics_enabled = 0
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript', 'javascript.jsx']
      \ })
endif
" if executable('docker-langserver')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'docker-langserver',
"         \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
"         \ 'whitelist': ['dockerfile'],
"         \ })
" endif
" if executable('docker-langserver')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'intelephense',
"         \ 'cmd': {server_info->['node', expand('~/.npm/intelephense/lib/intelephense.js'), '--stdio']},
"         \ 'initialization_options': {"storagePath": "PATH_TO_TEMP_FOLDER/intelephense"},
"         \ 'whitelist': ['php'],
"         \ })
" endif

""" ALE """
" phpも記載すべき
" let g:ale_linters = {
"       \ 'javascript': ['eslint'],
"       \ }
let g:ale_enabled = 0

""" ctrlp """
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp' " キャッシュディレクトリ
let g:ctrlp_clear_cache_on_exit = 0 " キャッシュを終了時に削除しない
let g:ctrlp_lazy_update = 200 " 遅延再描画
let g:ctrlp_root_markers = ['.git', 'docker-compose.yml', 'docker-compose.yaml'] " ルートパスと認識させるためのファイル
let g:ctrlp_max_height = 20 " CtrlPのウィンドウ最大高さ
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png " 無視するディレクトリ
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|vendor)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_use_migemo = 0

""" この設定なにか忘れた """
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype javascript inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype typescript inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype jsx inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype tsx inoremap <buffer> </ </<C-x><C-o>
augroup END

""" 表示 """
set nowrap " 長い行を折り返さない
set textwidth=0 " テキストの折り返し幅は0
" autocmd FileType text setlocal textwidth=0
set number " 行番号
set list " タブや改行
set statusline=\ %M%n\ %<%f\ %R%H%W\ %{'['.(&fenc!=''?&fenc:&enc).','.&fileformat.']'}%=%c@%l/%L\ [%B] " ステータスラインの表示
set listchars=tab:~`,trail:^,extends:>,precedes:<,nbsp:% " どの文字でタブや改行を表示するかを設定
set colorcolumn=81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100 " 81から100行目までを色つけ。文字制限をする気持ち

" 全角スペースのハイライト
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

""" 操作 """
set nobackup " バックアップファイルを作成しない
set noundofile " バックアップファイルを作成しない

set hidden " 保存していないバッファがあっても、切り替えができる
set imdisable " ノーマルモードのときに、IMEをOFFにする
set clipboard=unnamedplus
" set clipboard=unnamed,autoselect,unnamedplus
set nf=alpha,hex " 自動インクリメントから8進数を除去

set whichwrap=b,s,<,>,~,[,] " 行末、行頭間の移動設定
nnoremap ; :
nnoremap : ;

" inotifyでコードを監視するときに、そのままだとMOVE_SELFイベントが走ってしまい、変更が検知できないが、それを防ぐ設定
set nowritebackup
set backupcopy=yes

""" command """

function! Ale()
  call lsp#disable()
  set spell
  set spelllang=en,cjk
  " ale#ALEEnable
  call ale#toggle#Enable()
endfunction

function! Lsp()
  set nospell
  " ale#ALEDisable
  call ale#toggle#Disable()
  call lsp#enable()
endfunction

command! -nargs=0 -complete=file ALEmode call Ale()
command! -nargs=0 -complete=file LSPmode call Lsp()

LSPmode

