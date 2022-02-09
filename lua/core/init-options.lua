local M = {};


--    lua            command      global_value       local_value ~
--vim.o           :set                set                set
--vim.bo/vim.wo   :setlocal            -                 set
--vim.go          :setglobal          set                 -
-- vim.opt：返回一个options对象

local o, bo, go, opt = vim.o, vim.bo, vim.go, vim.opt;
local cmd = vim.cmd;

function M.LoadOptions()
	-- 使vim支持真彩（highlight-guifg 和 highlight-guibg)
	go.termguicolors = true;
	-- 允许使用鼠标，a：所有模式中允许
	go.mouse = "a";
	-- 关闭错误信息响铃
	go.errorbells = false;
	-- 使用可视响亮代替鸣叫
	go.visualbell = true;
	-- 提示缓冲区已经修改，但文件尚未保存
	go.hidden = true;
	-- 显示行号
	o.number = true;

end

return M;
