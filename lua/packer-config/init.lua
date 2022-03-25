local execute = vim.api.nvim_command;
local fn = vim.fn;
local global = require("core.global");
local vim_path = global.vim_path;
local packer_compiled = vim_path .. "plugin/" .. "packer_compiled.lua";

-- nil because packer is opt
local packer = nil;

local function init()
    packer = require("packer");
    packer.init({
        max_jobs = 50,
        disable_commands = true,
        display = {
            open_fn = require("packer.util").float,
        },
        git = { clone_timeout = 120 }
    })
    packer.reset();
    local use = packer.use;

    -- theme
    use({});
end
