local function run_config()
  local opts = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        auto_install = true,
        -- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", " },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  }
  require("nvim-treesitter").setup(opts)
end

return { "nvim-treesitter/nvim-treesitter", config = run_config }
