
" -----------------------------------------------------------------------------
" This config is targeted for Vim 8.1+ and expects you to have Plug installed.
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

" Specify a directory for plugins.
call plug#begin('~/.config/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'townk/vim-autoclose'
Plug 'Yggdroot/indentLine'
Plug 'hashivim/vim-terraform'
call plug#end()


" -----------------------------------------------------------------------------
" Global VIM Settings 
" -----------------------------------------------------------------------------
set rnu
" Add a symbol on tab usage
set tabstop=2
set shiftwidth=2
set expandtab

xnoremap p pgvy
" Go to previous line with same indentation as current
nnoremap <M-,> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
" Go to next line with same indentation as current
nnoremap <M-.> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

" -----------------------------------------------------------------------------
" NERDTree 
" -----------------------------------------------------------------------------
"  Remaping
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1


" -----------------------------------------------------------------------------
" Easy Align 
" -----------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" -----------------------------------------------------------------------------
" Javascript Syntax
" -----------------------------------------------------------------------------
" Enables syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1



" -----------------------------------------------------------------------------
" Indent Line
" -----------------------------------------------------------------------------
let g:indentLine_char = '|'
