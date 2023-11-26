local telescope = require("telescope")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")

telescope.setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = "❯ ",
    color_devicons = true,
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    winblend = 10,
    mappings = {
      n = {
        ["<CR>"] = actions.select_default + actions.center,
        s = actions.select_horizontal,
        v = actions.select_vertical,
        t = actions.select_tab,
        j = actions.move_selection_next,
        k = actions.move_selection_previous,
        u = actions.preview_scrolling_up,
        d = actions.preview_scrolling_down,
      },
    },
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

local builtin = require("telescope.builtin")

local function get_workspace_folder()
  return vim.lsp.buf.list_workspace_folders()[1] or vim.fn.systemlist("git rev-parse --show-toplevel")[1]
end

telescope
  .register_extension({
    setup = function()
      builtin.live_grep_workspace = function(opts)
        opts.cwd = get_workspace_folder()
        builtin.live_grep(opts)
      end

      builtin.find_files_workspace = function(opts)
        opts.cwd = get_workspace_folder()
        builtin.find_files(opts)
      end

      builtin.grep_string_workspace = function(opts)
        opts.cwd = get_workspace_folder()
        builtin.grep_string(opts)
      end
    end,
  })
  .setup({
    mappings = {
      ["<CR>"] = {
        keepinsert = true,
        action = function(selection)
          telescope.extensions.file_browser.file_browser({ cwb = selection.path })
        end,
      },
    },
  })
