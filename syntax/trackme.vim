if exists("b:current_syntax")
	finish
endif

syntax match trackmeDateAndTime /\d\{4}\/\d\{2}\/\d\{2} \d\{2}\:\d\{2}/
highlight link trackmeDateAndTime Function

syntax match trackmeProject /\[.*\]/
highlight link trackmeProject KeyWord

let b:current_syntax = "trackme"
