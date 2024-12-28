return {
  'williamboman/mason.nvim',
  build = ':MasonUpdate',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = { 'pyright', 'lua_ls', 'texlab' },
    }

    local lspconfig = require 'lspconfig'
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Define which servers you want to configure
    local servers = {
      pyright = {},
      lua_ls = {},
      texlab = {},
      phpactor = {
        cmd = { 'phpactor', 'language-server' },
        filetypes = { 'php' },
        root_dir = lspconfig.util.root_pattern('composer.json', '.git', 'composer.lock'),
      },
    }

    -- Set up only the servers you've explicitly defined
    for server, config in pairs(servers) do
      config.capabilities = capabilities
      config.on_attach = function(client, bufnr)
        local bufmap = function(mode, lhs, rhs, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, lhs, rhs, opts)
        end
        bufmap('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
        bufmap('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
        bufmap('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename Symbol' })
      end
      lspconfig[server].setup(config)
    end
  end,
}
