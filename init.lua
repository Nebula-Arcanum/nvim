---=== Set up mini.nvim ===---
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

--- Set up 'mini.deps' --
require('mini.deps').setup({ path = { package = path_package } })

--== Set up the rest of mini.nvim ==--
--= Text editing =--
require('mini.ai').setup()
require('mini.comment').setup()
require('mini.completion').setup()
-- require('mini.keymap').setup()
require('mini.move').setup()
require('mini.operators').setup()
require('mini.pairs').setup()
require('mini.snippets').setup()
local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup({
  snippets = {
    -- Load custom file with global snippets first (adjust for Windows)
    gen_loader.from_file('~/.config/nvim/snippets/global.json'),

    -- Load snippets based on current language by reading files from
    -- "snippets/" subdirectories from 'runtimepath' directories.
    gen_loader.from_lang(),
  },
})


require('mini.splitjoin').setup()
require('mini.surround').setup()

--= General workflow =--
require('mini.basics').setup({
	options = {
		basic = true,
		extra_ui = false,
      win_borders = 'double'
	},
	mappings = {
		windows = true,
		move_with_alt = true,
      option_toggle_prefix = [[,]]
	}
})
require('mini.bracketed').setup()
require('mini.bufremove').setup()

local miniclue = require('mini.clue')
miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = 'n', keys = '<Leader>' },
		{ mode = 'x', keys = '<Leader>' },
		{ mode = 'n', keys = '\\' },
		{ mode = 'x', keys = '\\' },

		-- Built-in completion
		{ mode = 'i', keys = '<C-x>' },

		-- `g` key
		{ mode = 'n', keys = 'g' },
		{ mode = 'x', keys = 'g' },

		-- `[]`
		{ mode = 'n', keys = '[' },
		{ mode = 'x', keys = '[' },
		{ mode = 'n', keys = ']' },
		{ mode = 'x', keys = ']' },

		-- Marks
		{ mode = 'n', keys = "'" },
		{ mode = 'n', keys = '`' },
		{ mode = 'x', keys = "'" },
		{ mode = 'x', keys = '`' },

		-- Registers
		{ mode = 'n', keys = '"' },
		{ mode = 'x', keys = '"' },
		{ mode = 'i', keys = '<C-r>' },
		{ mode = 'c', keys = '<C-r>' },


		-- Window commands
		{ mode = 'n', keys = '<C-w>' },

		-- `z` key
		{ mode = 'n', keys = 'z' },
		{ mode = 'x', keys = 'z' },
	},

	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},
})

-- require('mini.diff').setup()
-- require('mini.extra').setup()
require('mini.files').setup()
-- require('mini.git').setup()
-- require('mini.jump').setup()
-- require('mini.jump2d').setup()
-- require('mini.misc').setup()
require('mini.pick').setup()
-- require('mini.sessions').setup()
-- require('mini.visits').setup()

--= Appearance =--
require('mini.animate').setup()
-- require('mini.base16').setup()
-- require('mini.colors').setup()
-- require('mini.cursorword').setup()
-- require('mini.hipatterns').setup()
-- require('mini.hues').setup()
require('mini.icons').setup()
require('mini.indentscope').setup()
-- require('mini.map').setup()
-- require('mini.notify').setup()
require('mini.starter').setup()
require('mini.statusline').setup()
require('mini.tabline').setup()
require('mini.trailspace').setup()

--= Other =--
-- require('mini.doc').setup()
-- require('mini.fuzzy').setup()
-- require('mini.test').setup()



---=== Plugins ===---
local add = MiniDeps.add

add({source = 'lervag/vimtex'})
add({source = 'scottmckendry/cyberdream.nvim'})



---=== Options ===---
local cmd = vim.cmd
local opt = vim.opt
opt.termguicolors = true
--==Colorscheme==--
--Colorscheme config must be set before the colorscheme is loaded, otherwise it will not be applied
require("cyberdream").setup({
	colors = {
		bg = "#000000"
	}
})
cmd("colorscheme cyberdream")

--=Tabs=--
cmd("set expandtab")
cmd("set tabstop=3")
cmd("set softtabstop=3")
cmd("set shiftwidth=3")

cmd("set pumblend=80")
cmd("set pumheight=80")
cmd("set winblend=20")

opt.relativenumber = true

---VimTeX---
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_fold_enabled = true



---=== Keymaps ===---
vim.g.mapleader = " "

local key = vim.keymap.set

--== Picker ==--
key( 'n', '<leader>ff', ":Pick files<CR>", { desc = "Pick files" })
key( 'n', '<leader>fg', ":Pick grep_live<CR>", { desc = "Pick live grep" })
key( 'n', '<leader>fb', ":Pick buffers<CR>", { desc = "Pick buffers" })
key( 'n', '<leader>fh', ":Pick help<CR>", { desc = "Pick help" })

--== File tree ==--
key( 'n', '<leader>t', ":lua MiniFiles.open()<CR>", {})
