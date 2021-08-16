-- 按键绑定
local bind = {};

-- bind options
function bind.bind_options(options)
  for k, v in pairs(options) do
    if v == true or v == false then
      vim.api.nvim_command("set " .. k);
    else
      vim.api.nvim_command("set " .. k .. "=" .. v);
    end
  end
end

return bind;
