--[=[
  ███╗   ███╗██╗   ██╗    ███╗   ██╗██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
  ████╗ ████║╚██╗ ██╔╝    ████╗  ██║██║   ██║██║████╗ ████║██╔══██╗██╔════╝
  ██╔████╔██║ ╚████╔╝     ██╔██╗ ██║██║   ██║██║██╔████╔██║██████╔╝██║
  ██║╚██╔╝██║  ╚██╔╝      ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
  ██║ ╚═╝ ██║   ██║       ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
  ╚═╝     ╚═╝   ╚═╝       ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
--]=]

-- 设置nvim
require("core.Options");
-- nvim路径相关
local cacheDir = require("core.CacheDir");
-- Pack包管理器
local pack = require("core.Pack");
-- nvim按键设置
require("core.Mapping");
-- nvim 事件
local event = require("core.Event");

-- vimscript中的全局编辑器变量
local g = vim.g;
-- 一次执行多行vimscript命令
local cmd = vim.cmd;
--vim.loop 是暴露LibUV接口模块
local loop = vim.loop;
-- vim.o.{option}：全局选项
-- vim.bo.{option}：buffer-local选项
-- vim.wo.{option}：window-local选项
local o, wo, bo = vim.o, vim.wo, vim.bo;

-- 获取home路径
local home_dir = loop.os_homedir();

-- 创建备份以及缓存路径
cacheDir.createDir();

pack.ensurePlugins();
pack.loadCompile();

event.loadAutoCmds();

cmd [[colorscheme catppuccin]]
