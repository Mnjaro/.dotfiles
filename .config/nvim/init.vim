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
<<<<<<< HEAD
Plug 'Yggdroot/indentLine'
Plug 'hashivim/vim-terraform'
call plug#end()

=======
Plug  'Yggdroot/indentLine'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

"to do Enable 24-bit true colors if your terminal supports it.
set termguicolors " this variable must be enabled for colors to be applied properly

" -----------------------------------------------------------------------------
" Fonts 
" -----------------------------------------------------------------------------
if has('gui_running')
  set guifont="FiraCode Nerd Font"
endif

" -----------------------------------------------------------------------------
" Global VIM Settings 
" -----------------------------------------------------------------------------
set rnu
" Add a symbol on tab usage
set expandtab
let g:vim_json_conceal=0
:nmap <Esc>> :vertical res +1<Enter>
:nmap <Esc>< :vertical res -1<Enter>
set tabstop=2
set shiftwidth=2
set expandtab
set termguicolors     

xnoremap p pgvy
" Go to previous line with same indentation as current
nnoremap <M-,> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
" Go to next line with same indentation as current
nnoremap <M-.> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

" -----------------------------------------------------------------------------
" Highlights
" -----------------------------------------------------------------------------
highlight Pmenu ctermfg=7 ctermbg=0


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

" -----------------------------------------------------------------------------
" Prettier
" -----------------------------------------------------------------------------
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" source /home/jaro/.config/nvim/themes/gruvbox
" source /home/jaro/.config/nvim/themes/ayu
source /home/jaro/.config/nvim/themes/night


" -----------------------------------------------------------------------------
" Nerd Tree
" -----------------------------------------------------------------------------
