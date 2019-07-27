" Colors and Themes
syntax enable			    " enable syntax processing

" https://github.com/tomasr/molokai
"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1

" https://github.com/sjl/badwolf/
colorscheme badwolf
let g:badwolf_tabline=2
let g:badwolf_html_link_underline=0
let g:badwolf_css_props_highlight=0

" Spaces and Tabs
set tabstop=2			    " number of visual spaces per tab
set softtabstop=2	    " number of spaces in tab when editing
set expandtab			    " tabs are spaces

" UI Config
set number			      " show line numbers
set cursorline        " highlight current line
set wildmenu          " visual autocomplete for command menu
set lazyredraw        " redraw only when we need to
set showmatch         " highlight matching [{()}]

" Searching
set incsearch         " search as characters are entered
set hlsearch          " highlight matches
" turn off search highlight with ,<space>
nnoremap <silent><space> :nohlsearch<CR>

" Folding
set foldenable        " enable folding
set foldlevelstart=10 " open most folds by defaul
set foldnestmax=10    " 10 nested fold max
nnoremap <apace> za   " space open/closes folds
set foldmethod=indent " fold based on indent level

" Movement
nnoremap j gj         " move up by visual line
nnoremap k gk         " move down by visual line
