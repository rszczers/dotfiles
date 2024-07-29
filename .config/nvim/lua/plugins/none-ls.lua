local function run_config()
  local null_ls = require("null-ls")
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
    },
  })
  vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
end

return {
  "nvimtools/none-ls.nvim",
  config = run_config,
}
