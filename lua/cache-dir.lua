local global = {}
--local home = os.getenv("HOME")
local home = vim.fn.stdpath('data')
local path_sep = global.is_windows and '\\' or '/'
local os_name = vim.loop.os_uname().sysname

function global:local_variables()
    self.is_mac = os_name == 'Darwin'
    self.is_linux = os_name == 'Linux'
    self.is_windows = os_name == 'Windows'
    self.vim_path = vim.fn.stdpath('config')
    self.cache_dir = home .. path_sep .. '.cache' .. path_sep .. 'nvim' .. path_sep
    self.modules_dir = self.vim_path .. path_sep .. 'modules'
    self.path_sep = path_sep
    self.home = home
    self.data_dir = string.format('%s/site/', vim.fn.stdpath('data'))
    -- 判断备份文件路径是否存在
    creaderCacheDir()
end

function creaderCacheDir()
    -- 获取备份文件路径
    local data_dir = {
        global:local_variables().self.cache_dir .. 'backup',
        global:local_variables().self.cache_dir .. 'session',
        global:local_variables().self.cache_dir .. 'swap',
        global:local_variables().self.cache_dir .. 'tags',
        global:local_variables().self.cache_dir .. 'undo'
    }

    -- There only check once that If cache_dir exists
    -- Then I don't want to check subs dir exists
    if vim.fn.isdirectory(local_variables().self.cache_dir) == 0 then
        os.execute("mkdir -p " .. local_variables().self.cache_dir)
        for _,v in pairs(data_dir) do
            if vim.fn.isdirectory(v) == 0 then
                os.execute("mkdir -p " .. v)
            end
        end
    end
end

global:local_variables()

return global
