set nocompatible
set textwidth=79
set nu
set incsearch
set autoindent
"hlsearch setting
nnoremap <CR> :noh<CR><CR>
nmap gg=G gg=G''
set hlsearch
colorscheme smyck
"colorscheme Monokai-Refined
set foldmethod=syntax
set foldlevel=99
syntax on
filetype on
filetype plugin indent on
"backup & swp setting
set backup
set dir=~/.vim/swp
set backupdir=~/.vim/backup

"pop up menu color
highlight Pmenu ctermfg=white ctermbg=darkgrey
highlight PmenuSel ctermfg=white ctermbg=darkblue

" Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
" let g:acp_enableAtStartup = 0
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" select using enter without inserting a new line
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

set cindent
set showmatch
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a

"powerline style
let g:Powerline_symbols = 'fancy'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:tagbar_left = 1

"neocomplcache setting
let g:neocomplcache_enable_at_startup = 1
"tab completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
set laststatus=2

"highlight trailling spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
"F4 clear trailling spaces
nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"nerdtree
map <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F3> :TagbarToggle<CR>

"macvim
set guifont=Monaco:h14
if has("gui_running")
  set transparency=11
  set guioptions=e
endif
execute pathogen#infect('~/.vim/submodules/')
