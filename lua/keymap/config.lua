local fn, cmd = vim.fn, vim.cmd;

local function checkBackSpace()
    local col = fn.col('.') - 1;
    if col == 0 or fn.getline('.'):sub(col, col):match('%s') then
        return true;
    else
        return false;
    end
end

-- move to prev/next item in completion menuone
-- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if fn.pumvisible() == 1 then
        return t "<C-n>";
    elseif fn.call("vsnip#available", {1}) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)";
    elseif checkBackSpace() then
        return t "<Tab>";
    else
        return fn['compe#complete']();
    end
end

_G.s_tab_complete = function(key)
    if fn.pumvisible() == 1 then
        return t "<C-p>";
    elseif fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)";
    else
        return t "<S-Tab>";
    end
end

_G.enhance_ft_move = function(key)
    if not packer_plugins['vim-eft'].loaded then
        cmd[[packadd vim-eft]];
    end
    local map = {
        f = '<Plug>(eft-f)',
        F = '<Plug>(eft-F)',
        [';'] = '<Plug>(eft-repeat)'
    };
    return t(map[key]);
end

_G.enhance_nice_block = function(key)
    if not packer_plugins['vim-niceblock'].loaded then
        cmd[[packadd vim-niceblock]]
    end
    local map = {
        I = '<Plug>(niceblock-I)',
        ['gI'] = '<Plug>(niceblock-gI)',
        A = '<Plug>(niceblock-A)'
    };
    return t(map[key]);
end
