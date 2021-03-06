" PLUGIN INSTALLATION
call plug#begin('~/.vim/plugged')

" File manager
Plug 'scrooloose/nerdtree'

" Utility functions used by other plugins 
"" Plug 'tomtom/tlib_vim' 

" nginx support
Plug 'chr4/nginx.vim'

" Navigate painlessly between vim/tmux windows
Plug 'christoomey/vim-tmux-navigator'

" Easily align tables
"" Plug 'godlygeek/tabular'

" Personal wiki
Plug 'vimwiki/vimwiki'

" Linting
Plug 'dense-analysis/ale'

" Git client
Plug 'tpope/vim-fugitive'

" Git diff in the gutter
Plug 'airblade/vim-gitgutter'

" Snippets generation & build-in snippets
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'

" Tag navigation in a side window
Plug 'majutsushi/tagbar'

" Automatic tags generation
Plug 'craigemery/vim-autotag'

" Smart command dispatching
Plug 'tpope/vim-dispatch'

" Comment stuff
Plug 'tpope/vim-commentary'

" Run your tests at the speed of thought
Plug 'janko-m/vim-test'

" Autocompletion
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Better javascript support
Plug 'pangloss/vim-javascript'

" typescript
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/tsuquyomi'

" Pretty code
Plug 'prettier/vim-prettier'

" Scratch buffer
Plug 'mtth/scratch.vim'

Plug 'rafi/awesome-vim-colorschemes'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" nvim plugins
if has('nvim')
  " Wrapper of some neovim's :terminal functions
  Plug 'kassio/neoterm'
endif

" vimux - integration with tmux
Plug 'benmills/vimux'

" fzf
Plug 'junegunn/fzf', {'dir': '~/.vim/plugged/fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
"Plug '~/.fzf'

"scheme
Plug 'chriskempson/base16-vim'

call plug#end()

" define mapleader
let mapleader = ','

" PLUGIN SETTINGS 
"
" nerdtrexe
:verbose nmap <leader>n :NERDTreeToggle<CR>

" execute script
map <leader>r :!%:p<CR>

" prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.jsx,*.js,*.json,*.css,*.scss,*.less,*.graphql
" Prettier

" ctrlp filter
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" scratch buffer
let g:scratch_persistence_file = '.scratch.vim'
let g:scratch_autohide = 1
let g:scratch_insert_autohide = 0

" vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
let test#strategy = "vimux"
" let g:test#ruby#rspec#executable = 'docker-compose exec app bundle exec rspec'

" personal wiki
let g:vimwiki_list = [{'path': '~/wiki/', 'path_html': '~/wiki_html/', 'syntax': 'markdown', 'ext': '.md'}]

" linting
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = "never"

" fugitive
nmap <leader>gg :Git
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gr :Gread<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gW :Gwrite<CR>:Gcommit<CR>
nmap <leader>gM :Gwrite<CR>:Git commit --amend<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>g. :Git add .<CR>
nmap <leader>gm :Git commit --amend<CR>
nmap <leader>gA :Git commit -a<CR>
" add git branch to the status line with fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-e>"

" fzf
nmap <leader>ff :Files<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fgf :GFiles<CR>
nmap <leader>fc :Colors<CR>
nmap <leader>fpt :Tags<CR>
nmap <leader>ft :BTags<CR>
nmap <leader>fgc :Commits<CR>

" tagbar
nmap <leader>t :TagbarToggle<CR>


" VIM SETTINGS

filetype plugin indent on

au BufRead, BufNewFile /etc/nginx/*,/etc/nginx/conf.d/*,/usr/local/nginx/conf/*,*/conf/nginx.conf, ~/src/openresty if &ft == '' | setfiletype nginx | endif

" enable syntax highlighting
syntax on

" relative numbers
:set number relativenumber

" enable spell check
set nospell

" number of spaces for (auto) indent
set shiftwidth=2

" use spaces instead of tabs
set expandtab

" do case insensitive matching
set ignorecase

" do smart case matching
set smartcase

" incremental search
set incsearch

" do not hightlight search results
set nohlsearch

" enable mouse usage
set mouse=a

" avoid backspace problems
set backspace=indent,eol,start

" silent bell
set vb

" show column and line position
set ruler


" always show status line
set laststatus=2

" number of colors
set t_Co=256
" colorscheme slate
"colorscheme molokayo
colorscheme onedark
" colorscheme angr
" colorscheme apprentice
" colorscheme dracula
" colorscheme gotham
" colorscheme jellybeans

""" other config """
" rabl templates are ruby files
autocmd BufNewFile,BufRead *.rabl set ft=ruby

" git
autocmd Filetype gitcommit setlocal spell textwidth=72 " commit messages with spell checking and textwidth

" command to reload local vim configuration
command! Vimrc source $MYVIMRC

" tab navigation
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tP :tabfirst<CR>
nnoremap <leader>tN :tablast<CR>

" airline settings
let g:airline_theme='onedark'
"let g:airline_theme='wombat'
"let g:airline_theme='base16'
"let g:airline_theme='molokai'
let g:airline_powerline_fonts=1

" fzf configuration
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" set syntastic to work with eslint in local project
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

" set pnaglos javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END
 
