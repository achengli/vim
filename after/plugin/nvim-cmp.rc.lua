local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup{
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.scroll_docs(-2),
    ['<C-j>'] = cmp.mapping.scroll_docs(2),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-a>'] = cmp.mapping.abort(),
    ['<C-o>'] = cmp.mapping.confirm({select = true}),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
    { name = 'cmdline' },
  }),
  matching = {disallow_symbol_nonprefix_matching = false },
  window = {
    completion = {
      border = 'rounded',
      winhighlight = 'Normal:CmpNormal',
    },
    documentation = {
      border = 'rounded',
      winhighlight = 'Normal:CmpNormal',
    },
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 80,
      ellipsis_char = '...',
      show_labelDetails = true,
      before = function (_, vim_item)
        return vim_item
      end
    })
  },
  completion = {completeopt = "menu,menuone,noinsert"},
}
