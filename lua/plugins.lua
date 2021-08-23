local packer = nil

local function init()
	if packer == nil then
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
end

local plugins = setmetatable({}, {
	__index = function(_, key)
		init()
		return packer[key]
	end,
})

return plugins