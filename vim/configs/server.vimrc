set nocompatible                    " get out of vi-compatible mode

" local vimrc configuration
" TODO need to figure out where I want this to be
let s:localrc = expand($HOME . '/.vimrc.local')
if filereadable(s:localrc)
  exec ':so ' . s:localrc
endif

filetype on                         " detect the type of file
filetype plugin indent on           " load filetype plugins

set history=1000                    " remember 1000 lines of history
set undolevels=500                  " make sure I can revert back any changes
"set clipboard+=unnamed              " share clipboard among vi windows
set go-=a                           " dont add visual selections to the clipboard
set ffs=unix,dos,mac                " support the filetypes in this order
set viminfo+=!                      " make sure it can save viminfo
set isk+=_,$,@,%,#,-                " none of these should be word dividers

" Make Diff better
set diffopt=filler
set diffopt+=iwhite

set noswapfile                      " don't make the swap files
set nobackup                        " don't make a backup file
set noautowrite                     " do not save the file automatically if it changes
" if using backup, try these
"set backupdir=$HOME/.vim/backup    " where to put backup files
"set directory=/tmp                 " temp directory (this is where .swp files will be)

set lsp=0                           " space text out (easier to read)
set wildmenu                        " make use of the 'status line' to show command line commands, filenames and more
set lz                              " lazy redraw (don't redraw while running macros)
set backspace=indent,eol,start      " Specify backspacing options
set backspace=2                     " make backspace work normal
set whichwrap+=<,>,[,]              " cursor keys can wrap too. normal mode <,> insert mode [,]
set whichwrap+=h,l                  " enable h and l to wrap lines
set shortmess=atI                   " shortens messages to avoid 'press a key' prompt
set report=0                        " tell me when anything is changed via :

set ch=2                            " Command line height
set ic                              " Show incomplete commands
set showcmd                         " Show Incomplete Commands
set so=5                            " Set the resistance to scroll

"set smartcase                       " Override ignorecase if the search pattern is typed in
set ignorecase                      " Ignore case in pattern searchs
set hlsearch                        " Switch on search pattern highlighting.
set showmatch                       " show matching brackets
set mat=2                           " how many tenths of a second to blick matching bracket
set incsearch                       " do 'highlight' as you type your search phrase
set novisualbell                    " don't blink at me
set noerrorbells                    " don't make a sound

"set formatoptions                   " (default "tcq")
"set formatoptions=tcqrn             " see help deals with formating
set formatoptions-=t                 " don't auto wrap long lines

" set a custom text width (80 for python)
set textwidth=0
" set a wrap margin how many charecters before the edge to wrap at.
set wrapmargin=0

set autoindent                      " autoindent
"set smartindent                     " smartindent
"set cindent                         " stricter rules for C programs

set tabstop=2                       " set the same (tabstop)
set shiftwidth=2                    " set the same (tabstop)
set softtabstop=2                   " set the same (tabstop)
set cino=2                          " set the same (tabstop)
set expandtab                       " Expand Tabs to Whitespace
set wrap                            " wrap lines
set showbreak=>..                   " what to put in front of the wrapped line
set number                          " show line numbers
set nolist                          " turn off list by default

" tabs
set tabpagemax=15                   " allow 15 tabs to be open

" windows and buffers
set swb=useopen,usetab
set splitbelow                      " send the split down
set splitright                      " send the split right

" sets chars to represent tab,trail... when in list mode; try ':set list'
" doesn't always need to be used
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" sets status line to display file format, type, current char ascii,hex codes, current cursor position
set laststatus=2                    " always show the status line

" turn off folding, but when needed, these options are useful
set nofoldenable
"set foldmethod=marker
"set fmr={{{,}}}
"set nofen

" Hide the mouse pointer while typing
set mousehide
set mousem=popup
set mouset=500

" mouse modes, if you're into that (n=normal, v=visual)
"set mouse=nv

" Set nice colors
syntax enable
" choose the dark color scheme

set magic                           " Change the special charecters for searching
set smd                             " Enable Show Mode on the last line
set notitle                         " Adding this should prevent the 'Thanks for flying with VIM'

" enable/disable spell check
command! SpellOn setlocal spell spelllang=en_us
command! SpellOff setlocal nospell

map ,sp <ESC>:setlocal spell spelllang=en_us<CR>
map ,p :set invpaste<CR>            " Paste Toggle on ,p

" auto-complete and omnicomplete
" see :help ins-completion and :help complete
set omnifunc=syntaxcomplete#Complete

" allow vim to work normally for crontabs
if $VIM_CRONTAB == "true"
  set nobackup
  set nowritebackup
endif

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
if exists("syntax_on")
  syntax reset
