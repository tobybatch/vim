if exists("did_load_filetypes")
finish
endif
augroup filetypedetect
au! BufRead,BufNewFile *.module setfiletype php
augroup END

