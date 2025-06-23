return {
  lazy = false,
  priority = 1000,
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
  scope = {
      enabled = true,
      show_start = false,
      show_end = false,
    },
  },
}
