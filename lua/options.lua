--[[
   NVIM 基础的选择项配置
--]]
local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo


-- 不启用vi的键盘模式,关闭兼容模式(必须设置在开头)
--o.compatible = true
-- 设置历史操作记录为2000条
o.history = 2000
-- 语法高亮支持
--o.syntax = true

o.fileformats = "unix,mac,dos"
o.number = true
o.cmdheight = 2
-- 关闭八进制
o.nrformats = "bin,hex"
-- 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
o.list = true
--o.listchars = "tab:\|\ ,trail:▫"
o.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"

local bind = require "bind"
local options = setmetatable({}, {__index = {global_local = {}, window_local = {}}})

function options:local_options()
  self.global_local = {
    termguicolors = true,
    mouse = "nv",
    errorbells = true,
    visualbell = true,
    hidden = true,
    fileformats = "unix, mac, dos",
    magic = true,
    virtualedit = "block",
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
    breakat = [[\ \	;:,!?]],
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