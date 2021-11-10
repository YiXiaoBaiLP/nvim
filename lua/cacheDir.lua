--[[
-- 配置备份文件路径
--]]

local _M = {};
-- 获取系统名称
local osName = vim.loop.os_uname().sysname;
---------------------------------------------------------------------------------------
function _M:get()
    self.isMac = osName == 'Darwin';
    self.isLinux = osName == 'Linux';
    self.isWindows = osName == 'Windows_NT';
    self.vimPath = vim.fn.stdpath('config');
    local pathSep = self.isWindows and '\\' or '/';
    local home = self.isWindows and os.getenv('USERPROFILE') or os.getenv("HOME");
    self.cacheDir = home .. pathSep .. '.cache' .. pathSep .. 'nvim' .. pathSep;
    self.modulesDir = self.vimPath .. pathSep .. 'modules';
    self.home = home;
    self.data_dir = string.format('%s/site/', vim.fn.stdpath('data'));

    return self;
end
---------------------------------------------------------------------------------------

return _M:get();
