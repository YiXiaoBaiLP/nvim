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


-- nvim 配置
local g = vim.g;
local cmd = vim.cmd;
local o, wo, bo = vim.o, vim.wo, vim.bo;
local utils = require 'plugins_config.utils';
local opt = utils.opt;
local autocmd = utils.autocmd;
local map = utils.map;

-- Leader/local leader
g.mapleader = [[ ]]
g.maplocalleader = [[,]]

-- Skip some remote provider loading
g.loaded_python_provider = 0;


-- Disable some built-in plugins we don't want
local disabled_built_ins = {
	'gzip',
	'man',
	'matchit',
	'matchparen',
	'shada_plugin',
	'tarPlugin',
	'tar',
	'zipPlugin',
	'zip',
	'netrwPlugin',
};

for i = 1, 10 do
	g['loaded_' .. disabled_built_ins[i]] = 1;
end
