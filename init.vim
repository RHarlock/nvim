":::instalacion de plugins:::
call plug#begin('~/.local/share/nvim/plugged') 	"directorio donde se van a instalar los plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'	"To comment out a single line, use <leader>cc (leader is a prefix key in Nvim, the default leader key is backslash \); to uncomment a line, use <leader>cu. To comment or uncomment several lines, add a repeating number to corresponding command, just like what you do in plain Vim
Plug 'sbdchd/neoformat'	"Neoformat can be used to format your source code.
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake' 		"Syntax checker
Plug 'machakann/vim-highlightedyank'
Plug 'christoomey/vim-tmux-navigator'	"Multiventanas
Plug 'ncm2/ncm2'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Themes
Plug 'savq/melange'	"theme
Plug 'sainnhe/everforest' "theme
Plug 'bluz71/vim-moonfly-colors'
Plug 'morhetz/gruvbox'
Plug 'ray-x/aurora'
Plug 'dracula/vim'

call plug#end()

"Neomake auto enabler
call neomake#configure#automake('nrwi', 500)

"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
set number 				"muestra los numeros de cada linea en la parte izquierda 
set relativenumber 			"la distribucion de los numeros en lineas de manera relativa
set nowrap				"el texto en una linea no baja a la siguiente, solo continua en la misma hasta el infinito.
"set noswapfile				"para evitar el mensaje que sale al abrir algunos archivos sobre swap.
set clipboard=unnamed			"para poder utilizar el portapapeles del sistema operativo 'esto permite poder copiar y pegar desde cualquier parte a nvim y viceversa.	
set shiftwidth=4			"identation

"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

"Jedi-vim
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

"confif deoplete
let g:deoplete#enable_at_startup = 1

"configuracion de vim-airline
let g:airline#extensions#tabline#enabled = 1	"muestra la linea de pestaña en la que estamos buffer
let g:airline#extensions#tabline#formatter = 'unique_tail'	"muestra solo el nombre del archivo que estamos modificando
let g:airline_theme = 'dracula'	"el tema de airline

"Neoformat
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

"tmux
let  g:tmux_navigator_no_wrap = 1

"Python
let g:python3_host_prog = '/usr/bin/python3'

"Neomake python checker
let g:neomake_python_enabled_makers = ['flake8']

if has ('termguicolors')
    set termguicolors
endif
" set background=dark use dark mode
" set background=light " uncomment to use light mode
let g:everforest_better_performance = 1
colorscheme dracula
highlight Normal ctermbg=none guibg=none
highlight NonText ctermbg=none guibg=none
let g:lightline = {'colorscheme' : 'dracula'}

"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

"configuracion de nerdtree
"mapeando el abrir y cerrar de nerdtree con nerdtreetoggle vemos los archivos en el arbol y podemos cerrarlo a la vez, map es la C mayuscula representa el
"control y -n la tecla n lo que indica que realizará la siguiente funcion de excribir el comando NERDTreeToggle y CR significa ENTER.
map <C-d> :NERDTreeToggle<CR>

"configuracion de division horizontal de pantalla con tmux
map <C-w> :sp<CR>

"tmux
let g:tmux_navigator_no_mappings = 1

noremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <c-t> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <c-c> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <c-n> :<C-U>TmuxNavigateRight<cr>
noremap <silent> <c-\> :<C-U>TmuxNavigatePrevious<cr>

" Correr terminal
autocmd FileType python map <buffer> <F7> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F7> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

"How to use jedi-vim
	"Move the cursor to the class or metod you want to check, then 
		"press the various supported shortcut provided by jedi-vim:
	"<leader>d: go to definition
	"K: check documentation of class or method
	"<leader>n: show the usage of a name in current file
	"<leader>r: rename a nameh
