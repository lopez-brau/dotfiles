return {
	"nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        commands = {
          -- Replace the default "delete" command with "trash".
          delete = function(state)
            local inputs = require("neo-tree.ui.inputs")
            local path = state.tree:get_node().path
            local msg = "Are you sure you want to trash '" .. path .. "'?"
            inputs.confirm(msg, function(confirmed)
              if not confirmed then return end
              vim.fn.system({"trash", vim.fn.fnameescape(path)})
              require("neo-tree.sources.manager").refresh(state.name)
            end)
          end,

          -- Replace the default "delete_visual" command with "trash".
          delete_visual = function(state, selected_nodes)
            local inputs = require("neo-tree.ui.inputs")
            local count = vim.tbl_count(selected_nodes)
            local msg = "Are you sure you want to trash " .. count .. " files?"
            inputs.confirm(msg, function(confirmed)
              if not confirmed then return end
              for _, node in ipairs(selected_nodes) do
                vim.fn.system({"trash", vim.fn.fnameescape(node.path)})
              end
              require("neo-tree.sources.manager").refresh(state.name)
            end)
          end
        }
      }
    })

    -- Set up a keybind to reveal the filesystem tree.
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<cr>", {})
  end
}
