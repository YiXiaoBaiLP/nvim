--[[
   NVIM 基础的选择项配置
--]]

local M = {}

M.load_options = function()
  local opt = vim.opt

  local default_options = {
    -- 使vim支持真彩（highlight-guifg 和 highlight-guibg)
    termguicolors = true,
    -- 允许使用鼠标，a：所有模式中允许
    mouse = "a",
    -- 开启错误信息响铃
    errorbells = true,
    -- 使用可视响亮代替鸣叫
    visualbell = true,
    -- 提示缓冲区已经修改，但文件尚未保存
    hidden = true,
    -- 允许可视列块的虚拟编辑
    virtualedit = "block",
    -- 关闭文件备份
    backup = false,
    -- 使用系统剪贴版
    clipboard = "unnamedplus",
    -- 使neovim命令行中有更多显示消息的空间
    cmdheight = 2,
    -- 修复索引线
    colorcolumn = "99999",
    completeopt = { "menuone", "noselect" },
    -- so that `` is visible in markdown files
    conceallevel = 0,
    -- 设置历史操作记录为2000条
    history = 2000,
    -- 
    fileformats = "unix,mac,dos"
    -- 显示行号
    number = true
    -- 关闭八进制
    nrformats = "bin,hex"
    -- 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
    list = true
    listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",

    fileformats = "unix, mac, dos",
    magic = true,
   
    encoding = "utf-8",
    viewoptions = "folds, cursor, curdir, slash, unix",
    sessionoptions = "curdir, help, tabpages, winsize",
    clipboard = "unnamedplus",
    wildignorecase = true,
    wildignore = ".git, .hg, .svn, *.pyc, *.o, *.out, *.jpg, *.jpeg, *.png, *.gif, *.zip, **/tmp/**, *.DS_Store, **/node_modules/**, **/bower_modules/**",
    backup = false,
    writebackup = false,
    swapfile = false,
    history = 2000,
    shada = "!, '300,<50,@100,s10,h'",
    backupskip = "/tmp/*, $TMPDIR/*, $TMP/*, $TEMP/*, */shm/*, /private/var/*, .vault.vim",
    smarttab = true,
    shiftround = true,
    timeout = true,
    ttimeout = true,
    timeoutlen = 500,
    ttimeoutlen = 10,
    updatetime = 100,
    readrawtime = 1500,
    ignorecase = true,
    smartcase = true,
    infercase = true,
    incsearch = true,
    wrapscan = true,
    complete = "., w, b, k",
    inccommand = "nosplit",
    grepformat = "%f:%l:%c:%m",
    grepprg = "rg --hidden --vimgrep --smart-case --",
    breakat = [[\ \ ;:,!?]],
    startofline = false,
    whichwrap = "h,l,<,>,[,],~",
    splitbelow = true,
    splitright = true,
    switchbuf = "useopen",
    backspace = "indent, eol, start",
    diffopt = "filler, iwhite, internal, algorithm:patience",
    completeopt = "menu, menuone, noselect",
    jumpoptions = "stack",
    showmode = false,
    shortmess = "aoOTIcF",
    scrolloff = 5,
    sidescrolloff = 5,
    foldlevelstart = 99,
    ruler = false,
    list = true,
    showtabline = 2,
    winwidth = 30,
    winminwidth = 10,
    pumheight = 15,
    helpheight = 12,
    previewheight = 12,
    showcmd = false,
    cmdheight = 2,
    cmdwinheight = 5,
    equalalways = false,
    laststatus = 2,
    display = "lastline",
    showbreak = "↳  ",
    listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
    pumblend = 10,
    winblend = 10,
    -- spell = true,
    spelllang = "en_us,cjk"
  }
  
  for k, v in pairs(default_options) do
    vim.opt[k] = v
  end
end

M.load_commands = function()
  local cmd = vim.cmd
  if lvim.line_wrap_cursor_movement then
    cmd "set whichwrap+=<,>,[,],h,l"
  end

  if lvim.transparent_window then
    cmd "au ColorScheme * hi Normal ctermbg=none guibg=none"
    cmd "au ColorScheme * hi SignColumn ctermbg=none guibg=none"
    cmd "au ColorScheme * hi NormalNC ctermbg=none guibg=none"
    cmd "au ColorScheme * hi MsgArea ctermbg=none guibg=none"
    cmd "au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none"
    cmd "au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none"
    cmd "let &fcs='eob: '"
  end
end

return M


-- 以上参考配置
--https://github.com/LunarVim/LunarVim/blob/rolling/lua/settings.lua

local bind = require "bind"
local options = setmetatable({}, {__index = {global_local = {}, window_local = {}}})

function options:local_options()
  self.global_local = {
   
  }

  self.bw_local = {
    undofile = true,
    synmaxcol = 2500,
    formatoptions = "1jcroql",
    textwidth = 80,
    expandtab = true,
    autoindent = true,
    tabstop = 2,
    shifwtidth = 2,
    softtabstop = -1,
    breakindentopt = "shift:2, min20",
    wrap = false,
    linebreak = true,
    number = true,
    colorcolumn = "80",
    foldenable = true,
    signcolumn = "yes",
    conceallevel = 2,
    concealcursor = "niv"
  }

  if vim.loop.os_uname().sysname == "Darwin" then
    vim.g.clipboard = {
      name = "macOS.clipboard",
      copy = {
        ["+"] = "pbcopy",
        ["+"] = "pbcopy"
      },
      paste = {
        ["+"] = "pbpaste",
        ["+"] = "pbpaste"
      },
      cache_enabled = 0
    }
  end
  for name, value in pairs(self.global_local) do
    vim.o[name] = value
  end
  bind.bind_option(self.bw_local);
end

return options;
