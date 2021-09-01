--[[
   NVIM 基础的选择项配置
--]]

local _M = {}

function _M.get()
  
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
    -- 当backup 与 writebackup 同时为 false时，没有备份文件
    -- 关闭文件备份
    backup = false,
    -- 覆盖文件前建立备份，文件写入成功后，除非 backup 打开，否则删除该备份
    writebackup = false,
    -- 关闭缓冲区使用交换文件（关闭后不要在大文件，无法恢复）
    swapfile = false,
    -- 使用系统剪贴版
    clipboard = "unnamedplus",
    -- 使neovim命令行中有更多显示消息的空间
    cmdheight = 2,
    -- 修复索引线
    colorcolumn = "99999",
    -- 用于插入模式的补全操作
    completeopt = { "menuone", "noselect" },
    -- so that `` is visible in markdown files
    conceallevel = 0,
    -- 设置历史操作记录为2000条
    history = 2000,
    -- 给出换行符的格式（<EOL>)
    fileformats = "unix,dos,mac",
    -- 显示行号
    number = true,
    -- 关闭八进制
    nrformats = "bin,hex",

    magic = true,
    -- 设置Vim的内部字符编码，作用于缓冲区、寄存器、表达式所用的字符串、viminfo保存的各种文本等
    encoding = "utf-8",
    -- 记住前一次打开文件的状态
    viewoptions = "folds,cursor,curdir,slash,unix",
    -- 恢复前一次窗口状态
    sessionoptions = "curdir,help,tabpages,winsize",
    -- 置位时对文件名称喝目录的补全，忽略大小写
    wildignorecase = true,
    -- 文件模式的列表，忽略这些文件
    wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
    -- 显示历史记录为：2000
    history = 2000,
    shada = "!, '300,<50,@100,s10,h'",
    -- 跳过此目录的文件备份
    backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
    -- 打开时，行首的<Tab> 根据 shiftwidth 选项插入空白
    smarttab = true,
    -- 缩进取整到 shiftwidth的倍数，用于 > 和 < 命令
    shiftround = true,
    -- 打开映射的超时选项
    timeout = true,
    -- 打开键码的超时选项
    ttimeout = true,
    -- 
    timeoutlen = 500,
    ttimeoutlen = 10,
    updatetime = 100,
    --readrawtime = 1500,
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
    backspace = "indent,eol,start",
    diffopt = "filler,iwhite,internal,algorithm:patience",
    completeopt = "menu,menuone,noselect",
    jumpoptions = "stack",
    showmode = false,
    shortmess = "aoOTIcF",
    scrolloff = 5,
    sidescrolloff = 5,
    foldlevelstart = 99,
    ruler = false,
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
    -- 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
    list = true,
    listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
    pumblend = 10,
    winblend = 10,
    -- spell = true,
    spelllang = "en_us,cjk"
  }
  
  for k, v in pairs(default_options) do
    opt[k] = v
  end
end

_M.load_commands = function()
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

return setmetatable({}, {__index = function(_, ...) return _M.get(...) end})




-- 以上参考配置
--https://github.com/LunarVim/LunarVim/blob/rolling/lua/settings.lua
--[[
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
--]]