endif
"
"hi Example         guifg=NONE        guibg=NONE        gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

" General colors
hi Normal           guifg=#f6f3e8     guibg=black       gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi NonText          guifg=#070707     guibg=black       gui=NONE      ctermfg=black       ctermbg=NONE        cterm=NONE

hi Cursor           guifg=black       guibg=white       gui=NONE      ctermfg=black       ctermbg=white       cterm=reverse
hi LineNr           guifg=#3D3D3D     guibg=black       gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE

hi VertSplit        guifg=#202020     guibg=#202020     gui=NONE      ctermfg=darkgray    ctermbg=darkgray    cterm=NONE
hi StatusLine       guifg=#CCCCCC     guibg=#202020     gui=italic    ctermfg=white       ctermbg=darkgray    cterm=NONE
hi StatusLineNC     guifg=black       guibg=#202020     gui=NONE      ctermfg=blue        ctermbg=darkgray    cterm=NONE

hi Folded           guifg=#a0a8b0     guibg=#384048     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Title            guifg=#f6f3e8     guibg=NONE        gui=bold      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Visual           guifg=NONE        guibg=#262D51     gui=NONE      ctermfg=NONE        ctermbg=darkgray    cterm=NONE

hi SpecialKey       guifg=#808080     guibg=#343434     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi WildMenu         guifg=green       guibg=yellow      gui=NONE      ctermfg=black       ctermbg=yellow      cterm=NONE
hi PmenuSbar        guifg=black       guibg=white       gui=NONE      ctermfg=black       ctermbg=white       cterm=NONE
"hi Ignore           guifg=gray        guibg=black       gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi Error            guifg=NONE        guibg=NONE        gui=undercurl ctermfg=white       ctermbg=red         cterm=NONE     guisp=#FF6C60 " undercurl color
hi ErrorMsg         guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE
hi WarningMsg       guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE

" Message displayed in lower left, such as --INSERT--
hi ModeMsg          guifg=black       guibg=#C6C5FE     gui=BOLD      ctermfg=black       ctermbg=cyan        cterm=BOLD

if version >= 700 " Vim 7.x specific colors
  hi CursorLine     guifg=NONE        guibg=#121212     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=BOLD
  hi CursorColumn   guifg=NONE        guibg=#121212     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=BOLD
  hi MatchParen     guifg=#f6f3e8     guibg=#857b6f     gui=BOLD      ctermfg=white       ctermbg=darkgray    cterm=NONE
  hi Pmenu          guifg=#f6f3e8     guibg=#444444     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
  hi PmenuSel       guifg=#000000     guibg=#cae682     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
  hi Search         guifg=NONE        guibg=NONE        gui=underline ctermfg=NONE        ctermbg=NONE        cterm=underline
endif

" Syntax highlighting
hi Comment          guifg=#7C7C7C     guibg=NONE        gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
hi String           guifg=#A8FF60     guibg=NONE        gui=NONE      ctermfg=green       ctermbg=NONE        cterm=NONE
hi Number           guifg=#FF73FD     guibg=NONE        gui=NONE      ctermfg=magenta     ctermbg=NONE        cterm=NONE

hi Keyword          guifg=#96CBFE     guibg=NONE        gui=NONE      ctermfg=blue        ctermbg=NONE        cterm=NONE
hi PreProc          guifg=#96CBFE     guibg=NONE        gui=NONE      ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Conditional      guifg=#6699CC     guibg=NONE        gui=NONE      ctermfg=blue        ctermbg=NONE        cterm=NONE  " if else end

hi Todo             guifg=#8f8f8f     guibg=NONE        gui=NONE      ctermfg=red         ctermbg=NONE        cterm=NONE
hi Constant         guifg=#99CC99     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE

hi Identifier       guifg=#C6C5FE     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Function         guifg=#FFD2A7     guibg=NONE        gui=NONE      ctermfg=brown       ctermbg=NONE        cterm=NONE
hi Type             guifg=#FFFFB6     guibg=NONE        gui=NONE      ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi Statement        guifg=#6699CC     guibg=NONE        gui=NONE      ctermfg=lightblue   ctermbg=NONE        cterm=NONE

hi Special          guifg=#E18964     guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE
hi Delimiter        guifg=#00A0A0     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Operator         guifg=white       guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE

hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special


