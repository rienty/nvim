autocmd Filetype tex imap ,g <esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype tex imap ,r $ <--> $<++><esc>?<--><CR>N:nohlsearch<CR>c4l
autocmd Filetype tex imap ,t $$ <--> $$<++><esc>?<--><CR>N:nohlsearch<CR>c4l
autocmd Filetype tex imap _ _{<-->}<++><esc>?<--><CR>N:nohlsearch<CR>di{i
autocmd Filetype tex imap ^ ^{<-->}<++><esc>?<--><CR>N:nohlsearch<CR>di{i
autocmd Filetype tex imap ,w <esc>:w<CR>a
autocmd Filetype tex imap ,c <esc>:w<CR>:TexlabBuild<CR>a
autocmd Filetype tex imap ,v <esc>:w<CR>:TexlabForward<CR>a
autocmd Filetype tex imap ,n <esc>:e .local/share/nvim/site/pack/packer/start/friendly-snippets/snippets/latex/latex-snippets.json<CR>

autocmd Filetype tex imap .b \beta
autocmd Filetype tex imap .a \alpha
autocmd Filetype tex imap .g \gamma
autocmd Filetype tex imap .d \delta
autocmd Filetype tex imap .e \epsilon
autocmd Filetype tex imap .t \eta
autocmd Filetype tex imap .r \rho
autocmd Filetype tex imap .G \Gamma
autocmd Filetype tex imap .h \theta
autocmd Filetype tex imap .m \sigma
autocmd Filetype tex imap .f \phi
autocmd Filetype tex imap .p \pi
autocmd Filetype tex imap .u \mu

autocmd Filetype tex imap .I \infty
autocmd Filetype tex imap .R \Ric
autocmd Filetype tex imap .S \sec
autocmd Filetype tex imap .V \vol























