if !exists("g:trackme_command")
	let g:trackme_file = '~/log.trackme'
endif

function! TrackMeNow()
  let l:timenow = strftime('%Y/%m/%d %H:%M')
  let l:project = toupper(input('Project Name: '))

  " if we don't pass anything into the function, cancel the execution of the function
  if l:project == ''
    redraw | echo "Cancelled TrackMe"
    return
  endif

  let l:task = input('Task Description: ')

  " if there is no task description, skip it
  if l:task == ''
    let l:track_line = l:timenow . ' - ' . l:project
  else
    let l:track_line = l:timenow . ' - ' . l:project . ': ' . l:task
  endif

  " if the last log was from an other day, insert a linebreak
  let l:trackme_file_realpath = trim(system('realpath ' . g:trackme_file))
  for l:line in readfile(l:trackme_file_realpath, '', -1)
    if s:TrackMeGetDateFromLine(l:timenow) != s:TrackMeGetDateFromLine(l:line)
      execute 'silent !echo \ >> ' . g:trackme_file
    endif
  endfor

  execute 'silent !echo ' . track_line . ' >> ' . g:trackme_file

  echo track_line . ' saved to ' . g:trackme_file
endfunction

function! s:TrackMeGetDateFromLine(dateLine)
  let l:year = matchstr(a:dateLine, "^[0-9][0-9][0-9][0-9]")
  let l:month = matchstr(a:dateLine, "\/[0-9][0-9]\/")
  let l:day = matchstr(a:dateLine, "\/[0-9][0-9] ")
  return [l:year, l:month, l:day]
endfunction

nnoremap <leader>tm :call TrackMeNow()<cr>
