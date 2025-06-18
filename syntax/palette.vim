syntax match paletteVar /^[^= +{}()&|]\+/
syntax match paletteValue /[^= +{}()&|]\+$/
syntax match paletteHeader /^[[][[:alnum:]]\+[]]$/
syntax match paletteColor /#[abcdefABCDEF0-9]\{6\}/

hi link paletteVar Tag
hi link paletteValue Character
hi link paletteHeader Statement
hi link paletteColor NormalNC
