-- local function config()
-- 	local opts = {
-- 		load = {
-- 			["core.defaults"] = {},
-- 			["core.concealer"] = {},
-- 			["core.dirman"] = {
-- 				config = {
-- 					workspaces = {
-- 						notes = "~/notes",
-- 					},
-- 					default_workspace = "notes",
-- 				},
-- 			},
-- 		},
-- 	}
-- 	vim.wo.foldlevel = 99
-- 	vim.wo.conceallevel = 2
-- 	require("neorg").setup(opts)
-- end

 return {
--  	"nvim-neorg/neorg",
--  	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
--  	version = "*", -- Pin Neorg to the latest stable release
--  	config = config,
 }
