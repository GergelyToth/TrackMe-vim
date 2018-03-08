setlocal foldmethod=expr
setlocal foldexpr=GetTrackmeFold(v:lnum)

" TODO: write a foldmethod that will fold the same days together
function! GetTrackmeFold(lnum)
	return '0'
endfunction
