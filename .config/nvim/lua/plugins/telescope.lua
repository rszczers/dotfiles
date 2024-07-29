local function run_config()
  local builtin = require("telescope.builtin")
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
end

local function select_config()
  local opts = {
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
      }
    }
  }
  require("telescope").setup(opts)
  require("telescope").load_extension("ui-select")
end

return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = run_config
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = select_config
  }
}
