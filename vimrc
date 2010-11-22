" Tom's VIM Config
" tom@takeontom.com
" https://github.com/takeontom/tom-vim
"
" comments taken from http://www.vi-improved.org/vimrc.php

set nocompatible " Use vim features - ignore vi compatibility
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.



set background=dark "using a dark background
syntax on "syntax highlighting

set backup " make backup files
set backupdir=~/.vim/backup " where to put backup files
set directory=~/.vim/tmp " directory to place swap files in

set noerrorbells " don't make noise

set cursorline " highlight current line
set incsearch " highlight search matches when typing search
set laststatus=2 " always show the status line
set showmatch " show matching brackets
set matchtime=2 " how many tenths of a second to blink matching brackets for

set list " we do what to show tabs, to ensure we get them out of my files
set listchars=tab:>-,trail:~ " show tabs and trailing 

set number " turn on line numbers
set numberwidth=5 " We are good up to 99999 lines
set scrolloff=3 " Give 3 lines of context when at bottom of window

set showcmd " show the command being typed


set expandtab " no real tabs please!
set smartindent
set formatoptions=orq " Automatically insert comment leader on return, and let gq format comments
set ignorecase " case insensitive by default
set infercase " case inferred by default
"set nowrap " do not wrap line
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set smartcase " if there are caps, go case-sensitive
set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
set softtabstop=4 " when hitting tab or backspace, how many spaces 
"should a tab be (see expandtab)
set tabstop=8 " real tabs should be 8, and they will show with set list on
set nofoldenable "really hate code-folding...

filetype plugin on
set ofu=syntaxcomplete#Complete

set t_Co=256
"colorscheme lucius
"colorscheme jellybeans
"colorscheme zenburn
colorscheme tom_jellybeans

function! ReloadSnippets( snippets_dir, ft )
    if strlen( a:ft ) == 0
    let filetype = "_"
    else
    let filetype = a:ft
    endif

    call ResetSnippets()
    call GetSnippets( a:snippets_dir, filetype )
endfunction

" load file type specific configs
if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python.vim
endif

" This beauty remembers where you were the last time you edited the
" file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