" Special for Ruby
hi rubyRegexp                  guifg=#B18A3D      guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
hi rubyRegexpDelimiter         guifg=#FF8000      guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
hi rubyEscape                  guifg=white        guibg=NONE      gui=NONE      ctermfg=cyan           ctermbg=NONE      cterm=NONE
hi rubyInterpolationDelimiter  guifg=#00A0A0      guibg=NONE      gui=NONE      ctermfg=blue           ctermbg=NONE      cterm=NONE
hi rubyControl                 guifg=#6699CC      guibg=NONE      gui=NONE      ctermfg=blue           ctermbg=NONE      cterm=NONE  "and break, etc
"hi rubyGlobalVariable          guifg=#FFCCFF      guibg=NONE      gui=NONE      ctermfg=lightblue      ctermbg=NONE      cterm=NONE  "yield
hi rubyStringDelimiter         guifg=#336633      guibg=NONE      gui=NONE      ctermfg=lightgreen     ctermbg=NONE      cterm=NONE
"rubyInclude
"rubySharpBang
"rubyAccess
"rubyPredefinedVariable
"rubyBoolean
"rubyClassVariable
"rubyBeginEnd
"rubyRepeatModifier
"hi link rubyArrayDelimiter    Special  " [ , , ]
"rubyCurlyBlock  { , , }

hi link rubyClass             Keyword
hi link rubyModule            Keyword
hi link rubyKeyword           Keyword
hi link rubyOperator          Operator
hi link rubyIdentifier        Identifier
hi link rubyInstanceVariable  Identifier
hi link rubyGlobalVariable    Identifier
hi link rubyClassVariable     Identifier
hi link rubyConstant          Type


" Special for Java
" hi link javaClassDecl    Type
hi link javaScopeDecl         Identifier
hi link javaCommentTitle      javaDocSeeTag
hi link javaDocTags           javaDocSeeTag
hi link javaDocParam          javaDocSeeTag
hi link javaDocSeeTagParam    javaDocSeeTag

hi javaDocSeeTag              guifg=#CCCCCC     guibg=NONE        gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
hi javaDocSeeTag              guifg=#CCCCCC     guibg=NONE        gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
"hi javaClassDecl              guifg=#CCFFCC     guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE


" Special for XML
hi link xmlTag          Keyword
hi link xmlTagName      Conditional
hi link xmlEndTag       Identifier


" Special for HTML
hi link htmlTag         Keyword
hi link htmlTagName     Conditional
hi link htmlEndTag      Identifier


" Special for Javascript
hi link javaScriptNumber      Number


" Special for Python
"hi  link pythonEscape         Keyword


" Special for CSharp
hi  link csXmlTag             Keyword


" Special for PHP
hi pythonSpaceError ctermbg=red guibg=red

hi Comment ctermfg=darkgray

hi StatusLine ctermbg=darkgrey ctermfg=white
hi StatusLineNC ctermbg=black ctermfg=lightgrey
hi VertSplit ctermbg=black ctermfg=lightgrey
hi LineNr ctermfg=darkgray
hi CursorLine     guifg=NONE        guibg=#121212     gui=NONE      ctermfg=NONE        ctermbg=234
hi Function         guifg=#FFD2A7     guibg=NONE        gui=NONE      ctermfg=yellow       ctermbg=NONE        cterm=NONE
hi Visual           guifg=NONE        guibg=#262D51     gui=NONE      ctermfg=NONE        ctermbg=236    cterm=NONE

hi Error            guifg=NONE        guibg=NONE        gui=undercurl ctermfg=16       ctermbg=red         cterm=NONE     guisp=#FF6C60 " undercurl color
hi ErrorMsg         guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=16       ctermbg=red         cterm=NONE
hi WarningMsg       guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=16       ctermbg=red         cterm=NONE
hi SpellBad       guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=16       ctermbg=160         cterm=NONE

" ir_black doesn't highlight operators for some reason
hi Operator        guifg=#6699CC     guibg=NONE        gui=NONE      ctermfg=lightblue   ctermbg=NONE        cterm=NONE

highlight DiffAdd term=reverse cterm=bold ctermbg=lightgreen ctermfg=16
highlight DiffChange term=reverse cterm=bold ctermbg=lightblue ctermfg=16
highlight DiffText term=reverse cterm=bold ctermbg=lightgray ctermfg=16
highlight DiffDelete term=reverse cterm=bold ctermbg=lightred ctermfg=16

highlight PmenuSel ctermfg=16 ctermbg=156

hi Comment ctermfg=243
hi LineNr ctermfg=238
hi Search ctermfg=gray ctermbg=58 cterm=NONE
hi SpellBad cterm=underline ctermfg=160 ctermbg=NONE term=NONE
hi CursorLine               ctermbg=234  cterm=NONE term=NONE
hi Type                     ctermfg=147
hi Function                 ctermfg=49
hi String                   ctermfg=131 " 70,76,82-85,112-114,118-120,140,153

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

set background=dark
hi clear

