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
	-- 允许可视列块的虚拟编辑
	go.virtualedit = "block";
	-- 当backup 与 writebackup 同时为 false时，没有备份文件
	-- 关闭文件备份
	go.backup = false;
	-- 覆盖文件前建立备份，文件写入成功后，除非 backup 打开，否则删除该备份
	go.writebackup = false;
	-- 关闭缓冲区使用交换文件（关闭后不要在大文件，无法恢复）
	go.swapfile = false;
	-- 使用系统剪贴版
    go.clipboard = "unnamedplus";
	-- 修复索引线
	o.colorcolumn = "99999";
	-- so that `` is visible in markdown files
	o.conceallevel = 0;
	-- 设置历史操作记录为2000条
	o.history = 2000;
	-- 给出换行符的格式（<EOL>)
	o.fileformats = "unix,dos,mac";
	-- 显示行号
	o.number = true;
	-- 相对的显示行号
	o.relativenumber = true;

end

return M;
