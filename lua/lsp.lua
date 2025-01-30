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
      ensure_installed = {
        'pyright',
        'lua_ls',
        'texlab',
        'phpactor',
        'jdtls',
        'yamlls',
        'jsonls',
        'html',
        'cssls',
        'clangd',
        'sqlls',
        'omnisharp',
        'dockerls',
        'marksman',
        'stylelint_lsp',
        'emmet_language_server',
      },
    }
    require('mason-null-ls').setup {
      ensure_installed = {
        'prettier', -- Formatter for JS, TS, HTML, CSS
        'stylua', -- Formatter for Lua
        'eslint_d', -- Linter for JavaScript/TypeScript
        'shfmt', -- Formatter for Shell scripts
        'shellcheck', -- Linter for Shell scripts
        'blade-formatter',
      },
      automatic_installation = true,
    }
    require('lspconfig').cssls.setup {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true },
      },
    }
    require('lspconfig').stylelint_lsp.setup {
      filetypes = { 'css', 'scss', 'less' },
      settings = {
        stylelintplus = {
          autoFixOnSave = true,
          autoFixOnFormat = true,
        },
      },
    }
    require('lspconfig').emmet_language_server.setup {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      filetypes = { 'css', 'scss', 'html', 'javascriptreact', 'typescriptreact', 'blade' },
    }
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = 'https://github.com/EmranMR/tree-sitter-blade',
        files = { 'src/parser.c' },
        branch = 'main',
      },
      filetype = 'blade',
    }
    local lspconfig = require 'lspconfig'
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Set up only the servers you've explicitly defined
  end,
}
