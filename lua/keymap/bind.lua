local rhsOptions = {};

function rhsOptions:new()
    local instance = {
        cmd = '',
        options = {
            -- 映射
            noremap = false,
            -- 命令不回显
            silent = false,
            -- 表达式
            expr = false,
            -- 等待
            nowait = false,
        }
    };
    setmetatable(instance, self)
    self.__index = self;
    return instance;
end

function rhsOptions:mapCMD(cmdString)
    self.cmd = cmdString;
    return self;
end

function rhsOptions:mapCR(cmdString)
    self.cmd = (":%s<CR>"):format(cmdString);
    return self;
end

function rhsOptions:mapArgs(cmdString)
    self.cmd = (":%s<Space>"):format(cmdString);
    return self;
end

function rhsOptions:mapCU(cmdString)
    self.cmd = (":<C-u>%s<CR>"):format(cmdString);
    return self;
end

function rhsOptions:withSilent()
    self.options.silent = true;
    return self;
end

function rhsOptions:withNoremap()
    self.options.noremap = true;
    return self;
end

function rhsOptions:withExpr()
    self.options.expr = true;
    return self;
end

function rhsOptions:withNowait()
    self.options.nowait = true;
    return self;
end

-- 自定义命令(function)
function rhsOptions:customComm(cmdString)
    if(cmdString == nil or type(cmdString) ~= "function") then
        return;
    end
        self.options["callback"] = cmdString;
    return self;
end

local pbind = {};

function pbind.mapCR(cmdString)
    local ro = rhsOptions:new();
    return ro:mapCR(cmdString);
end

function pbind.mapCMD(cmdString)
    local ro = rhsOptions:new();
    return ro:mapCMD(cmdString);
end

function pbind.mapCU(cmdString)
    local ro = rhsOptions:new();
    return ro:mapCU(cmdString);
end

function pbind.mapArgs(cmdString)
    local ro = rhsOptions:new();
    return ro:mapArgs(cmdString);
end

function pbind.nvimLoadMapping(mapping)
    for key, value in pairs(mapping) do
        local mode, keymap = key:match("([^|]*)|?(.*)");
        if type(value) == 'table' then
            local rhs = value.cmd;
            local options = value.options;
            vim.api.nvim_set_keymap(mode, keymap, rhs, options);
        end
    end
end

return pbind;
