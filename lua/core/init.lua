-- 加载nvim的基本配置
local options = require("core.options");
-- 导入全局属性
local global = require("core.global")
global:load_variables();
-- 加载包管理工具
local packer = require("core.pack");
-- 加载按键映射
local keymap = require("core.mapping");
-- 加载插件的快捷键配置
--require("keymap.PluginsKeyMapConfig");

-- 初始化包管理工具
packer.ensure_plugins();
packer.load_compile();

-- 加载主题
vim.cmd[[colorscheme dracula]]
