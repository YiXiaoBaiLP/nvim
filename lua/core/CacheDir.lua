--[=[
-- 配置备份文件路径
--]=]

local M = {};

-- 获取系统名称
local osName = vim.loop.os_uname().sysname;
-- nvim的配置路径
local vimPath = vim.fn.stdpath('config');
local fn = vim.fn;
---------------------------------------------------------------------------------------

local isMac = osName == 'Darwin';
local isLinux = osName == 'Linux';
local isWindows = osName == 'Windows_NT';
local pathSep = isWindows and '\\' or '/';
local home = isWindows and os.getenv('USERPROFILE') or os.getenv("HOME");
local dataDir = string.format('%s/site/', fn.stdpath('data'));
local cacheDir = home .. pathSep .. '.cache' .. pathSep .. 'nvim' .. pathSep;
local modulesDir = vimPath .. pathSep .. 'modules';


-- 设置缓存以及备份相关目录
function M.dirs()
	local dirs = {
		vimPath = vimPath;
		cacheDir = cacheDir;
		modulesDir = modulesDir;
		home = home;
		dataDir = dataDir;
	};
	return dirs;
end

-- 创建缓存文件夹
function M.createDir()
	local createDir = {
		backup = cacheDir .. 'backup';
		session = cacheDir .. 'session';
		swap = cacheDir .. 'swap';
		tags = cacheDir .. 'tags';
		undo = cacheDir .. 'undo';
	};

	if fn.isdirectory(cacheDir) == 0 then
		os.execute("mkdir -p " .. cacheDir);
		for _,v in pairs(createDir) do
		    if fn.isdirectory(v) == 0 then
			os.execute("mkdir -p " .. v);
		    end
		end
	end
end

return M;
