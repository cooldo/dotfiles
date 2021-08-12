" ###########################################################################################
" # Plugins                                                                                 #
" ###########################################################################################
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
   echo "Installing Vim-plug..."
   echo ""
   silent !mkdir -p ~/.vim/autoload
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin('~/.vim/plugged')
" Add surround plugin. ex, ysiw{   cs{[
Plug 'tpope/vim-surround'
" Add colortheme plugin
Plug 'altercation/vim-colors-solarized'
" colorsheme plugins
Plug 'tomasr/molokai'
Plug 'vim-scripts/vilight.vim'
Plug 'bigcode/vim-colors-behelit'
" Airline (status bar)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-runner'
Plug 'benmills/vimux'
Plug 'scrooloose/nerdtree'
" cd ~/.vim/plugged/command-t
" rake make
Plug 'wincent/command-t'
Plug 'vim-scripts/ZoomWin'
Plug 'csexton/trailertrash.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sjbach/lusty'
Plug 'peterhoeg/vim-qml'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'yegappan/taglist'
Plug 'sainnhe/sonokai'
Plug 'sheerun/vim-polyglot'
Plug 'ycm-core/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'mileszs/ack.vim'

call plug#end()

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ###########################################################################################
" # Basic settings                                                                          #
" ###########################################################################################
" Map <leader> key to comma
let mapleader=" "

" Turn on line number
:set nu

" Turn on relative line number
:set rnu

" Turn on ruler
:set ruler

" Turn on cursor
":set cursorline

" Turn on highlight search
:set hls

" Turn on increase search
:set incsearch

" ###########################################################################################
" # Spelling check                                                                          #
" # Next:  ]s,  suggestion: z=, put into dictionary: zg (zug), incorrect check : zw(zuw)    #
" ###########################################################################################
" Map F12 toggle turn on spelling check
nmap <F10> :setlocal spell spelllang=en_us<CR>

" Map <leader>F12 turn off spelling check
nmap <leader><F10> :set nospell<CR>

" ###########################################################################################
" # Map window navigation                                                                   #
" # Map <CTRL>h to left                                                                     #
" # Map <CTRL>l to right                                                                    #
" # Map <CTRL>j to down                                                                     #
" # Map <CTRL>k to up                                                                       #
" ###########################################################################################
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

nmap <F7> :Tlist<CR>
"nmap <F8> :WMToggle<CR>
"set width to winmanager, default is 25
"let g:winManagerWidth = 30
"let g:wincmd = R
"set tags=tags;
"set tags+=/home/gao/windows/linux-4.13.1/tags;

" ###########################################################################################
" # Cscope configuration                                                                    #
" ###########################################################################################
" nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


" For preview: http://vimcolors.com/
" Prefered: default,molokai,solarized,sonokai
" Solarized setting
"let g:solarized_termtrans = 1
"colorscheme solarized
"colorscheme molokai
"colorscheme default
let g:sonokai_transparent_background = 1
colorscheme sonokai

" Make malokai and vilight transparent(solarized "light" can work well without the following line)
"hi Normal guibg=NONE ctermbg=NONE

" airline setting
let g:airline_powerline_fonts = 0
"let g:airline_theme = 'dark'
let g:airline_theme = 'bubblegum'
"let g:airline_theme = 'molokai'
"let g:airline_theme = 'kolor'
let g:airline#extensions#whitespace#enabled = 0

" Open NERDTree
map <F8> :NERDTreeToggle<CR>

" Open CommandT
nnoremap <C-n> :CommandT<CR>

" ###########################################################################################
" # Autocomplete keys                                                                       #
" ###########################################################################################
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion

" ###########################################################################################
" # System clip board                                                                       #
" ###########################################################################################
" use "sudo apt-get gvim" to add register "+"

" In visual mode, <Ctrl>C to add to "+"
vnoremap <C-c> "+y

" In normal and visual mode, <Ctrl>v to paste from "+"
map <C-p> "+P

" New copy/paste using xclip, this can communicate between vim and terminal
vnoremap <leader>xyy :!xclip -f -sel clip<CR>
nnoremap <leader>xpp mz:-1r !xclip -o -sel clip<CR>`z

" ###########################################################################################
" # Autocorrect Dictionary abbr=abbreviation                                                #
" ###########################################################################################
abbr ture true
abbr flase false

" ###########################################################################################
" # File type indent sw=shiftwidth, ts=tabstop sts=shifttabstop                             #
" ###########################################################################################
filetype indent on
autocmd Filetype perl setlocal noexpandtab ts=4 sw=4 sts=4
autocmd Filetype python setlocal noexpandtab ts=4 sw=4 sts=4

autocmd VimResized * exe "normal! \<C-w>="

" Change tab to space
:set expandtab

" Normal mode tab(>> key) to 4 space(shftwidth)
:set sw=4

" Insert mode tab key to 4 space(tabstop)
:set ts=4

" Insert mode tab backspace key to 4 space(softtabstop)
:set sts=4


" Provide tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu


command! Wq :wq
command! W :w

" ###########################################################################################
" # Get help from VIM documentatin                                                          #
" ###########################################################################################
" Normal mode command :help x
" Visual mode command :help v_u
" Insert mode command :help i_x
" command-line command :help :ls
" command-line editing :help c_<Del>
" Vim command argument :help -r
" Regular expression :help /[

" ###########################################################################################
" # Short cuts                                                                              #
" ###########################################################################################
" Shortcut open vimrc
nnoremap <leader>vimrc :tabe $MYVIMRC<cr>

" Shortcut open buffer vertically
nnoremap <leader>vb :vsp\|b

" Shortcut max window
nnoremap <leader>m :tabedit %<CR>

" to vertical
map <leader>gv <C-w>t<C-w>H
" to horizional
map <leader>gh <C-w>t<C-w>K

nmap <leader>l :vertical resize +5<CR>
nmap <leader>h :vertical resize -5<CR>
nmap <leader>j :resize +5<CR>
nmap <leader>k :resize -5<CR>

" Delete space in the end of line
nnoremap <leader>e :TrailerTrim <CR>

" Shortcut hide number and relativenumber
nnoremap <leader>n :set nonu nornu<CR>
nnoremap <leader>nn :set nu rnu<CR>

" ctags iterator config
set tags=tags;
set autochdir
command! MakeTags !ctags -R .
set hidden

command! White !terminator -p gao

:hi Visual ctermbg=8

hi UnwantedTrailerTrash guibg=red ctermbg=red
highlight search ctermbg=2
set ignorecase

set updatetime=100

" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" YCM configuration
" Jump
"nnoremap <c-k> :YcmCompleter GoToDeclaration<CR>|
"nnoremap <c-]> :YcmCompleter GoToDefinition<CR>|
"nnoremap <c-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>|
nnoremap <c-r> :YcmCompleter GoToReferences<CR>|
let g:ycm_confirm_extra_conf = 0
" 停止提示是否载入本地ycm_extra_conf文件
let g:ycm_show_diagnostics_ui = 0
"let g:ycm_auto_trigger = 0
"let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_goto_buffer_command = 'vertical-split'

" Open a new tab and search for something
nmap <leader>a :tab split<CR>:Ack ""<Left>
" Immediately search for the word under the cursor in a new tab
" CTRL-W the Word under the cursor
" CTRL-r get the register
nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>
