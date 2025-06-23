return { -- Autocompletion
  'saghen/blink.cmp',
  lazy = false,
  priority = 1000,
  event = 'VimEnter',
  version = '1.*',
  dependencies = {},
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Enter>"] = { "select_and_accept", "fallback" },
      ["<C-U>"] = { "scroll_documentation_up", "fallback" },
      ["<C-D>"] = { "scroll_documentation_down", "fallback" },
      -- All presets have the following mappings:
      -- <tab>/<s-tab>: move to right/left of your snippet expansion
      -- <c-space>: Open menu or open docs if already open
      -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
      -- <c-e>: Hide menu
      -- <c-k>: Toggle signature help
    },

    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = {
      documentation = {
        auto_show = false,
        auto_show_delay_ms = 500,
        window = {
          border = 'rounded',
          min_width = 25,
        },
      },
      menu = {
        auto_show = false,
        border = 'rounded',
        winblend = 0,
        scrollbar = false,
        winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
        min_width = 25,
        -- nvim-cmp style menu
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" },
            padding = {
              left = 3,
              right = 3
            },
          },
        }
      },
    },

    ghost_text = { enabled = false },
    sources = {
      default = { 'lsp', 'path', 'buffer' },
      providers = {
      },
    },
    fuzzy = { implementation = 'lua' },
    signature = { enabled = false },
  },
}
