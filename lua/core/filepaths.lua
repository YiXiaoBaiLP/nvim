--[=[
-- 配置备份文件路径
--]=]

local M = {};

-- 获取系统名称
local sysname = vim.loop.os_uname().sysname;
local fn = vim.fn;
-- nvim的配置路径
local configurePaths = fn.stdpath("config");
-- nvim-data的文件夹
local dataDir = string.format("%s/site/", fn.stdpath("data"));
---------------------------------------------------------------------------------------

-- 判断系统类型
local pathSep = "/";
local home;
local mkdirComm = "mkdir -p ";
if tostring(sysname) == "Windows_NT" then
    pathSep = "\\";
    mkdirComm = "mkdir ";
    home = os.getenv("USERPROFILE");
else
    home = os.getenv("HOME");
end

-- 缓存文件夹
local cacheDir = home .. pathSep .. ".cache" .. pathSep .. "nvim" .. pathSep;
-- 插件模块文件夹
local modulesDir = configurePaths .. pathSep .. "modules";
-- 创建缓存文件夹
local createDir = {
    backup = cacheDir .. "backup";
    session = cacheDir .. "session";
    swap = cacheDir .. "swap";
    tags = cacheDir .. "tags";
    undo = cacheDir .. "undo";
};

-- 设置缓存以及备份相关目录
M = {
    vimPath = configurePaths;
    cacheDir = cacheDir;
    modulesDir = modulesDir;
    home = home;
    dataDir = dataDir;
    createDir = function ()
        if fn.isdirectory(cacheDir) == 0 then
            os.execute(mkdirComm .. cacheDir);
        end
        for _,v in pairs(createDir) do
            if fn.isdirectory(v) == 0 then
                os.execute(mkdirComm .. v);
            end
        end
    end
};
---------------------------------------------------------------------------------------
return M;