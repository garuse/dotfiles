" -*- mode: vimrc -*-

"vim: ft=vim

" dotspacevim/auto-install {{{
" Automatic installation of spacevim.

if empty(glob('~/.vim/autoload/spacevim.vim'))
    silent !curl -sSfLo ~/.vim/autoload/spacevim.vim --create-dirs
          \ https://raw.githubusercontent.com/ctjhoa/spacevim/master/autoload/spacevim.vim
endif

" }}}

" dotspacevim/init {{{
" This code is called at the very startup of Spacevim initialization
" before layers configuration.
" You should not put any user code in there besides modifying the variable
" values."
" IMPORTANT: For the moment, any changes in plugins or layers needs
" a vim restart and :PlugInstall

  let g:dotspacevim_distribution_mode = 1

  let g:dotspacevim_configuration_layers = [
  \  'core/.*',
  \  'git',
  \  'syntax-checking'
  \]

  let g:dotspacevim_additional_plugins = [
  \ 'morhetz/gruvbox',
  \ 'YorickPeterse/happy_hacking.vim',
  \ 'roosta/vim-srcery',
  \ 'tyrannicaltoucan/vim-deep-space',
  \ 'tpope/vim-sleuth',
  \ 'sickill/vim-pasta',
  \ 'luochen1990/rainbow',
  \ 'mattn/emmet-vim',
  \ 'moll/vim-bbye',
  \ 'posva/vim-vue',
  \ 'itchyny/lightline.vim',
  \ 'hail2u/vim-css3-syntax',
  \ 'wavded/vim-stylus',
  \ 'honza/vim-snippets',
  \ 'MarcWeber/vim-addon-mw-utils',
  \ 'tomtom/tlib_vim',
  \ 'garbas/vim-snipmate',
  \ 'ervandew/supertab',
  \ 'maralla/validator.vim'
  \]

  let g:dotspacevim_excluded_plugins = [
  \ 'jaxbot/browserlink.vim',
  \ 'ajh17/VimCompletesMe',
  \ 'skammer/vim-css-color',
  \ 'ctrlpvim/ctrlp.vim',
  \ 'SirVer/ultisnips',
  \]

  " let g:dotspacevim_escape_key_sequence = 'fd'

" }}}

" dotspacevim/user-init {{{
" Initialization for user code.
" It is compute immediately after `dotspacemacs/init', before layer
" configuration executes.
" This function is mostly useful for variables that need to be set
" before plugins are loaded. If you are unsure, you should try in setting
" them in `dotspacevim/user-config' first."

  let mapleader = ' '
  let g:leaderGuide_vertical = 0

" }}}

call spacevim#bootstrap()

" dotspacevim/user-config {{{
" Configuration for user code.
" This is computed at the very end of Spacevim initialization after
" layers configuration.
" This is the place where most of your configurations should be done.
" Unless it is explicitly specified that
" a variable should be set before a plugin is loaded,
" you should place your code here."

  set background=dark
  colorscheme gruvbox
  set mouse=a
  set so=5
  set hidden
  set et sw=2 sts=2
  set laststatus=2
  set wildmode=list:longest
  set completeopt=longest,menuone,preview
  set complete=.,w,b,u,t,i,kspell
  " set iskeyword+=_,$,@,%,# " none of these are word dividers
  set diffopt+=iwhite
  set history=10000
  set cm=blowfish2
  set nu

  set backup
  " create backupdir if needed
  silent !mkdir -p ~/tmp/vim/backup
  " where to put backup files
  set backupdir=~/tmp/vim/backup
  " create tmp directory if needed
  silent !mkdir -p ~/tmp/vim/tmp
  " directory for swap files
  set directory=~/tmp/vim/tmp
  " create undodir if needed
  silent !mkdir -p ~/tmp/vim/undodir
  set undodir=~/tmp/vim/undodir
  set undofile
  set undolevels=1000 " maximum number of changes that can be undone
  set undoreload=10000 " maximum number lines to save for undo on a buffer reload
  set t_Co=256
  set cursorline
  set lazyredraw
  set synmaxcol=512

  " mappings
  vn > >gv
  vn < <gv
  vm <c-x> "+x
  vm <c-c> "+y
  cno <c-v> <c-r>+
  exe 'ino <script> <C-V>' paste#paste_cmd['i']
  no ; :
  no Q gq
  no gV `[v`]
  no ,f :ls<cr>:b<space>
  no <c-n> <esc>:bn<cr>
  no <c-p> <esc>:bp<cr>
  no <c-j> <esc><c-w>j
  no <c-k> <esc><c-w>k
  no <c-h> <esc><c-w>h
  no <c-l> <esc><c-w>l
  no <tab> :b#<cr>
  no <F4> <esc>:Bdelete!<cr>
  no <c-s> <esc>:up!<cr>
  ino <c-s> <esc>:up!<cr>
  ino <c-f> <right>
  ino <c-b> <left>
  ino <c-k> <up>
  ino <c-j> <down>
  ino <c-a> <c-o>^
  ino <c-e> <c-o>$
  cmap cd. lcd %:p:h
  cmap >fn <c-r>=expand('%:p')<cr>
  cmap >fd <c-r>=expand('%:p:h').'/'<cr>

  let g:rainbow_active = 1
  " let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
  let g:SuperTabDefaultCompletionType = "context"
  let b:vcm_tab_complete = "omni"

" }}}
