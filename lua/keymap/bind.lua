---@class map_rhs
---@field cmd string
---@field options table
---@field options.noremap boolean
---@field options.silent boolean
---@field options.expr boolean
---@field options.nowait boolean
---@field options.callback function
---@field options.desc string
---@field buffer boolean|number
local rhsOptions = {};

function rhsOptions:new()
    local instance = {
        cmd = "",
        options = {
            -- 映射
            noremap = false,
            -- 命令不回显
            silent = false,
            -- 表达式
            expr = false,
            -- 等待
            nowait = false,
            -- 回调
            callback = nil,
            -- 描述
			desc = "",
        }
    };
    setmetatable(instance, self)
    self.__index = self;
    return instance;
end

---@param cmdString string
---@return map_rhs
function rhsOptions:mapCMD(cmdString)
    self.cmd = cmdString;
    return self;
end

---@param cmdString string
---@return map_rhs
function rhsOptions:mapCR(cmdString)
    self.cmd = (":%s<CR>"):format(cmdString);
    return self;
end

---@param cmdString string
---@return map_rhs
function rhsOptions:mapArgs(cmdString)
    self.cmd = (":%s<Space>"):format(cmdString);
    return self;
end

---@param cmdString string
---@return map_rhs
function rhsOptions:mapCU(cmdString)
    self.cmd = (":<C-u>%s<CR>"):format(cmdString);
    return self;
end

---@param callback fun():nil
--- Takes a callback that will be called when the key is pressed
---@return map_rhs
function rhsOptions:mapCallback(callback)
	self.cmd = ""
	self.options.callback = callback
	return self
end

---@return map_rhs
function rhsOptions:withSilent()
    self.options.silent = true;
    return self;
end

---@param descriptionString string
---@return map_rhs
function rhsOptions:withDesc(descriptionString)
	self.options.desc = descriptionString
	return self
end

---@return map_rhs
function rhsOptions:withNoremap()
    self.options.noremap = true;
    return self;
end

---@return map_rhs
function rhsOptions:withExpr()
    self.options.expr = true;
    return self;
end

---@return map_rhs
function rhsOptions:withNowait()
    self.options.nowait = true;
    return self;
end

---@param num number
---@return map_rhs
function rhsOptions:withBuffer(num)
	self.buffer = num
	return self
end

-- 自定义命令(function)
function rhsOptions:customComm(cmdString)
    if(cmdString == nil or type(cmdString) ~= "function") then
        return;
    end
        self.options["callback"] = cmdString;
    return self;
end

local bind = {};

---@param cmdString string
---@return map_rhs
function bind.mapCR(cmdString)
    local ro = rhsOptions:new();
    return ro:mapCR(cmdString);
end

---@param cmdString string
---@return map_rhs
function bind.mapCMD(cmdString)
    local ro = rhsOptions:new();
    return ro:mapCMD(cmdString);
end

---@param cmdString string
---@return map_rhs
function bind.mapCU(cmdString)
    local ro = rhsOptions:new();
    return ro:mapCU(cmdString);
end

---@param cmdString string
---@return map_rhs
function bind.mapArgs(cmdString)
    local ro = rhsOptions:new();
    return ro:mapArgs(cmdString);
end

---@param callback fun():nil
---@return map_rhs
function bind.mapCallback(callback)
	local ro = rhsOptions:new()
	return ro:mapCallback(callback)
end

---@param cmdString string
---@return string escaped_string
function bind.escape_termcode(cmdString)
	return vim.api.nvim_replace_termcodes(cmdString, true, true, true)
end

---@param mapping table<string, map_rhs>
function bind.nvimLoadMapping(mapping)
	for key, value in pairs(mapping) do
		local mode, keymap = key:match("([^|]*)|?(.*)")
		if type(value) == "table" then
			local rhs = value.cmd
			local options = value.options
			local buf = value.buffer
			if buf and type(buf) == "number" then
				vim.api.nvim_buf_set_keymap(buf, mode, keymap, rhs, options)
			else
				vim.api.nvim_set_keymap(mode, keymap, rhs, options)
			end
		end
	end
end

return bind;
