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
    config = conf.nvimTreesitter
};
editor["nvim-treesitter/nvim-treesitter-textobjects"] = {
	opt = true,
	after = "nvim-treesitter",
}
-- 彩虹括号，依赖nvim-treesitter
editor["p00f/nvim-ts-rainbow"] = {
	opt = true,
	after = "nvim-treesitter",
	event = "BufRead",
}
-- 添加注释
editor["JoosepAlviste/nvim-ts-context-commentstring"] = {
	opt = true,
	after = "nvim-treesitter",
}
-- 区域选择，提示由treesitter提供支持的文档的AST节点
editor["mfussenegger/nvim-ts-hint-textobject"] = {
	opt = true,
	after = "nvim-treesitter",
}
-- 标签的自关闭和重命名
editor["windwp/nvim-ts-autotag"] = {
	opt = true,
	ft = { "html", "xml" },
	config = conf.autotag,
}
-- 增强版的单词选择插件
editor["andymass/vim-matchup"] = {
	opt = true,
	after = "nvim-treesitter",
	config = conf.matchup,
}
return editor;
