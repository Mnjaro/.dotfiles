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
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
call plug#end()

" -----------------------------------------------------------------------------
" Color 
" -----------------------------------------------------------------------------

"to do Enable 24-bit true colors if your terminal supports it.

" -----------------------------------------------------------------------------
" Fonts 
" -----------------------------------------------------------------------------
if has('gui_running')
  set guifont=Roboto-Bold:h11
endif


" -----------------------------------------------------------------------------
" Global VIM Settings 
" -----------------------------------------------------------------------------
set rnu

xnoremap p pgvy


" -----------------------------------------------------------------------------
" NERDTree 
" -----------------------------------------------------------------------------
"  Remaping
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


" -----------------------------------------------------------------------------
" Easy Align 
" -----------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
