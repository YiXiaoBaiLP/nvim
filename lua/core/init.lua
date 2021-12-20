-- 核心配置

local M = {};
require('core.options');
require('core.cacheDir');
require('core.mapping');
local pack = require('core.pack');

local leader_map = function()
  vim.g.mapleader = " ";
  --vim.api.nvim_set_keymap({"n", " ", "", {noremap = true}});
  --vim.api.nvim_set_keymap({"x", " ", "", {noremap = true}});
end

function M.get()
  leader_map();
  pack.ensurePlugins();
  -- 调用包管理器
  pack.loadCompile();
end

-------------------------------------------------------------------------------------------------
return M.get();
