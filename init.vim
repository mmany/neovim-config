" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
set number relativenumber
"Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox' " Color theme
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Completion
Plug 'preservim/nerdtree', {'branch': 'release'} "File manager
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "Fuzzy finder
Plug 'mbbill/undotree' "Undo history

" Html plugins
Plug 'mattn/emmet-vim' "Html plugin for fast tag writing,plug-in which provides support for expanding abbreviations similar to emmet.
Plug 'alvan/vim-closetag' "Helps to close html tag
Plug 'tpope/vim-surround' "surround quickly words with symbol or tag
Plug 'jelera/vim-javascript-syntax' "Javascript syntax highlighting
Plug 'moll/vim-node' "For node.js developemnt
Plug 'heavenshell/vim-jsdoc' "Generates documentation lines for javascript
Plug 'pangloss/vim-javascript' "provides syntax highlighting and improved indentation for javascipt
Plug 'tpope/vim-repeat' "Repeat.vim remaps . in a way that plugins can tap into it.
Plug 'jackguo380/vim-lsp-cxx-highlight' "plugin that provides C/C++/Cuda/ObjC semantic highlighting using the language server protocol
Plug 'cdelledonne/vim-cmake' "plugin for building CMake projects inside of Vim/Neovim, with a nice visual feedback.

" Initialize plugin system
call plug#end()
colorscheme gruvbox
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
nnoremap <space> <nop>
let mapleader = " "
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k


" NERDtree
nnoremap <leader>n :NERDTreeFind<CR>

" FZF
nnoremap <leader>f :FZF ~<CR>

" Undo tree
nnoremap <leader>u :UndotreeToggle<CR>
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nmap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>ge  <Plug>(coc-diagnostic-next)
nmap <leader>gE  <Plug>(coc-diagnostic-prev)
" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <leader>si :source $MYVIMRC<CR>


" emmet
let g:user_emmet_leader_key = ','
nmap <silent> <leader>lic :!open %<CR>

nmap <silent> <leader>ssh :CocCommand clangd.switchSourceHeader<CR>


