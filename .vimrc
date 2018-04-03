source /usr/share/vim/vim74/ftplugin/man.vim

"tmux setting 
if exists('$TMUX')
    set term=screen-256color
endif

"括号自动补全
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
""inoremap { {}<ESC>i<CR><CR><ESC>k<ESC>i<TAB><ESC>i 
"inoremap < <><ESC>i
inoremap " ""<ESC>i
"inoremap ' ''<ESC>i

set tags+=~/.vim/tags
set tags+=/usr/include/c++/5.0/stdcpp.tags
set tags+=/usr/include/sys.tags
"用boost的时候再开 不然扫描标签的时候会很卡 
" set tags+=/usr/local/include/boost/boost.tags

set laststatus=2
"显示光标当前位置
set ruler

set mouse=a
"总是显示状态栏
set laststatus=2
"设置状态栏主题风格

set number
"高亮显示当前行列
set cursorline
set cursorcolumn
"高亮显示搜索效果
set hlsearch
syntax on
"开启实时搜索功能
set incsearch
set wildmenu

"vundle设置
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"让vundle管理插件版本必须
Plugin 'VundleVim/Vundle.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/DrawIt'
Plugin 'lilydjwg/fcitx.vim'
call vundle#end()

"vim-cpp-enhanced-highlight 设置
"highlight of class scope
let g:cpp_class_scope_highlight=1
"highlight member variable
let g:cpp_member_variable_highlight=1
"highlight class names in declarations
let g:cpp_class_decl_highlight=1
"highlight template functions
let g:cpp_experimental_simple_template_highlight=1
"highlight library concepts 
let g:cpp_concepts_highlight=1

"ultisnips 设置
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"设置自定义snipppet的目录
let g:UltiSnipsSnippetDirectories="/root/.vim/bundle/vim-snippets/snippets/c.snippets"

"基于缩进或语法进行代码折叠
set foldmethod=indent
set foldmethod=syntax
" 启动vim是关闭折叠代码
"set nofoldnable
filetype plugin indent on
set t_Co=256
set background=light "dark light "can switch it to find which is look pretty
"colorscheme solarized
colorscheme molokai
set nocompatible                 "some plugin need it
set incsearch                    "move to fit position after one char input
set nobackup                     "won't produce the backup file when save file
set nowritebackup                "won't produce the backup file when save file
set noswapfile                   "won't use swapfile
set hidden                       "can open other file when a file is not saved
set nowrap                       "disable auto newline
set laststatus=2                 "status bar will show anytime
set updatetime=200               "tagbar response 800ms
set showmatch matchtime=0        "show the other bracket
set wmnu wildmode=longest:full   "when in command mode can use auto complete same as bash
set expandtab tabstop=4          "expand the tab to 4 space
set si ai ci cinkeys-=0# cinoptions=g0,:0   "some indent rules
set shiftwidth=4                 "make the indent 4 length
set softtabstop=4                "backspace can del 4 space
set lcs=eol:$,tab:\|\            "display tab to green line
set backspace=indent,eol,start   "better backspace
set fileencodings=utf-8,cp936    "auto test the file is uft-8 or cp936
set fileformats=unix,dos,mac     "line feed different in different mode
set completeopt=menuone,longest

highlight TagbarHighlight guifg=Green ctermfg=Green
let NERDTreeQuitOnOpen=1
let NERDTreeDirArrows=0
let NERDTreeWinSize=40
let NERDRemoveExtraSpaces=0
let g:bufExplorerDisableDefaultKeyMapping = 1
let g:tagbar_sort=0
let g:tagbar_compact=1
let g:tagbar_foldlevel=1
let g:tagbar_iconchars=['+', '-']
let OmniCpp_SelectFirstItem = 2
let OmniCpp_ShowPrototypeInAbbr = 1 
let OmniCpp_MayCompleteScope = 1

func! Turntabstop()

    let tablength = &tabstop
    if tablength == 1
        set tabstop=2
        set softtabstop=2
        set shiftwidth=2
    elseif tablength==2
        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
    elseif tablength==4
        set tabstop=8
        set softtabstop=8
        set shiftwidth=8
    elseif tablength==8
        set tabstop=1
        set softtabstop=1
        set shiftwidth=1
    endif
endfunc

"file list
map <silent> <F2> :NERDTreeToggle<cr>
"tarbar functon list
map <silent> <F3> :TagbarToggle<cr>
"header and implement file switch
map <F4> :A<cr>
"update index
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<cr><cr>:cs kill cscope.out<cr>:!cscope -Rb<cr><cr>:cs add cscope.out<cr>
"switch display invisable char or not
map <F6> :set list!<cr>:set list?<cr>
"highlight
map <F7> ms:%s /\<<C-R>=expand("<cword>")<CR>\>//gn<cr>`s
"swapfile list
map <silent> <F8> :BufExplorer<CR>
"switch tab expand to space or not
map <F9> :set expandtab!<cr>:set expandtab?<cr>
"switch tab expand to space or not
map <silent> <F10> :call Turntabstop()<cr>:set tabstop?<cr>
""comment visual line
vnoremap <silent> , :call NERDComment(1, "alignLeft")<cr>
"uncomment visual line
vnoremap <silent> . :call NERDComment(1, "uncomment")<cr>
"show list if more tag 
nnoremap <c-]> g<c-]>
"move to right window
noremap <c-l> <c-w>l
"move to up window
noremap <c-k> <c-w>k
"move to down window
noremap <c-j> <c-w>j
"move to left window
noremap <c-h> <c-w>h
"goto the place where word definition
nmap <C-[>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"list the funcion called by this function
nmap <C-[>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"list the position where to call this word
nmap <C-[>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"search word in the project
nmap <C-[>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"search word in the project and the word can be in text
nmap <C-[>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"search word in the project and the word can be in text, support regex
nmap <C-[>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"list the file which filename is this word
nmap <C-[>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"list the file include the file which filename is this word
nmap <C-[>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"list the file which include this file
nmap <C-[>I :cs find i <C-R>=expand("%:t")<CR><CR>

if has("cscope") 
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
endif
