augroup RubySpecs
  au!
  autocmd BufRead,BufNewFile *_spec.rb,spec_*.rb
    \ :nmap gt V:<C-U>!$HOME/.vim/bin/vim_focused_rspec.rb
    \ % <C-R>=line("'<")<CR>p <CR>|
    \ :nmap gT :!rspec %<CR>
augroup END
