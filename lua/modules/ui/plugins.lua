local ui = {};
local conf = require('modules.ui.config');

-- 该插件为每个图标提供相同的图标和颜色
ui["kyazdani42/nvim-web-devicons"] = {
    config = conf.icons_conf
};

-- 吸血鬼主题
ui["Mofiqul/dracula.nvim"] = {
    config = conf.dracula_conf
}

-- nvim的状态栏
ui["nvim-lualine/lualine.nvim"] = {
    opt = true,
    after = "lualine-lsp-progress",
    config = conf.lualine

};
-- 简单的状态栏组件，显示您在其中工作的范围
ui["SmiteshP/nvim-gps"] = {
	opt = true,
	after = "nvim-treesitter",
	config = conf.nvimGps,
};
-- 将lsp的进度添加到nvim的状态栏上
ui["arkav/lualine-lsp-progress"] = {
    opt = true,
    after = "nvim-gps"
};
-- 启动界面
ui["goolord/alpha-nvim"] = {
    opt = true,
    event = "BufWinEnter",
    config = conf.alphaConf

}
-- lua编写的文件管理器
ui["kyazdani42/nvim-tree.lua"] = {
    opt = true,
    cmd = {"NvimTreeToggle"},
    config = conf.nvimTree
};
-- Git装饰插件
ui["lewis6991/gitsigns.nvim"] = {
    opt = true,
    event = {"BufRead", "BufNewFile"},
    config = conf.gitsigns,
    requires = {
        "nvim-lua/plenary.nvim",
        opt = true
    }
};
-- 缩进
ui["lukas-reineke/indent-blankline.nvim"] = {
    opt = true,
    event = "BufRead",
    config = conf.indentBlankline
};
-- 缓冲线插件
ui["akinsho/bufferline.nvim"] = {
    opt = true,
    tag = "*",
    event = "BufRead",
    config = conf.nvimBufferline
};
-- 显示一个滚动条
ui["petertriho/nvim-scrollbar"] = {
	opt = true,
	event = "BufRead",
	config = function()
		require("scrollbar").setup()
	end,
};
-- 可视化撤销命令
ui["mbbill/undotree"] = {
	opt = true,
	cmd = "UndotreeToggle",
}
return ui;
