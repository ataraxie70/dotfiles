" ============================================================
" CUSTOM VIM UI CONFIGURATION (BLUE THEME)
" ============================================================

" Display line numbers
set number

" Always show the status line
set laststatus=2

" Hide the default mode indicator (e.g. --INSERT--)
set noshowmode

"Active \"smart-tabs" 
set smarttab

"Active smart-indent
set smartindent


"File type detection

filetype on

"Syntax color
syntax on


" Map internal mode codes to readable strings
let g:current_modes = {
    \ 'n'  : 'NORMAL',
    \ 'i'  : 'INSERT',
    \ 'v'  : 'VISUAL',
    \ 'V'  : 'V-LINE',
    \ 'c'  : 'COMMAND',
\ }

" --- HIGHLIGHT GROUPS FOR THE STATUSLINE ---
" Blue background for mode and position
hi StatusBlue ctermbg=27  ctermfg=15 guibg=#005fdf guifg=#ffffff gui=bold
" Amber color for the filename
hi StatusFile ctermbg=232 ctermfg=215 guibg=#111111 guifg=#ffaf5f
" Gray color for background/metadata
hi StatusMeta ctermbg=232 ctermfg=244 guibg=#111111 guifg=#808080
" Dark gray block for encoding
hi StatusEnc  ctermbg=235 ctermfg=250 guibg=#262626 guifg=#bcbcbc

" --- BUILDING THE STATUSLINE ---
set statusline=
" Mode segment (Blue block)
set statusline+=%#StatusBlue#\ %{get(g:current_modes,mode(),'')}  
" Filename and modified flags (Amber text)
set statusline+=%#StatusFile#\ %f%m%r
" Separator: Pushes the following items to the right
set statusline+=%= 
" Function and Filetype (Gray text)
set statusline+=%#StatusMeta#%{exists('*tagbar#currenttag')?tagbar#currenttag('',''):''}\ %y\ 
" Encoding and Fileformat (Dark block)
set statusline+=%#StatusEnc#\ %{&fileencoding?&fileencoding:&encoding}[%{&fileformat}]\ 
" Percentage, Icon and Position (Blue block)
set statusline+=%#StatusBlue#\ %p%%\ ☰\ :%l/%L≡%%:%c\ 

