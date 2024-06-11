return {
  "nvim-neotest/nvim-nio",
  "simrat39/rust-tools.nvim",
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "rust"
  		},
  	},
  },
}
