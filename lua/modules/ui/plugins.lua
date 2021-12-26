local ui = {};
local conf = require('modules.ui.config');

-- 彩色图标
ui["kyazdani42/nvim-web-devicons"] = {
    opt = false
};
-- edge 主题配色方案
ui["sainnhe/edge"] = {
    opt = false,
    config = conf.edge
};
-- 温暖的中色调的黑暗主题
ui["catppuccin/nvim"] = {
    opt = false,
    as = "catppuccin",
    config = conf.catppuccin
};
-- nvim的状态栏
ui["nvim-lualine/lualine.nvim"] = {
    opt = true,
    after = "lualine-lsp-progress",
    config = conf.lualine

};
-- 将lsp的进度添加到nvim的状态栏上
ui["arkav/lualine-lsp-progress"] = {
    opt = true,
    after = "nvim-gps"
};
-- 启动界面
ui["glepnir/dashboard-nvim"] = {
    opt = true,
    event = "BufWinEnter"
};
-- lua编写的文件管理器
ui["kyazdani42/nvim-tree.lua"] = {
    opt = true,
    cmd = {"NvimTreeToggle", "NvimTreeOpen"},
    config = conf.nvim_tree
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
    config = conf.indent_blankline
};
-- 缓冲线插件
ui["akinsho/bufferline.nvim"] = {
    opt = true,
    event = "BufRead",
    config = conf.nvim_bufferline
};
-- 显示一个滚动条
ui["dstein64/nvim-scrollview"] = {
    opt = true,
    event = "BufRead"
};

return ui;
