return {
  { 'pocco81/auto-save.nvim' },
  {
    'gbprod/phpactor.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('phpactor').setup {
        -- Optional: Add your custom configurations here
      }
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Optional for file icons
    config = function()
      require('nvim-tree').setup {
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        view = {
          width = 30,
          side = 'left',
        },
      }
    end,
  },
}
