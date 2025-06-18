local lspconfig = require'lspconfig'

local cap = require'cmp_nvim_lsp'.default_capabilities()

-- Vimscript
lspconfig.vimls.setup {}

-- Lua
lspconfig.lua_ls.setup {

  on_init = function(client)

<<<<<<< HEAD
    local path = os.getenv('PWD')

    if client.workspace_folders then
      path = client.workspace_folders[1].name
    end

    if vim.loop.fs_stat(path .. '/.luarc.json') or
      vim.loop.fs_stat(path .. '/.luarc.jsonc') then
=======
    local path = client.workspace_folders and client.workspace_folders[1].name or os.getenv('PWD')

    if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
>>>>>>> b3f6c1b (cleanup)
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
<<<<<<< HEAD
  Lua = {
    runtime = {
      version = "LuaJIT",
    },
    diagnostics ={
      globals = {"vim"},
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file ("", true),
=======

  Lua = {
    runtime = {
      version = 'LuaJIT',
    },
    diagnostics = {
      globals = {'vim'},
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file ('', true),
>>>>>>> b3f6c1b (cleanup)
    },
    telemetry = {
      enable = false,
    },
  }
}

-- python
lspconfig.pylsp.setup {
  settings = { pylsp = { plugins = { pycodestyle = { maxLineLength = 100 }}}}
}

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

require'lspconfig'.cssls.setup {
  capabilities = cap,
}
