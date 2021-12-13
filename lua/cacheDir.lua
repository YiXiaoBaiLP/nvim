--[[
-- 配置备份文件路径
--]]

local _M = {};
-- 获取系统名称
local osName = vim.loop.os_uname().sysname;
-- nvim的配置路径
local vimPath = vim.fn.stdpath('config');
local fn = vim.fn;
local dirs = {};
---------------------------------------------------------------------------------------

-- 设置缓存以及备份目录
function setCacheDir(dirs)
    dirs.isMac = osName == 'Darwin';
    dirs.isLinux = osName == 'Linux';
    dirs.isWindows = osName == 'Windows_NT';
    dirs.vimPath = vimPath;
    local pathSep = isWindows and '\\' or '/';
    local home = isWindows and os.getenv('USERPROFILE') or os.getenv("HOME");
    dirs.cacheDir = home .. pathSep .. '.cache' .. pathSep .. 'nvim' .. pathSep;
    dirs.modulesDir = vimPath .. pathSep .. 'modules';
    dirs.home = home;
    dirs.data_dir = string.format('%s/site/', vim.fn.stdpath('data'));

    return dirs;
end

local createDir = function ()
    local dataDir = {
        dirs.cacheDir .. 'backup',
        dirs.cacheDir .. 'session',
        dirs.cacheDir .. 'swap',
        dirs.cacheDir .. 'tags',
        dirs.cacheDir .. 'undo'
    }

    if fn.isdirectory(dirs.cacheDir) == 0 then
        os.execute("mkdir -p " .. dirs.cacheDir);
        for _,v in pairs(dataDir) do
            if fn.isdirectory(v) == 0 then
                os.execute("mkdir -p " .. v);
            end
        end
    end
end

function _M.get()
    dirs = setCacheDir(dirs);
    createDir();

    return dirs;
end

---------------------------------------------------------------------------------------

return _M.get();
