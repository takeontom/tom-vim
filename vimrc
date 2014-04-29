" Tom's VIM Config
" tom@takeontom.com
" https://github.com/takeontom/tom-vim





" ------------------------------------------------------------------------------
" Vundle Auto Install
" ------------------------------------------------------------------------------

set nocompatible               " be iMproved
filetype off                   " required!

" Auto install Vundle. Credit:
" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


    " ------------------------------------------------------------------------------
    " Vundle
    " ------------------------------------------------------------------------------
    Plugin 'gmarik/vundle'


    " ------------------------------------------------------------------------------
    " Tomorrow Night Theme
    " ------------------------------------------------------------------------------
    Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim'}
    :silent! colorscheme Tomorrow-Night-Bright
    syntax on                 " syntax highlighting
    set background=dark       " using a dark background
    set t_Co=256


    " ------------------------------------------------------------------------------
    " Supertab
    " ------------------------------------------------------------------------------
    Plugin 'ervandew/supertab'



    " ------------------------------------------------------------------------------
    " Ack
    " ------------------------------------------------------------------------------
    Plugin 'mileszs/ack.vim.git'
    let g:ack_default_options = " -s -H --nocolor --nogroup --column --smart-case --follow"


    " ------------------------------------------------------------------------------
    " Syntastic
    " ------------------------------------------------------------------------------
    Plugin 'scrooloose/syntastic'

    let g:syntastic_check_on_open=1
    let g:syntastic_enable_highlighting=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_mode_map={ 'mode': 'active',
        \ 'active_filetypes': [],
        \ 'passive_filetypes': ['less'] }

    " ------------------------------------------------------------------------------
    " Fugitive (git plugin)
    " ------------------------------------------------------------------------------
    Plugin 'tpope/vim-fugitive'

    nmap <Leader>gs :Gstatus<CR>
    nmap <Leader>gb :Gblame<CR>
    nmap <Leader>gh :Gbrowse<CR>
    nmap <Leader>gd :Gdiff<CR>
    nmap <Leader>gf :Gvsplit<CR>


    " ------------------------------------------------------------------------------
    " Surround
    " ------------------------------------------------------------------------------
    Plugin 'tpope/vim-surround.git'


    " ------------------------------------------------------------------------------
    " ctrlp
    " ------------------------------------------------------------------------------
    Plugin 'kien/ctrlp.vim'

    nmap <Leader>t :CtrlP<CR>
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_use_caching = 1
    let g:ctrlp_working_path_mode = ''
    let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:30,results:30'
    let g:ctrlp_max_files = 1000000
    let g:ctrlp_max_depth = 200
    let g:ctrlp_switch_buffer = 'et'


    " ------------------------------------------------------------------------------
    " CommandT
    " ------------------------------------------------------------------------------
"    Plugin 'wincent/Command-T'
"
"    " Don't really want any limit to the number of files CommandT shows...
"    let g:CommandTMaxFiles=999999
"
"    " Flush the CommandT buffer when saving new files
"    let g:isNewFile = 0
"    function! SetIsNewFile()
"        if ! filereadable(expand("<afile>:p"))
"            let g:isNewFile = 1
"        else
"            let g:isNewFile = 0
"        endif
"    endfunction
"    function! FlushCommandTOnNewFileSave()
"        if g:isNewFile == 1
"            CommandTFlush
"        endif
"    endfunction
"    autocmd BufWritePre * call SetIsNewFile()
"    autocmd BufWritePost * call FlushCommandTOnNewFileSave()
"

    " ------------------------------------------------------------------------------
    " vim-misc
    " ------------------------------------------------------------------------------
    Plugin 'xolox/vim-misc.git'


    " ------------------------------------------------------------------------------
    " EasyTags
    " ------------------------------------------------------------------------------
    Plugin 'xolox/vim-easytags.git'

    set updatetime=4000     " l9 tries to set this to 10ms!


    " ------------------------------------------------------------------------------
    " auto_mkdir
    " ------------------------------------------------------------------------------
    Plugin 'auto_mkdir'


    " ------------------------------------------------------------------------------
    " l9
    " ------------------------------------------------------------------------------
    Plugin 'L9'


    " ------------------------------------------------------------------------------
    " FuzzyFinder
    " ------------------------------------------------------------------------------
    Plugin 'FuzzyFinder'

    nmap <Leader>ft :FufTag<CR>
    nmap <Leader>ff :FufFile<CR>
    nmap <Leader>fb :FufBuffer<CR>


    " ------------------------------------------------------------------------------
    " Tagbar
    " ------------------------------------------------------------------------------
    Plugin 'majutsushi/tagbar'

    " Toggle the tagbar window
    nnoremap <silent> <F8> :TagbarToggle<CR>


    " ------------------------------------------------------------------------------
    " Markdown
    " ------------------------------------------------------------------------------
    Plugin 'tpope/vim-markdown'


    " ------------------------------------------------------------------------------
    " Django template highlighting
    " ------------------------------------------------------------------------------
    Plugin 'django.vim'


    " ------------------------------------------------------------------------------
    " Vim-Less
    " ------------------------------------------------------------------------------
    Plugin 'groenewege/vim-less'


    " ------------------------------------------------------------------------------
    " Vim CSS3 syntax
    " ------------------------------------------------------------------------------
    Plugin 'hail2u/vim-css3-syntax'



" ------------------------------------------------------------------------------
" Install Vundle Bundles if 1st load
" ------------------------------------------------------------------------------

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

