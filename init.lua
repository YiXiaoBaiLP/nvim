--[[
	整合所有的配置文件,不单独配置任何东西
--]]

local options = require("options")
-- 加载基础配置信息
options.load_options()


-- 获取home路径
local home_dir = vim.loop.os_homedir()


-- nvim 配置
local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo

-- 加载插件管理器
-- Commands
cmd [[command! WhatHighlight :call util#syntax_stack()]]
cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

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


local global = require 'cache-dir'

-- Create cache dir and subs dir
--local createCacheDir = function()
--    -- 数据存储目录
--    local data_dir = {
--        global.cache_dir .. 'backup',
--        global.cache_dir .. 'session',
--        global.cache_dir .. 'swap',
--        global.cache_dir .. 'tags',
--        global.cache_dir .. 'undo'
--    }
--
--    -- There only check once that If cache_dir exists
--    -- Then I don't want to check subs dir exists
--    if vim.fn.isdirectory(global.cache_dir) == 0 then
--        os.execute("mkdir -p " .. global.cache_dir)
--        for _,v in pairs(data_dir) do
--            if vim.fn.isdirectory(v) == 0 then
--                os.execute("mkdir -p " .. v)
--            end
--        end
--    end
--end
