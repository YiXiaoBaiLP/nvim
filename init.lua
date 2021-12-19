--[[
  ███╗   ███╗██╗   ██╗    ███╗   ██╗██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
  ████╗ ████║╚██╗ ██╔╝    ████╗  ██║██║   ██║██║████╗ ████║██╔══██╗██╔════╝
  ██╔████╔██║ ╚████╔╝     ██╔██╗ ██║██║   ██║██║██╔████╔██║██████╔╝██║
  ██║╚██╔╝██║  ╚██╔╝      ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
  ██║ ╚═╝ ██║   ██║       ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
  ╚═╝     ╚═╝   ╚═╝       ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
--]]

-- 加载vim的基础配置
require("core")

-- vimscript中的全局编辑器变量
local g = vim.g;
-- 一次执行多行vimscript命令
local cmd = vim.cmd;
--vim.loop 是暴露LibUV接口饿模块
local loop = vim.loop;
-- vim.o.{option}：全局选项
-- vim.bo.{option}：buffer-local选项
-- vim.wo.{option}：window-local选项
local o, wo, bo = vim.o, vim.wo, vim.bo;

-- 获取home路径
local home_dir = loop.os_homedir();
