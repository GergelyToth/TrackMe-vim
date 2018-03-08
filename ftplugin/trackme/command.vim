if !exists("g:trackme_command")
	let g:trackme_file = "~/log.trackme"
endif

function! TrackMeNow()
	echom "I'll ask about the project"
	echom "And than get the description too"
	echom "Finally, will put all of this into the .trackme file that is specified in the config or  to the default one."
endfunction

" TODO: this will only work in the trackme file. We need a global option
nnoremap <localleader>tm :call TrackMeNow()<cr>
