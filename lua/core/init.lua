-- 核心配置

local M = {};
require('core.Options');
local cacheDir = require('core.CacheDir');
require('core.Mapping');
--require('core.Event');


-- 创建缓存路径
cacheDir.createDir();


local leader_map = function()
  vim.g.mapleader = " ";
  --vim.api.nvim_set_keymap({"n", " ", "", {noremap = true}});
  --vim.api.nvim_set_keymap({"x", " ", "", {noremap = true}});
end

function M.get()
    local pack = require('core.pack');
    leader_map();
    pack.ensurePlugins();
    -- 调用包管理器
    pack.loadCompile();
end

-------------------------------------------------------------------------------------------------
return M.get();
