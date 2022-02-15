--[=[
  ███╗   ███╗██╗   ██╗    ███╗   ██╗██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
  ████╗ ████║╚██╗ ██╔╝    ████╗  ██║██║   ██║██║████╗ ████║██╔══██╗██╔════╝
  ██╔████╔██║ ╚████╔╝     ██╔██╗ ██║██║   ██║██║██╔████╔██║██████╔╝██║
  ██║╚██╔╝██║  ╚██╔╝      ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
  ██║ ╚═╝ ██║   ██║       ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
  ╚═╝     ╚═╝   ╚═╝       ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
--]=]

-- 设置nvim
local options = require("core.init-options");
-- 创建备份、缓存等文件夹
local caches =require("core.caches");
-- 加载包管理工具
local packer = require("core.pack");
-- 加载按键映射
local keymap = require("core.mapping");

-- 加载nvim的基本配置
options.LoadOptions();
-- 创建文件路径
caches.createDirs();
-- 初始化包管理工具
packer.ensurePlugins();
packer.loadCompile();
