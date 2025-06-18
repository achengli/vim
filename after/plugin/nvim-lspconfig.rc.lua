local lspconfig = require'lspconfig'

local cap = require'cmp_nvim_lsp'.default_capabilities()

-- Vimscript
lspconfig.vimls.setup {}

-- Lua
lspconfig.lua_ls.setup {

  on_init = function(client)

    local path = client.workspace_folders and client.workspace_folders[1].name or os.getenv('PWD')

    if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua,
    {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        }
      }
    })
  end,
  settings = {
    Lua = {
      completion = { callSnippet = 'Replace'},
    }
  },

  Lua = {
    runtime = {
      version = 'LuaJIT',
    },
    diagnostics = {
      globals = {'vim'},
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file ('', true),
    },
    telemetry = {
      enable = false,
    },
  }
}

-- python
lspconfig.pyright.setup {}

-- Rust 
lspconfig.rust_analyzer.setup {
  capabilities = cap,

  settings = {
    ['rust-analyzer'] = {
      diagnostics = true,
    },
  },

  filetypes = {
    'rust',
  },
}

-- clang 
lspconfig.clangd.setup{
  cmd = {
    "clangd",
    "--function-arg-placeholders",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy"
  },
  init_options = {
    completion = {
      placeholder = true,
    },
  },
  capabilities = cap
}

-- R lang
lspconfig.r_language_server.setup{
  capabilities = cap,
}

-- bash
lspconfig.bashls.setup{
  capabilities = cap,
}
