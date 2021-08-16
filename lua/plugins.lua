local packer = nil;
local packer_compiled = vim.fn.stdpatch("data") .. "";

local function init()
	local install_Path = vim.fn.stdpath("data") .. "";
return require('packer').startup(function()
	-- package manager
	use 'wbthomason/packer.nvim'
	-- lua functions
	use 'nvim-lua/plenary.nvim'
end)
