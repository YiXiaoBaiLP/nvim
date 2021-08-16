-- 加载插件管理器
require('plugins');

local cmd = vim.cmd;
local g = vim.g;

-- setup space as leader key
g.mapleader = ',';
-- disable auto save
g.auto_save = 0;
-- enable terminal transparent
cmd 'hi Normal guibg=NONE ctermbg=NONE'

g.indentLine_enabled = 1
