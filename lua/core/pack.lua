local fn, uv, api = vim.fn, vim.loop, vim.api;
local filepaths = require("core.filepaths");
local data_dir = filepaths.dataDir;
local vim_path = filepaths.vimPath;
-- 模块配置文件地址
local modules_dir = vim_path .. "/lua/modules";
local packer_compiled = data_dir .. "lua/_compiled.lua";
local bak_compiled = data_dir .. "lua/bak_compiled.lua";
local packer = nil;

local M = {};
M.__index = M;

--[[
-- 加载插件配置
--]]
function M:load_plugins()
	self.repos = {};
	local get_plugins_list = function()
		local list = {};
		-- 取得模块文件中所有plugins.lua配置文件,路径拼接
		local tmp = vim.split(fn.globpath(modules_dir, "*/plugins.lua"), "\n");
		for _, f in ipairs(tmp) do
			list[#list + 1] = f:sub(#modules_dir - 6, -1);
		end
		return list
	end
	-- 所有的plugins文件路径
	local plugins_file = get_plugins_list();
	for _, m in ipairs(plugins_file) do
		-- 获取plugins的相对路径
        -- 例如：require(modules/ui/plugins)
		local repos = require(m:sub(0, #m - 4));
		for repo, conf in pairs(repos) do
			-- 合并两个表
            -- key：repo
            -- value:conf
            -- 将所有的plugins.lua文件的内容整合一个
			self.repos[#self.repos + 1] = vim.tbl_extend("force", { repo }, conf);
		end
	end
end

--[[
-- 加载包管理器（packer.nvim）
--]]
function M:load_packer()
	-- 判断packer命令是否存在
	if not packer then
		api.nvim_command("packadd packer.nvim");
		packer = require("packer");
	end
	-- packer初始化
	packer.init({
		-- 编译后的文件路径
		compile_path = packer_compiled,
		git = {
			-- git clone depth
            depth = 1,
			-- git clone 超时时间（秒）
			clone_timeout = 60,
			default_url_format = "https://ghproxy.com/https://github.com/%s"
		},
		-- 不禁用创建
		disable_commands = true,
		-- 同时处理的数量
		max_jobs = 20,
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "none" })
			end,
		},
	})
	-- 重置插件
	packer.reset();
	local use = packer.use;
	-- 加载本地插件配置
	self:load_plugins();
	use({ "wbthomason/packer.nvim", opt = true })
	for _, repo in ipairs(self.repos) do
		use(repo);
	end
end

--[[
-- 初始化Packer包管理工具
--]]
function M:init_ensure_plugins()
	-- 设置Packer目录
	local packer_dir = data_dir .. "pack/packer/opt/packer.nvim";
	-- 判断Packer目录是否存在
	local state = uv.fs_stat(packer_dir);
	if not state then
		local cmd = "!git clone git@github.com:wbthomason/packer.nvim.git " .. packer_dir;
		api.nvim_command(cmd);
		-- 编译路径
		uv.fs_mkdir(data_dir .. "lua", 511, function()
			assert(nil, "Failed to make packer compile dir. Please restart Nvim and we'll try it again!")
		end)
		-- 加载Packer包管理器
		self:load_packer();
		-- packer包方法: 安装插件
		packer.install();
	end
end

local plugins = setmetatable({}, {
	__index = function(_, key)
		if not packer then
			M:load_packer();
		end
		return packer[key];
	end,
})

--[[
-- 初始化Packer包管理工具	
--]]
function plugins.ensure_plugins()
	M:init_ensure_plugins();
end

function plugins.back_compile()
	if vim.fn.filereadable(packer_compiled) == 1 then
		os.rename(packer_compiled, bak_compiled)
	end
	plugins.compile();
	vim.notify("Packer Compile Success!", vim.log.levels.INFO, { title = "Success!" })
end

function plugins.auto_compile()
	local file = vim.fn.expand("%:p")
	if file:match(modules_dir) then
		plugins.clean()
		plugins.back_compile()
	end
end

function plugins.load_compile()
	if vim.fn.filereadable(packer_compiled) == 1 then
		require("_compiled")
	else
		plugins.back_compile()
	end

	local cmds = { "Compile", "Install", "Update", "Sync", "Clean", "Status" }
	for _, cmd in ipairs(cmds) do
		api.nvim_create_user_command("Packer" .. cmd, function()
			require("core.pack")[cmd == "Compile" and "back_compile" or string.lower(cmd)]()
		end, { force = true })
	end

	api.nvim_create_autocmd("User", {
		pattern = "PackerComplete",
		callback = function()
			require("core.pack").back_compile()
		end,
	})
end

return plugins;