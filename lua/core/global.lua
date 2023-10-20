-- 全局配置
local global = {};
local os_name = vim.loop.os_uname().sysname;

function global:load_variables()
    -- mac
    self.is_mac = os_name == "Darwin";
    -- linux
    self.is_linux = os_name == "Linux";
    -- windows
    self.is_windows = os_name == "Windows_NT";
    self.is_wsl = vim.fn.has("wsl") == 1;
    self.vim_path = vim.fn.stdpath("config");
    -- 区分 windows 与 Unix 系统
    local path_sep = self.is_windows and "\\" or "/";
    -- 获取HOME文件夹路径
    local home = self.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME");
    self.cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep;
    self.modules_dir = self.vim_path .. path_sep .. "modules";
    self.home = home;
    self.data_dir = string.format("%s/site/", vim.fn.stdpath("data"));
end

global:load_variables()

return global;
