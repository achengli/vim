lua << EOF
vim.diagnostic.config{
virtual_text = true,
float = {
  border = 'rounded',
},
}
EOF

hi DiagnosticVirtualTextError guibg=none
hi DiagnosticFloatingError guibg=none
hi DiagnosticError guibg=none
