local fn, uv, api = vim.fn, vim.loop, vim.api;
local caches = require("core.filepaths");
local dataDir = caches.dataDir;
local vimPath = caches.vimPath;
-- 模块配置文件地址
local modulesDir = vimPath .. "/lua/modules";
local packerCompiled = dataDir .. "packer_compiled.vim";
local compileToLua = dataDir .. "lua/_compiled.lua";
local packer = nil;

local _M = {};

_M.__index = _M;

--[[
-- 加载包管理器（packer.nvim）
--]]
function _M:loadPacker()
    -- 判断packer命令是否存在
    if not packer then
        api.nvim_command("packadd packer.nvim");
        packer = require("packer");
    end

    -- packer初始化
    packer.init({
        -- 编译后的文件路径
        compile_path = packerCompiled,
        -- 同时处理的数量
        max_jobs = 12,
        git = {
            -- git clone depth
            depth = 1,
            -- git clone 超时时间（秒）
            clone_timeout = 120,
            default_url_format = "https://ghproxy.com/https://github.com/%s"
        },
        -- 不禁用创建
        disable_commands = true,
        display = {
            open_fn = function()
                return require("packer.util").float({border = "single"});
            end
        }
    });
    -- 重置插件
    packer.reset();
    local use = packer.use;
    -- 加载本地插件配置
    self:loadPlugins();
    use {"wbthomason/packer.nvim", opt = true}
    for _, repo in ipairs(self.repos) do
        use(repo);
    end
end

-- 加载插件配置
function _M:loadPlugins()
    self.repos = {};

    local getPluginsList = function()
        local list = {};
        -- 取得模块文件中所有plugins.lua配置文件,路径拼接
        local tmp = vim.split(fn.globpath(modulesDir, "*/plugins.lua"), "\n");
        for _,f in ipairs(tmp) do
            list[#list+1] = f:sub(#modulesDir - 6, - 1);
        end
        return list;
    end
    -- 所有的plugins文件路径
    local pluginsFile = getPluginsList();
    for _,m in ipairs(pluginsFile) do
        -- 获取plugins的相对路径
        -- 例如：require(modules/ui/plugins)
        local repos = require(m:sub(0, #m - 4));
        for repo, conf in pairs(repos) do
            -- 合并两个表
            -- key：repo
            -- value:conf
            -- 将所有的plugins.lua文件的内容整合一个
            self.repos[#self.repos + 1] = vim.tbl_extend("force", {repo}, conf);
        end
    end
end

-- 初始化Packer包管理工具
function _M:initEnsurePlugins()
    -- 设置Packer目录
    local packerDir = dataDir .. "pack/packer/opt/packer.nvim";
    -- 判断Packer目录是否存在
    local state = uv.fs_stat(packerDir);
    if not state then
        local cmd = "!git clone https://github.com/wbthomason/packer.nvim " .. packerDir;
        api.nvim_command(cmd);
        -- 编译路径
        uv.fs_mkdir(dataDir .. "lua", 511, function()
            assert("make compile path dir faield");
        end)
        -- 加载Packer包管理器
        self:loadPacker();
        -- packer包方法: 安装插件
        packer.install();
    end
end

local plugins = setmetatable({}, {
    __index = function(_, key)
        if not packer then
            _M:loadPacker()
        end
        return packer[key];
    end
});
-- 初始化Packer包管理工具
function plugins.ensurePlugins()
    _M:initEnsurePlugins();
end

function plugins.convertCompileFile()
    local lines = {};
    local lnum = 1;
    lines[#lines+1] = "vim.cmd [[packadd packer.nvim]]\n"

    for line in io.lines(packerCompiled) do
        lnum = lnum + 1;
        if lnum > 15 then
            lines[#lines+1] = line .. "\n";
            if line == "END" then
                break;
            end
        end
    end

    table.remove(lines, #lines);

    if fn.isdirectory(dataDir .. "lua") ~= 1 then
        os.execute("mdkir -p ".. dataDir .. "lua");
    end

    if fn.filereadable(compileToLua) == 1 then
        os.remove(compileToLua)
    end

    local file = io.open(compileToLua, "w");
    for _, line in ipairs(lines) do
        file:write(line);
    end
    file:close();
    os.remove(packerCompiled);
end

function plugins.magicCompile()
    plugins.convertCompileFile();
    plugins.compile();
end

function plugins.autoCompile()
    local file = fn.expand("%:p");
    if file:match(modulesDir) then
        plugins.clean();
        plugins.compile();
        plugins.convertCompileFile();
    end
end

function plugins.loadCompile()
    local cmd = vim.cmd;
    if fn.filereadable(compileToLua) == 1 then
        require("_compiled");
    else
        assert("Missing packer compile file Run PackerCompile Or PackerInstall to fix");
    end
    cmd [[command! PackerCompile lua require("core.pack").magicCompile()]]
    cmd [[command! PackerInstall lua require("core.pack").install()]]
    cmd [[command! PackerUpdate lua require("core.pack").update()]]
    cmd [[command! PackerSync lua require("core.pack").sync()]]
    cmd [[command! PackerClean lua require("core.pack").clean()]]
    cmd [[autocmd User PackerCompile lua require("core.pack").magicCompile()]]
    cmd [[command! PackerStatus lua require("core.pack").status()]]
end

return plugins;
