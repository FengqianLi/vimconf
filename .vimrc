" ~/.vimrc (configuration file for vim only)

" Encoding related
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8

"vundle begin
set nocompatible " be iMproved
filetype off  "required!

if has('win32')
    set rtp+=~/vimfiles/bundle/Vundle.vim/
    let path='~/vimfiles/bundle'
elseif has('mac')
    set rtp+=~/.vim/bundle/vundle/
elseif has('unix')
    set rtp+=~/.vim/bundle/vundle/
endif
call vundle#rc()

" let Vundle manage plugins
" required! 
Bundle 'gmarik/vundle'
" vim-scripts.org repos
Bundle 'OmniCppComplete'
Bundle 'autoload_cscope.vim'
Bundle 'cscope_macros.vim'
Bundle 'CmdlineComplete'
Bundle 'xptemplate'
Bundle 'neocomplcache'
Bundle 'genutils'
Bundle 'lookupfile'
Bundle 'autopreview'
Bundle 'echofunc.vim'
Bundle 'grep.vim'
Bundle 'earendel'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'Auto-Pairs'
Bundle 'SrcExpl'
Bundle 'Trinity'
Bundle 'taglist.vim'
Bundle 'txt.vim'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
" other github repos
"

filetype plugin indent on     " required! 
"vundle end


" Common Configuration
syntax on
set ignorecase
set number
set autochdir
set autoread

" colorscheme
colorscheme murphy
colorscheme earendel

" status line
set laststatus=2 " always have status-line'
function! CurDir()
        let curdir = substitute(getcwd(), $HOME, "~", "g")
            return curdir
        endfunction
set statusline=[%n]\ \|\ %{CurDir()}\/%f%m%r%h\ \|\ %{EchoFuncGetStatusLine()}\ \|%l,%c\ %p%%
highlight statusline cterm=bold ctermfg=yellow ctermbg=blue

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Tab related
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" Indent related
" http://vimcdoc.sourceforge.net/doc/indent.html
" g0 类的public顶格写
" :0 将 case 标号放在 switch() 缩进位置之后的 N 个字符处
" N-s namespace 下顶格
" (0  条件语句多个条件在不同行时下一行与上一行对齐
set cinoptions=g0,:0,N-s,(0
set autoindent      " always set autoindenting on
set smartindent

set mps+=<:>        " 让<>可以使用%跳转
set hid             " allow to change buffer without saving 
set shortmess=atI   " shortens messages to avoid 'press a key' prompt 
set lazyredraw      " do not redraw while executing macros (much faster)
" Set Number format to null(default is octal) , when press CTRL-A on number
" like 007, it would not become 010
set nf=
" In Visual Block Mode, cursor can be positioned where there is no actual character
set ve=block
"set ignorecase " Set search/replace pattern to ignore case 
set smartcase   " Set smartcase mode on, If there is upper case character in the search patern, the 'ignorecase' option will be override.
set showcmd     " display incomplete commands
set incsearch   " do incremental searching
set hlsearch    " highlight search
set magic       " Enable magic matching
set showmatch   " show matching paren
set wildmenu    " 增强模式中的命令行自动完成操作
"set mouse=a    " Enable mouse usage (all modes) in terminals

" NERDTree options
" Auto change the root directory
let NERDTreeChDirMode=2
let g:NERDTreeWinSize = 23

" Switching between buffers. 
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
inoremap <C-h> <Esc><C-W>h
inoremap <C-j> <Esc><C-W>j
inoremap <C-k> <Esc><C-W>k
inoremap <C-l> <Esc><C-W>l

" Set Up and Down non-linewise
noremap <Up> gk
noremap <Down> gj

" use Meta key(Windows:Alt) to move cursor in insert mode. 
" Note: if system install "Lingoes Translator", 
"   you will need change/disabled hot key. 
noremap! <M-j> <Down>
noremap! <M-k> <Up>
noremap! <M-h> <left>
noremap! <M-l> <Right>

set pastetoggle=<F2>
"/<C-R><C-W> : 把单个<cword>单词放入搜索或者命令行
nnoremap <silent> <F3> :Grep<CR>
nnoremap <silent> <F4> :Rgrep<CR>
nnoremap <F6> :AutoPreviewToggle<CR>
inoremap <F6> <ESC>:AutoPreviewToggle<CR>i 

" Open and close all the three plugins(source-explore, taglist and nerd-tree) on the same time 
nmap <F8> :TrinityToggleAll<CR>

" --lookupfile--
"  script to generate filenametags
"  #!/bin/sh
"  # generate tag file for lookupfile plugin, use absolute path
"echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
"find `pwd` -not -regex '.*\.\(png\|gif\)' -type f -printf "%f\t%p\t1\n" | \
"sort -f >> filenametags 
"      
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找 
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串 
"let g:LookupFile_PreservePatternHistory = 1     "保存查找历史 
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目 
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件 
if filereadable("./filenametags")                "设置tag文件的名字
let g:LookupFile_TagExpr ='"./filenametags"'
endif

" -- ctags --
set tags+=~/.vim/tagfiles/stl_tags
map <F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+ialS --extra=+q .<CR> <CR>

" -- echofunc Configuration
let g:EchoFuncShowOnStatus = 1
let g:EchoFuncKeyNext='<Esc>+'
let g:EchoFuncKeyPrev='<Esc>-'

" OmniCppComplete      
let OmniCpp_NamespaceSearch = 1      
let OmniCpp_GlobalScopeSearch = 1      
let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess = 1      
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1      
let OmniCpp_MayCompleteScope = 1      
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"] 

" VimTip 329: A map for swapping words 
" http://vim.sourceforge.net/tip_view.php?tip_id= 
" Then when you put the cursor on or in a word, press "\sw", and 
" the word will be swapped with the next word.  The words may 
" even be separated by punctuation (such as "abc = def"). 
nnoremap <unique> <silent><leader>sw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o>

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_ignore_case = 0

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Recommended key-mappings.
" <CR>: close popup and save indent.
" "inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" "inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" "inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"Fast remove highlight search
nmap <silent> <leader><cr> :noh<cr>

" highlight the txt file, which need the txt.vim plugin
au BufRead,BufNewFile * setfiletype txt

" Restore the last quit position when open file. 
 autocmd BufReadPost * 
    \ if line("'\"") > 0 && line("'\"") <= line("$") | 
     \     exe "normal g'\"" | 
     \ endif


" Source Explorer Configuration Begin
" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 

" // Set "Enter" key to jump into the exact definition context 
" let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 

" // In order to Avoid conflicts, the Source Explorer should know what plugins 
" // are using buffers. And you need add their bufname into the list below 
" // according to the command ":buffers!" 
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
        \ "_NERD_tree_", 
        \ "Source_Explorer" 
    \ ] 

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" //  create/update a tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 

" // Set "<F12>" key for updating the tags file artificially 
""let g:SrcExpl_updateTagsKey = "<F12>" 
" Source Explorer Configuration End 
