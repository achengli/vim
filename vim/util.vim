function! util#source(path)
	let full_path = $HOME . '/.config/nvim/vim/' . a:path
	exec 'source ' . full_path
endfunction
