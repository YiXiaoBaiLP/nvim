--[=[
-- 配置备份文件路径
--]=]

local M = {};

-- 获取系统名称
local osName = vim.loop.os_uname().sysname;
local fn = vim.fn;
-- nvim的配置路径
local vimPath = fn.stdpath("config");
---------------------------------------------------------------------------------------

-- 判断系统类型
local pathSep = "";
local home = "";
if tostring(osName) == "Windows_NT" then
    pathSep = "\\";
    home = os.getenv("USERPROFILE");
else
    pathSep = "/";
    home = os.getenv("HOME");
end

-- nvim-data的文件夹
local dataDir = string.format("%s/site/", fn.stdpath("data"));
-- 缓存文件夹
local cacheDir = home .. pathSep .. ".cache" .. pathSep .. "nvim" .. pathSep;
-- 插件模块文件夹
local modulesDir = vimPath .. pathSep .. "modules";

local dirs = {
    vimPath = vimPath;
    cacheDir = cacheDir;
    modulesDir = modulesDir;
    home = home;
    dataDir = dataDir;
};

-- 创建缓存文件夹
local createDir = {
    backup = cacheDir .. "backup";
    session = cacheDir .. "session";
    swap = cacheDir .. "swap";
    tags = cacheDir .. "tags";
    undo = cacheDir .. "undo";
};

if fn.isdirectory(cacheDir) == 0 then
    os.execute("mkdir -p " .. cacheDir);
    for _,v in pairs(createDir) do
        if fn.isdirectory(v) == 0 then
        os.execute("mkdir -p " .. v);
        end
    end
end

-- 设置缓存以及备份相关目录
function M.dirs()
    return dirs;
end

---------------------------------------------------------------------------------------
return M;
