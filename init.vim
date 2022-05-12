" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
set number relativenumber
call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mbbill/undotree'

" Html plugins
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'jelera/vim-javascript-syntax'
Plug 'moll/vim-node'
Plug 'heavenshell/vim-jsdoc'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-repeat'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'cdelledonne/vim-cmake'
Plug 'richq/vim-cmake-completion'

"Plug 'jpalardy/vim-slime', { 'for': 'python' }

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

" Any valid git URL is allowed

" Multiple Plug commands can be written in a single line using | separators

" On-demand loading

" Using a non-default branch

" Using a tagged rlease; wildcard allowed (requires git 1.9.2 or above)
" Plugin options
" Plugin outside ~/.vim/plugged with post-update hook

" Unmanaged plugin (manually installed and updated)

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


