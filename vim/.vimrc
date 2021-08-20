" Enable default settings.
filetype plugin indent on
set number
set ruler
set cursorline
set wildmenu
syntax enable
colorscheme monokai

" Change backup files to /tmp
call system('mkdir /tmp/vim/')
set directory=/tmp/vim//
set undodir=/tmp/vim//
set undofile

" Reload the current buffer if changed externally.
set autoread

" Auto indent with 2 spaces.
" set smartindent
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set expandtab

" Use ^o to togger insert (paste) mode.
set pastetoggle=<C-o>

" Map ^hjkl to move between window panes.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Map ^e to close pane if there are no changes.
map <C-e> :q<cr>

" Map <> to change indentation with re-highlight in visual mode.
vmap > >gv
vmap < <gv

" Map jk to command mode.
inoremap jk <ESC>

" Allow auto reloading the vimrc.
augroup reload
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC

  " Always check for modifications.
  autocmd BufEnter * checktime

  " Add non-standard extensions.
  autocmd BufNewFile,BufRead *.json set filetype=javascript
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.txt set filetype=text

  " Add filetype local behavior.
  autocmd BufWritePost *.go silent execute "!gofmt -s -w %" | redraw!
  autocmd BufWritePost *.rs silent execute "!rustfmt %" | redraw!
  autocmd FileType css setlocal iskeyword+=-
  autocmd FileType gitcommit,markdown setlocal spell wrap
  autocmd FileType go setlocal noexpandtab
  autocmd FileType html setlocal textwidth=0
  autocmd FileType text setlocal textwidth=0
augroup END

" Add a git blame command.
if !exists(':Blame')
  command Blame !cd "%:p:h" && git blame "%:t"
endif

autocmd BufNewFile,BufRead Vagrantfile   set syntax=ruby

" Disables arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Allows mouse scrolling and highlighting text by clicking
set mouse=a
set nowrap

"" Override default splitting behaviors
" vsplitting makes new buffer appear on right
set splitright
" splitting makes new bugger appear below
set splitbelow
" Removes cursorline. Investigate to see why this is so slow on iTerm2
set nocursorline

"" Searching options
set hlsearch
noremap <F4> :set hlsearch! hlsearch?<CR>