filetype plugin indent on       " required!



" ------------------------------------------------------------------------------
" Basic Settings
" ------------------------------------------------------------------------------

set nocompatible          " Use vim features - ignore vi compatibility



" ------------------------------------------------------------------------------
" File Handling
" ------------------------------------------------------------------------------

set autoread                " reads the file if it changes in background
set backup                  " make backup files
set backupdir=/tmp          " where to put backup files
set directory=/tmp          " directory to place swap files in



" ------------------------------------------------------------------------------
" Basic Preferences
" ------------------------------------------------------------------------------

set noerrorbells          " don't make noise
set showcmd               " show the command being typed



" ------------------------------------------------------------------------------
" Visuals
" ------------------------------------------------------------------------------

set cursorline            " highlight current line
"set cursorcolumn          " highlight current column



" ------------------------------------------------------------------------------
" Status Line
" ------------------------------------------------------------------------------

if exists('g:loaded_fugitive')
    set statusline=%<                   " truncate from start
    set statusline+=%f                  " file path
    set statusline+=\ %h                " help buffer flag
    set statusline+=%m                  " modified flag
    set statusline+=%r                  " readonly flag
    set statusline+=\ %{fugitive#statusline()}  " fugutive git branch, etc.
    set statusline+=%=                  " start right
    set statusline+=%-14.(%l,%c%V%)     " line, column, virtual column number
    set statusline+=\ %P                " percentage through file
endif



" ------------------------------------------------------------------------------
" Searching
" ------------------------------------------------------------------------------

set incsearch             " highlight search matches when typing search
set laststatus=2          " always show the status line
set ignorecase            " case insensitive by default
set infercase             " case inferred by default
set smartcase             " if there are caps, go case-sensitive



" ------------------------------------------------------------------------------
" Editing
" ------------------------------------------------------------------------------

set showmatch                " show matching brackets
set matchtime=2              " how many tenths of a second to blink matching brackets for
set list                     " we do what to show tabs, to ensure we get them out of my files
set listchars=tab:>-,trail:~ " show tabs and trailing

set nonumber                   " turn on line numbers
set numberwidth=4            " We are good up to 99999 lines
set scrolloff=3              " Give 3 lines of context when at bottom of window

set nowrap                   " do not wrap line
set nofoldenable             " really hate code-folding...

set splitright               " vertical split to the right
set splitbelow               " horizontal split to the right



" ------------------------------------------------------------------------------
" Formatting
" ------------------------------------------------------------------------------

set formatoptions=tcorq   " See help:fo-table

set expandtab             " no real tabs please!
set smartindent           " do smart autoindenting when starting a new line
set shiftround            " when at 3 spaces, and I hit > ... go to 4, not 7
set shiftwidth=4          " auto-indent amount when using cindent, >>, << and stuff like that
set softtabstop=4         " when hitting tab or backspace, how many spaces
                          " should a tab be (see expandtab)
set tabstop=4             " real tabs should be 8, and they will show with set list on
set textwidth=0           " disable auto-wrapping by default. allow filetypes to overide
set autoindent



" ------------------------------------------------------------------------------
" GUI
" ------------------------------------------------------------------------------

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=R  "remove right-hand scroll bar
set guioptions-=l  "remove left-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=b  "remove bottom scroll bar
set guioptions-=B  "remove bottom scroll bar
set guioptions-=e  "remove tab list
set guioptions-=c  "use console prompts instead of silly popups

set mouse-=a       " disable mouse integration

set guifont=Monospace\ 9



" ------------------------------------------------------------------------------
" Command Mode
" ------------------------------------------------------------------------------

set wildmode=longest,list " At command line, complete longest common string, then list alternatives.
set history=999



" ------------------------------------------------------------------------------
" Plugin Loading
" ------------------------------------------------------------------------------

filetype plugin on



" ------------------------------------------------------------------------------
" OmniCompletion
" ------------------------------------------------------------------------------

set ofu=syntaxcomplete#Complete " use default omni completion. override per ft.
if has("gui_running")
    " C-Space seems to work under gVim on both Linux and win32
    inoremap <C-Space> <c-x><c-o>
else " no gui
  if has("unix")
    inoremap <Nul> <c-x><c-o>
  else
  " I have no idea of the name of Ctrl-Space elsewhere
  endif
endif



" ------------------------------------------------------------------------------
" Tags
" ------------------------------------------------------------------------------

" search for tags in the current directory, then work up if no match found
set tags=./tags;/

" open tag in vertical split, centre on line
map <leader>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>zz



" ------------------------------------------------------------------------------
" File Type Autocmds
" ------------------------------------------------------------------------------

if !exists("autocommands_loaded")
    let autocommands_loaded = 1

    autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
    autocmd! BufNewFile,BufRead Berksfile setlocal ft=ruby
    autocmd! BufNewFile,BufRead Cheffile setlocal ft=ruby
    autocmd! BufNewFile,BufRead Vagrantfile setlocal ft=ruby
    autocmd! BufNewFile,BufRead *.md setlocal fo+=at|setlocal tw=80|setlocal wrap
endif



" ------------------------------------------------------------------------------
" Handy Utils
" ------------------------------------------------------------------------------

" remembers where you were the last time you edited the file, and returns to the same position.
"au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Fix bad whitespace
function! FixBadWhiteSpace()
    retab
    %s/\s*$//
    ''
:endfunction
