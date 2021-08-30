
--[[
	整合所有的配置文件,不单独配置任何东西
--]]

require("options")

-- 加载插件管理器
require("plugins")

-- 获取home路径
local home_dir = vim.loop.os_homedir()


-- nvim 配置
local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo

-- Leader/local leader
g.mapleader = [[ ]]
g.maplocalleader = [[,]]

-- Skip some remote provider loading
g.loaded_python_provider = 0


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
	g['loaded_' .. disabled_built_ins[i]] = 1
end
