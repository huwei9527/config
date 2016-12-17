set nocompatible						" be iMproved, required
filetype off							" required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'			" let Vundle manage Vundle, required

"Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'ctrlpvim/ctrlp.vim'

"Plugin 'majutsushi/tagbar'

Plugin 'Valloric/YouCompleteMe'

Plugin 'vim-airline/vim-airline'

Plugin 'tmhedberg/SimpylFold'
Plugin 'nvie/vim-flake8'

Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()						" required
filetype plugin indent on				" required


""""""""""""""""""""""""""""""
" => General configuration
""""""""""""""""""""""""""""""
" Languages & Encodings
set fileencodings=ucs-bom,utf-8,chinese 
set fileencoding=chinese
set termencoding=utf-8
set encoding=utf-8

" GUI configuration
if has("gui_running")
    " au GUIEnter * simalt ~x			" Maxmize window at startup
    winpos 70 25						" The coordinate of GUI window
    set lines=55 columns=180			" Size of the GUI window
    set guioptions+=c					" Use charactor prompt
    set guioptions-=m					" Hide the menu
    set guioptions-=T					" Hide the tool menu
    set guioptions-=L					" Hide the left scroll bar
    set guioptions+=r					" Show the right scroll bar
    set guioptions-=b					" Hide the bottom scroll bar
    set showtabline=0					" Hide the Tab bar
	set guifont=Consolas:h12.0			" Configure English font
	set guifontset=·ÂËÎ_GB2312:h10		" Configure Chinese font
endif
colorscheme desert						" Colorscheme
set number								" Show line number

"set viminfo='1000,f1,<50				" '1000 - The max number of files
										" f1 - Keep global marks
										" <50 - The max number of line of the register
set history=1000						" The max number of histories
set backup								" Use backup files

syntax on								" Syntax highlighting
filetype on								" File type identification
filetype indent on						" Indent according to file type
filetype plugin on						" Load plugin according to file type

set backspace=indent,eol,start			" Backspace can cross start point, end of line, and indent in INSERT mode
set whichwrap+=<,>,h,l					" Cursor can cross line
set wildmenu							" Auto complete in the command line
"set mouse=a								" Activate mouse in buffer area
set selection=exclusive					" Select without the last charactor
set selectmode=mouse,key				" Select using mouse or spacial key
set scrolloff=3							" Minimal number of screen lines to keep above and below the cursor
 
set iskeyword+=_,$,@,%,#,-				" Don't split a word in the keyword completion
set clipboard+=unnamed					" Share the system clipboard
set report=0							" Show a message when 'report' number of lines are changed.(0 - always show)
set novisualbell						" Don't use screen flash instead of bell
set wildignore+=
			\*/tmp/*,*.so,*.swp,*.zip	" Golbal ingnored files 
set listchars=
			\tab:\|\ ,trail:.,extends:>,
			\precedes:<,eol:$			" The format of the command ':set list'

" Search configuration
set showmatch							" The cursor will jump to left bracket for a while(It won't affect the input)
set matchtime=5							" The time of 'showmatch'(1/10 sec)
set ignorecase							" Ignore case when searching
set nohlsearch							" Don't highlight the phrase
set incsearch							" Show results according to the pattern typed so far

" Indent configuration
set tabstop=4							" The number of spaces a Tab counts for
set softtabstop=4						" The number of spaces a Tab or backspace counts for
set shiftwidth=4						" The number of spaces for each step of indent
set autoindent							" Indent according to last line
set smartindent							" Provide C-like auto indent
set cindent								" Provide C-like auto indent
set noexpandtab							" Don't fill tab with space
set smarttab							" The spaces in the head of a line will be change to tab smartly
set formatoptions=tcrqn					" Auto formating configuration
set foldlevelstart=99

" Status line configuration
set laststatus=2						" Always show status line
" set statusline+=\[%f,					" File name
" set statusline+=%{&encoding},			" Encoding
" set statusline+=%{&fileformat}]		" File format
" set statusline+=\:%l/%L-%(%c%)		" line, max column, column


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keyboard mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" \r --- Make-run (need makefile and 'run' tag)
nnoremap <leader>r :w<CR>:!make run<CR>
" Ctrl-N --- Goto next buffer
nnoremap <C-N> :w<CR>:bn<CR>
" Space --- Toggle folding
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"nnoremap <silent> <c-n> :NERDTreeToggle<CR>
"nnoremap <silent> <leader>t :TagbarToggle<CR>

" CtrlP mapping
" \b --- Find buffer
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
" \m --- Find most recently used file
nnoremap <silent> <leader>m :CtrlPMRU<CR>
" \f --- Find files(slow in a heavy directory)
nnoremap <silent> <leader>f :CtrlPCurFile<CR>

" YouCompleteMe mapping
" \gl --- Goto declaration
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
" \gf --- Goto definition
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
" \gg --- Goto definition or declaration smartly
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" \gd --- Show the diagnosis dialoa box
nnoremap <leader>gd :YcmDiags<CR>

" Default mapping
" \c<space> --- Toggle nerdcomment
" \p --- Run flake8 check(only work for python file)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType c,cpp nested :TagbarOpen
filetype plugin indent on
" Python's local configurations
autocmd FileType python 
			\setlocal expandtab |
			\setlocal tabstop=4 |
			\setlocal softtabstop=4 |
			\setlocal shiftwidth=4 | 
			\setlocal autoindent | 
			\setlocal foldmethod=indent |
			\setlocal wrap |
			\setlocal textwidth=79 | 
			\map <buffer> <leader>p :call Flake8()<CR>
"autocmd BufWinEnter python setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
"autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" C,CPP's local configurations
autocmd FileType c,cpp 
			\setlocal noexpandtab |
			\setlocal cindent |
			\setlocal foldmethod=syntax


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|rar|pyc)$',
    \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=0
let NERDTreeShowBookmarks=1
let NERDTreeMinimalUI=1
"let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeShowGitStatus=1
"let g:NERDTreeChDirMode=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:tagbar_ctags_bin='ctags'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set completeopt-=preview
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_key_invoke_completion = '<C-L>'
let g:ycm_error_symbol='>*'
let g:ycm_warning_symbol='>>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdcommenter configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims=1
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-flake8 configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:flake8_show_in_quickfix=0
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
