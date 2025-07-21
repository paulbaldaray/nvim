return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  keys = {
    { '<leader>ee', '<CMD>Oil<CR>', desc = 'Open parent directory with Oil' },
    {
      '<leader>e',
      function()
        local current_file_path = vim.api.nvim_buf_get_name(0)
        
        if current_file_path == "" or vim.fn.isdirectory(current_file_path) == 1 then
            vim.notify("No file in current buffer, opening Oil in CWD.", vim.log.levels.INFO)
            return
        end

        local dir_path = vim.fn.fnamemodify(current_file_path, ":p:h")

        require('oil').open(dir_path)
      end,
    },
  },
  opts = {
    default_file_explorer = false,
    columns = { 'icon', 'permissions' }
  },
  config = function(_, opts)
    require('oil').setup(opts)
    local actions = require('oil').actions
  end
}
