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
-- require('mini.completion').setup() PRIORITY
-- require('mini.keymap').setup()
require('mini.move').setup()
require('mini.operators').setup()
require('mini.pairs').setup()
-- require('mini.snippets').setup() PRIORITY
require('mini.splitjoin').setup()
require('mini.surround').setup()

--= General workflow =--
-- require('mini.basics').setup()
require('mini.bracketed').setup()
-- require('mini.bufremove').setup()
require('mini.clue').setup()
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
-- require('mini.indentscope').setup()
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
---=== Options ===---
---=== Keymaps ===---
