" Tom's VIM Config
" tom@takeontom.com
" https://github.com/takeontom/tom-vim



" ------------------------------------------------------------------------------
" Basic Settings
" ------------------------------------------------------------------------------

set nocompatible          " Use vim features - ignore vi compatibility
syntax on                 " syntax highlighting



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

set background=dark       " using a dark background
set t_Co=256
set cursorline            " highlight current line
set cursorcolumn          " highlight current column



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

set number                   " turn on line numbers
set numberwidth=4            " We are good up to 99999 lines
set scrolloff=3              " Give 3 lines of context when at bottom of window

set nowrap                   " do not wrap line
set nofoldenable             " really hate code-folding...

set splitright               " vertical split to the right
set splitbelow               " horizontal split to the right



" ------------------------------------------------------------------------------
" Formatting
" ------------------------------------------------------------------------------

set formatoptions=corq    " Automatically insert comment leader on return, and let gq format comments

set expandtab             " no real tabs please!
set smartindent           " do smart autoindenting when starting a new line
set shiftround            " when at 3 spaces, and I hit > ... go to 4, not 7
set shiftwidth=4          " auto-indent amount when using cindent, >>, << and stuff like that
set softtabstop=4         " when hitting tab or backspace, how many spaces
                          " should a tab be (see expandtab)
set tabstop=4             " real tabs should be 8, and they will show with set list on
set textwidth=70          " when to start auto-wrapping
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

    " arduino styling
    autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
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



" ------------------------------------------------------------------------------
" Auto Complete
" ------------------------------------------------------------------------------

inoremap <C-space> <C-x><C-o>
inoremap <null> <C-x><C-o>
inoremap <C-@> <C-x><C-o>


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
    Bundle 'gmarik/vundle'


    " ------------------------------------------------------------------------------
    " Ack
    " ------------------------------------------------------------------------------
    Bundle 'mileszs/ack.vim.git'


    " ------------------------------------------------------------------------------
    " SnipMate
    " ------------------------------------------------------------------------------
    Bundle 'msanders/snipmate.vim.git'

    " Reloads all the code snippets
    function! ReloadSnippets( snippets_dir, ft )
        if strlen( a:ft ) == 0
        let filetype = "_"
        else
        let filetype = a:ft
        endif

        call ResetSnippets()
        call GetSnippets( a:snippets_dir, filetype )
    endfunction


    " ------------------------------------------------------------------------------
    " Syntastic
    " ------------------------------------------------------------------------------
    Bundle 'scrooloose/syntastic'

    let g:syntastic_check_on_open=1
    let g:syntastic_enable_highlighting=1
    let g:syntastic_auto_loc_list=1


    " ------------------------------------------------------------------------------
    " Fugitive (git plugin)
    " ------------------------------------------------------------------------------
    Bundle 'tpope/vim-fugitive'

    nmap <Leader>gs :Gstatus<CR>
    nmap <Leader>gb :Gblame<CR>
    nmap <Leader>gh :Gbrowse<CR>
    nmap <Leader>gd :Gdiff<CR>
    nmap <Leader>gf :Gvsplit<CR>


    " ------------------------------------------------------------------------------
    " Surround
    " ------------------------------------------------------------------------------
    Bundle 'tpope/vim-surround.git'


    " ------------------------------------------------------------------------------
    " CommandT
    " ------------------------------------------------------------------------------
    Bundle 'wincent/Command-T'

    " Don't really want any limit to the number of files CommandT shows...
    let g:CommandTMaxFiles=999999

    " Flush the CommandT buffer when saving new files
    let g:isNewFile = 0
    function! SetIsNewFile()
        if ! filereadable(expand("<afile>:p"))
            let g:isNewFile = 1
        else
            let g:isNewFile = 0
        endif
    endfunction
    function! FlushCommandTOnNewFileSave()
        if g:isNewFile == 1
            CommandTFlush
        endif
    endfunction
    autocmd BufWritePre * call SetIsNewFile()
    autocmd BufWritePost * call FlushCommandTOnNewFileSave()


    " ------------------------------------------------------------------------------
    " EasyTags
    " ------------------------------------------------------------------------------
    Bundle 'xolox/vim-easytags.git'

    set updatetime=4000     " l9 tries to set this to 10ms!


    " ------------------------------------------------------------------------------
    " PHP Complete
    " ------------------------------------------------------------------------------
    Bundle 'shawncplus/phpcomplete.vim'


    " ------------------------------------------------------------------------------
    " l9
    " ------------------------------------------------------------------------------
    Bundle 'L9'


    " ------------------------------------------------------------------------------
    " FuzzyFinder
    " ------------------------------------------------------------------------------
    Bundle 'FuzzyFinder'

    nmap <Leader>ft :FufTag<CR>
    nmap <Leader>ff :FufFile<CR>
    nmap <Leader>fb :FufBuffer<CR>


    " ------------------------------------------------------------------------------
    " PHP5.3
    " ------------------------------------------------------------------------------
    Bundle 'php.vim--Garvin'


    " ------------------------------------------------------------------------------
    " Tagbar
    " ------------------------------------------------------------------------------
    Bundle 'majutsushi/tagbar'

    " Toggle the tagbar window
    nnoremap <silent> <F8> :TagbarToggle<CR>


    " ------------------------------------------------------------------------------
    " Drupal VIM
    " ------------------------------------------------------------------------------
    Bundle 'git://drupalcode.org/project/vimrc.git', {'rtp': 'bundle/vim-plugin-for-drupal/'}
    let g:Drupal_dirs = {7: '/home/tom/Projects/drupal/7.19'}



    " ------------------------------------------------------------------------------
    " UltiSnips
    " ------------------------------------------------------------------------------
    "Bundle 'SirVer/ultisnips'

    let g:UltiSnipsEditSplit = "vertical"
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


    " ------------------------------------------------------------------------------
    " Markdown
    " ------------------------------------------------------------------------------
    Bundle 'tpope/vim-markdown'


    " ------------------------------------------------------------------------------
    " VDebug (PHP Debugger)
    " ------------------------------------------------------------------------------
    Bundle 'joonty/vdebug'
    let g:vdebug_options= {
                \   "break_on_open" : 0
                \}


    " ------------------------------------------------------------------------------
    " Tomorrow Night Theme
    " ------------------------------------------------------------------------------
    Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim'}
    colorscheme Tomorrow-Night-Bright




" ------------------------------------------------------------------------------
" Install Vundle Bundles if 1st load
" ------------------------------------------------------------------------------

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
    silent !~/.vim/post-update.sh
endif

filetype plugin indent on       " required!



" ------------------------------------------------------------------------------
" Status Line
" ------------------------------------------------------------------------------

set statusline=%<                   " truncate from start
set statusline+=%f                  " file path
set statusline+=\ %h                " help buffer flag
set statusline+=%m                  " modified flag
set statusline+=%r                  " readonly flag
set statusline+=\ %{fugitive#statusline()}  " fugutive git branch, etc.
set statusline+=%=                  " start right
set statusline+=%-14.(%l,%c%V%)     " line, column, virtual column number
set statusline+=\ %P                " percentage through file

