return {
{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
    branch = "master",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"c",
				"cpp",
				"cmake",
				"make",
				"ninja",
				"dockerfile",
				"git_config",
				"gitattributes",
				"gitignore",
				"jinja",
				"json",
				"python",
				"ssh_config",
				"yaml",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"vim",
				"vimdoc",
			},
    indent = { enable = true }, ---@type lazyvim.TSFeat
    highlight = { enable = true }, ---@type lazyvim.TSFeat
    folds = { enable = true }, ---@type lazyvim.TSFeat
    auto_install = true,
    }
  }
}
