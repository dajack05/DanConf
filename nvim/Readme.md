# NVIM Configuration

## Setup

1. Intall nvim (v0.10 or greater) [neovim.io](https://www.neovim.io)
2. Install a Nerd Font [nerd fonts](https://www.nerdfonts.com)
3. Install NVChad [nvchad.com](https://www.nvchad.com)
    - [Installation Instructions](https://www.nvchad.com/docs/quickstart/install)

## Plugins

1. Add required plugins to '~/.config/nvim/lua/plugins/init.lua'.
    - "nvim-neotest/nvim-nio"
    - "simrat39/rust-tools.nvim"
    - "mfussenegger/nvim-dap"
    - "rcarriga/nvim-dap-ui"
2. Add "rust" to the tree-sitter ensure_installed section:

``` lua
{
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "vim", "lua", "vimdoc",
            "html", "css", "rust"
        },
    },
},
```

### Final `~/.config/nvim/lua/plugins/init.lua`:

``` lua
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
```

3. Set our nvim theme to the BEST theme ever [Catppuccin](https://www.catppuccin.com)
    
    `~/.config/nvim/lua/chadrc.lua`
   
    ```lua
    ---@type ChadrcConfig
    local M = {}
    
    M.ui = {
        theme = "catppuccin",
    }

    return M
    ```

4. Create our config files (All in `~/.config/nvim/lua/configs/`)

    ### rust_config.lua
    
    ```lua
    local rt = require("rust-tools")
    
    local mason_registry = require("mason-registry")
    
    local codelldb = mason_registry.get_package("codelldb")
    local extension_path = codelldb:get_install_path() .. "/extension/"
    local codelldb_path = extension_path .. "adapter/codelldb"
    local liblldb_path = extension_path .. "lldb/lib/lldb.dylib"
    
    rt.setup({
      dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
      },
      server = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function (_, bufnr)
          vim.keymap.set("n", "<Leader>k", rt.hover_actions.hover_actions, {buffer = bufnr})
          vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, {buffer = bufnr})
        end,
      },
      tools = {
        hover_actions = {
          auto_focus = true,
        },
      },
    })
    ```

    ### dap_config.lua
    
    ```lua
    require("dapui").setup()
    
    local dap, dapui = require("dap"), require("dapui")
    
    dap.listeners.after.event_initialized["dapui_config"] = function ()
      dapui.open()
    end
    dap.listeners.before.event_initialized["dapui_config"] = function ()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function ()
      dapui.close()
    end
    
    vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
    vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
    vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
    ```

5. Add those configs into `~/.config/nvim/init.lua`
    
    ```lua
    require "configs.rust_config"
    require "configs.dap_config"
    ```
