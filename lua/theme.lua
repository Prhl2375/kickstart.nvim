require('nvim-tree').setup {
  view = {
    width = vim.api.nvim_get_option 'columns', -- Set the width to the full screen width
  },
}
