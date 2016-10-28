
set showmatch  " show matching brackets/parentheses
set ruler
set nobackup
set nowritebackup
set noswapfile
set title " shell window title
set showcmd " info about current command
set noeb vb t_vb= " no beep
set mouse= " no mouse

" indentation
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType css :setlocal sw=2 ts=2 sts=2
autocmd BufEnter *.less set syntax=css
autocmd BufEnter *.less setlocal sw=2 ts=2 sts=2
set autoindent

" color
syntax on
colorscheme ron

" shortcuts
" don't exit visual mode when shifting
vnoremap < <gv
vnoremap > >gv

:let mapleader = ","
set pastetoggle=<leader>p
" new tab
nnoremap <leader>t :tabnew<Space>

:let maplocalleader = "\\"
" comments
:autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
:autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
" debug
:autocmd FileType javascript nnoremap <buffer> <localleader>d Idebugger;<Enter>
:autocmd FileType python     nnoremap <buffer> <localleader>d Iimport pdb; pdb.set_trace()<Enter>
" if
:autocmd FileType python     :iabbrev <buffer> iff if:<left>
:autocmd FileType javascript :iabbrev <buffer> iff if ()<left>

" search
set incsearch " find as you type
set hlsearch " highlight
" clear search
nmap <silent> ,/ :nohlsearch<CR>

" auto complete
" this needs some work - autocompletes at the start of a line instead of
" indenting
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-N>"                         " plugin matching
  endif
endfunction
inoremap <tab> <c-r>=Smart_TabComplete()<CR>

" run command on write
" autocmd BufWritePost */pattern/* silent !command restart

" indent guides could be nice

