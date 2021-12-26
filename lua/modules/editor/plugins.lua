local editor = {};
local conf = require("modules.editor.config");

-- 简单的对齐插件
editor["junegunn/vim-easy-align"] = {
    opt = true,
    cmd = "EasyAlign"
};

-- 光标下单词划线
editor["itchyny/vim-cursorword"] = {
    opt = true,
    event = {"BufReadPre", "BufNewFile"},
    config = conf.vim_cursorword
};
-- 自动注释
editor["terrortylor/nvim-comment"] = {
    opt = false,
    config = conf.nvimComment

};

-- 语言高亮（增强版）
editor["nvim-treesitter/nvim-treesitter"] = {
    opt = true,
    run = ":TSUpdate",
    event = "BufRead",
    config = conf.nvim_treesitter
};

-- 简单的状态行组件
editor["SmiteshP/nvim-gps"] = {
    opt = true,
    after = "nvim-treesitter",
    config = conf.nvim_gps
};


return editor;
