set nocompatible

" For any plugins that use this, make their keymappings use comma
let mapleader = ","
let maplocalleader = ","

" Userful macros
nmap \v :vsplit<CR>
nmap \s :split<CR>
nmap \e :NERDTreeToggle<CR>

" Buffers --------
" switch between last file
nmap <C-e> :e#<CR>

" Move between open buffers.
"nmap <C-n> :bnext<CR>
"nmap <C-p> :bprev<CR>
:nnoremap <Leader>q :bd<CR>

" Window ---------
" Super fast window movement shortcuts
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Move -----------
noremap <S-J> <C-D>
noremap <S-K> <C-U>
noremap <S-H> b
noremap <S-L> e
noremap b <C-%>

" Word -----------
" search and replace
"noremap e ciw
":nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" I always hit ":W" instead of ":w" because I linger on the shift key...
command! Q q
command! W w
command! Wq wq

" ----------------------------------------------------------------------------
" PLUGIN SETTINGS
" ----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Solarized
"Plug 'altercation/vim-colors-solarized'

Plug 'chriskempson/base16-vim'

" Supertab
Plug 'ervandew/supertab'

" ALE
Plug 'w0rp/ale'

" Lightline
"Plug 'itchyny/lightline.vim'

" NerdTree
Plug 'scrooloose/nerdtree'

" GitGutter
Plug 'airblade/vim-gitgutter'

call plug#end()

" --------------------------------

" FZF
""git as a project dir
"function! s:find_git_root()
"  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
"endfunction
"command! ProjectFiles execute 'Files' s:find_git_root()
" gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
nmap ; :Buffers<CR>
nmap <Leader>r :Tags<CR>
"nmap <Leader>t :ProjectFiles<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>a :Ag<CR>

" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
let g:ale_linters = {'rust': ['rls']}
let g:ale_rust_cargo_use_check = 1

"" Lightline
"let g:lightline = {
"\ 'colorscheme': 'wombat',
"\ 'active': {
"\   'left': [['mode', 'paste'], ['filename', 'modified']],
"\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
"\ },
"\ 'component_expand': {
"\   'linter_warnings': 'LightlineLinterWarnings',
"\   'linter_errors': 'LightlineLinterErrors',
"\   'linter_ok': 'LightlineLinterOK'
"\ },
"\ 'component_type': {
"\   'readonly': 'error',
"\   'linter_warnings': 'warning',
"\   'linter_errors': 'error'
"\ },
"\ }
"function! LightlineLinterWarnings() abort
"  let l:counts = ale#statusline#Count(bufnr(''))
"  let l:all_errors = l:counts.error + l:counts.style_error
"  let l:all_non_errors = l:counts.total - l:all_errors
"  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
"endfunction
"function! LightlineLinterErrors() abort
"  let l:counts = ale#statusline#Count(bufnr(''))
"  let l:all_errors = l:counts.error + l:counts.style_error
"  let l:all_non_errors = l:counts.total - l:all_errors
"  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
"endfunction
"function! LightlineLinterOK() abort
"  let l:counts = ale#statusline#Count(bufnr(''))
"  let l:all_errors = l:counts.error + l:counts.style_error
"  let l:all_non_errors = l:counts.total - l:all_errors
"  return l:counts.total == 0 ? '✓ ' : ''
"endfunction
"
"" Update and show lightline but only if it's visible (e.g., not in Goyo)
"autocmd User ALELint call s:MaybeUpdateLightline()
"function! s:MaybeUpdateLightline()
"  if exists('#lightline')
"    call lightline#update()
"  end
"endfunction

"" SOLARIZED
"set background=light
"colorscheme solarized

" Custom colors for NERDTree
highlight def link NERDTreeRO NERDTreeFile









" ----------------------------------------------------------------------------
" Other
" ----------------------------------------------------------------------------
set tabstop=2 "Number of spaces that a <Tab> in the file counts for
set shiftwidth=2 "Number of spaces to use for each step of (auto)indent
set softtabstop=2 "Number of spaces that a <Tab> counts for while performing editing operations
set expandtab "tabs expanded to spaces
set smartindent "Do smart autoindenting when starting a new line
set autoindent "Copy indent from current line when starting a new line

set showmatch "When a bracket is inserted, briefly jump to the matching one
set number "show line numbers
set scrolloff=5 "Minimal number of screen lines to keep above and below the cursor.

" Show tab characters, trailing whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list "Show tabs as CTRL-I is displayed, display $ after end of line

"asdfasdfasdf
"filetype plugin indent on

"=== The ":syntax enable" command will keep your current color settings.  This
"allows using ":highlight" commands to set your preferred colors before or
"after using this command.  If you want Vim to overrule your settings with the
"defaults, use: >
"    :syntax on
if !exists("g:syntax_on")
    syntax enable
endif
""---


set hls "highlight search options
set incsearch "While typing show incremental search
set ic "default to case-insensitive search
set smartcase "allow case-sensitive search if there is one uppercase

set cursorline "highlight current line
hi CursorLine ctermbg=NONE cterm=underline "no color, just underline
set wildmode=longest,list "on tab filename complete, first tab produces longest. Second tab produces list.



set backspace=indent,eol,start "allow backspacing over indent, eol, start
set laststatus=2 " Set status line as second-to-last line
set statusline=%F%m%r%w\ %=\ [%l,%c]\ \ \ %p%%


""""remapping the keys in vim----------------------------
"" Remap jk while in insert mode to ESC
""inoremap jk <ESC>
"" Remap kj while in insert mode to ESC
"inoremap kj <ESC>


" Improved up/down scrolling on wrapped lines
nnoremap j gj
nnoremap k gk
"nnoremap <up> gk
"nnoremap <down> gj
imap <up> <c-o>gk
imap <down> <c-o>gj
" Remap window sizing
nmap <Leader>g :vertical resize 80%<CR>
nmap <Leader>z <C-w>=
nmap f :vertical resize +10<CR>

"""auto reload vim----------------------
augroup AutoReloadVimRC
    au!
    " automatically reload vimrc when it's saved
    au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

"set autochdir " Automatically change current working directory to most recent file



"""ctags------------------------
"set tags=tags;/
"set tags+=~/.tags/scala/tags


""""neocomplete----------------
""Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }
"
"" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? "\<C-y>" : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
"
"" AutoComplPop like behavior.
""let g:neocomplete#enable_auto_select = 1
"
"" Shell like behavior(not recommended).
""set completeopt+=longest
""let g:neocomplete#enable_auto_select = 1
""let g:neocomplete#disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
""let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
""let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
""let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
"" For perlomni.vim setting.
"" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'




