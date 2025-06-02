local lspconfig = require'lspconfig'
local cap = require'cmp_nvim_lsp'.default_capabilities()

lspconfig.vimls.setup{}

lspconfig.lua_ls.setup{
  on_init = function(client)

    local path = os.getenv('PWD')

    if client.workspace_folders then
      path = client.workspace_folders[1].name
    end

    if vim.loop.fs_stat(path .. '/.luarc.json') or
      vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua,{
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
      completion = {
        callSnippet = 'Replace',
      },
    }
  },
  Lua = {
    runtime = {
      version = "LuaJIT",
    },
    diagnostics ={
      globals = {"vim"},
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file ("", true),
    },
    telemetry = {
      enable = false,
    },
  }
}

lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        }
      }
    }
  }
}

lspconfig.ts_ls.setup {
  init_options = {},
  filetypes = {
    'javascript',
    'typescript',
  }
}

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

lspconfig.r_language_server.setup{}

require'lspconfig'.bashls.setup{
  capabilities = cap,
}

require'lspconfig'.cssls.setup {
  capabilities = cap,
}
