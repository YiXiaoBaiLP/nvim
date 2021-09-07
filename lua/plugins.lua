local packer = nil
local packerCompiled = vim.fn.stdpath("data") .. "/site/packer_comiled.vim"

local function init()
    local installPath = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
    if vim.fn.empty(vim.fn.glob(installPath)) > 0 then
        vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. installPath)
    end
    
	if packer == nil then
        vim.cmd [[packadd packer.nvim]]
		packer = require 'packer'
		packer.init { disable_commands = true }
	end

	local use = packer.use
	packer.reset()

	-- Packer
	use 'wbthomason/packer.nvim'

	-- 标签页 状态栏
	-- tab栏插件 提供leader + number 切换buffer
	use{
		"akinsho/nvim-bufferline.lua",
		require = {"kyazdani42/nvim-web-devicons"},
		config = [[require("plugin-config.bufferline")]]
	}

	-- 状态栏插件
	use {
		"glepnir/galaxyline.nvim",
		require = {"kyazdani42/nvim-web-devicons"},
		config = [[require("eviline")]]
	}

    -- kai ping
    use {
        "glepnir/dashboard.nvim"
    }
end

local plugins = setmetatable({}, {
	__index = function(_, key)
		init()
		return packer[key]
	end,
})

return plugins
