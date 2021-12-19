-- 核心配置

local M = {};
require('core.options');
require('core.pack');
require('core.cacheDir');
require('core.mapping');

local leader_map = function()
  vim.g.mapleader = " ";
  --vim.api.nvim_set_keymap({"n", " ", "", {noremap = true}});
  --vim.api.nvim_set_keymap({"x", " ", "", {noremap = true}});
end

function M.get()
  leader_map();
end

-------------------------------------------------------------------------------------------------
return M.get();
