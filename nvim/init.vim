" == VIM PLUG ================================
call plug#begin('~/.vim/plugged')
"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-python', 'coc-json', 'coc-yank', 'coc-prettier']
"------------------------ THEME ------------------------
" most importantly you need a good color scheme to write good code :D
Plug 'skbolton/embark'
Plug 'preservim/nerdtree'
Plug 'alvan/vim-closetag'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
call plug#end()
set t_Co=256
set encoding=UTF-8
syntax on
colorscheme embark
hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow
set tabstop=4
set shiftwidth=4
set expandtab
set splitbelow
set splitright
set number relativenumber
set nu rnu
set guifont=Consolas\ NF:h12
set termguicolors
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
imap <C-d> <Esc>Ypa
nmap <C-d> <Esc>Yp
imap <C-z> <Esc>u
nmap <C-z> <Esc>u
map <A-S-f> <Esc>gg=G
nmap <A-k> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
nmap <A-j> ddp
let s:fontsize = 12
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Consolas:h" . s:fontsize
endfunction
noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
tnoremap <Esc> <C-\><C-n>
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<down>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" == VIMPLUG END ================================
" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
autocmd FileType c nnoremap <buffer> <F5> :w<CR>:!gcc % && a.exe <CR>
autocmd FileType cpp nnoremap <buffer> <F5> :w<CR>:!g++ % && a.exe <CR>
autocmd FileType python nnoremap <buffer> <F5> :w<CR>:!python % <CR>
" == AUTOCMD END ================================