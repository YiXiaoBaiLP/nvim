--[[
   基础选择项配置
--]]

local M = {};

-- 调用临时文件保存目录
local cache = require("core.CacheDir");
-- 获取缓存相关路径
local cacheDir = cache.dirs().cacheDir;

local defautOptions = {
  -- 使vim支持真彩（highlight-guifg 和 highlight-guibg)
  termguicolors = true,
  -- 允许使用鼠标，a：所有模式中允许
  mouse = "a",
  -- 关闭错误信息响铃
  errorbells = false,
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
  -- 配置备份文件存放路径
  directory = cacheDir .. "swag/",
  undodir = cacheDir .. "undo/",
  backupdir = cacheDir .. "backup/",
  viewdir = cacheDir .. "view/",
  spellfile = cacheDir .. "spell/en.utf-8.add",
  -- 使用系统剪贴版
  clipboard = "unnamedplus",
  -- 修复索引线
  colorcolumn = "99999",
  -- so that `` is visible in markdown files
  conceallevel = 0,
  -- 设置历史操作记录为2000条
  history = 2000,
  -- 给出换行符的格式（<EOL>)
  fileformats = "unix,dos,mac",
  -- 显示行号
  number = true,
  -- 相对的显示行号
  relativenumber = true,
  -- 关闭八进制
  nrformats = "bin,hex",
  magic = true,
  -- 设置Vim的内部字符编码，作用于缓冲区、寄存器、表达式所用的字符串、viminfo保存的各种文本等
  encoding = "UTF-8",
  -- 记住前一次打开文件的状态
  viewoptions = "folds,cursor,curdir,slash,unix",
  -- 恢复前一次窗口状态
  sessionoptions = "curdir,help,tabpages,winsize",
  -- 置位时对文件名称喝目录的补全，忽略大小写
  wildignorecase = true,
  -- 文件模式的列表，忽略这些文件
  wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
  shada = "!,'1000,<300,@120,s10,h",
  -- 跳过此目录的文件备份
  backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
  -- 缩进取整到 shiftwidth的倍数，用于 > 和 < 命令
  shiftround = true,
  -- 打开映射的超时选项
  timeout = true,
  -- 打开键码的超时选项
  ttimeout = true,
  -- 毫秒计的等待键码或者映射的键序列完成的时间
  timeoutlen = 500,
  ttimeoutlen = 10,
  -- 间隔100毫秒没有输入，则将内容写入磁盘
  updatetime = 100,
  --readrawtime = 1500,
  -- 搜索时忽略大小写
  ignorecase = true,
  -- 查找时，小写字母也可以匹配大写字母
  smartcase = true,
  -- 插入模式总的补全
  infercase = true,
  -- 查找时高亮匹配的字符
  incsearch = true,
  -- 打开回绕查询
  wrapscan = true,
  -- 设置插入模式补全的匹配
  complete = ".,w,b,k",
  inccommand = "nosplit",
  -- 识别 :grep命令的输出格式
  grepformat = "%f:%l:%c:%m",
  grepprg = "rg --hidden --vimgrep --smart-case --",
  -- 可以指定的字符中换行
  breakat = [[\ \ ;:,!?]],
  -- 页面移动时不将光标移动到第一个非空字符上，而是保持在本列中
  startofline = false,
  -- 当光标到最右边或者最左边，按以下按键光标会移动到上一行或下一行
  whichwrap = "h,l,<,>,[,],~",
  -- 窗口分割时，将新的窗口放到当前窗口的下方
  splitbelow = true,
  -- 窗口分割时，将新的窗口放到当前窗口的右方
  splitright = true,
  -- 控制缓冲区的切换行为
  switchbuf = "useopen",
  backspace = "indent,eol,start",
  -- 比较模式的选项
  diffopt = "filler,iwhite,internal,algorithm:patience",
  -- 用于插入模式的补全操作
  completeopt = "menu,menuone,noselect",
  jumpoptions = "stack",
  -- 在插入、替换和可视模式里，在最后一行提供消息
  showmode = false,
  -- 底部状态信息显示的内容选项
  shortmess = "aoOTIcF",
  -- 光标上下最少保留的屏幕行
  scrolloff = 5,
  -- 光标两侧最少保留的屏幕行
  sidescrolloff = 5,
  -- 文件内容是否有折叠（99:没有折叠）
  foldlevelstart = 99,
  -- 标尺，显示光标位置的行号和列号
  ruler = true,
  -- 永远显示标签页与标签行
  showtabline = 2,
  -- 窗口的宽度
  winwidth = 30,
  -- 窗口的最小宽度
  winminwidth = 12,
  -- 插入模式补全弹出菜单显示项目的最大数目
  pumheight = 17,
  -- 使用 :help 命令打开窗口的宽度
  helpheight = 17,
  -- 预览窗口的高度
  previewheight = 17,
  -- 屏幕最后一行显示命令（如果终端变得很慢，关闭此选项）
  showcmd = true,
  -- 命令行使用的屏幕行数
  cmdheight = 2,
  -- 打开命令窗口的大小 普通界面 q: 打开 或者命令行 :<C-F> 打开 
  cmdwinheight = 12,
  -- 关闭：分割窗口会减少当前窗口的尺寸，并保持其他窗口不变
  -- 如果关闭窗口，额外的空间分配给紧邻的窗口
  equalalways = false,
  -- 最后一个什么时候有状态行（2:总是拥有）
  laststatus = 2,
  display = "lastline",
  -- 回绕行放置在开头的字符串
  showbreak = "↳  ",
  -- 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
  list = true,
  listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
  -- 打开时，行首的<Tab> 根据 shiftwidth 选项插入空白
  smarttab = true,
  -- 设置 TAB 的长度
  tabstop = 4,
  -- 编辑时，插入<Tab>或者使用<BS>时，把<TAB>算作空格的数目
  softtabstop = 4,
  -- 缩进的长度
  shiftwidth = 4,
  -- 将TAB转换成空格
  expandtab = true,
  -- 使用'<' 或 ’'>' 缩进时将<Tab>替换成空格 
  autoindent = true,
  pumblend = 10,
  winblend = 10,
  -- spell = true,
  -- 对指定的语言进行拼写检查
  spelllang = "en_us,cjk"
};

-- 关闭不需要的插件
local disableDistributionPlugins = {
    loaded_gzip = 1,
    loaded_tar = 1,
    loaded_tarPlugin = 1,
    loaded_zip = 1,
    loaded_zipPlugin = 1,
    loaded_getscript = 1,
    loaded_getscriptPlugin = 1,
    loaded_vimball = 1,
    loaded_vimballPlugin = 1,
    loaded_matchit = 1,
    loaded_matchparen = 1,
    loaded_2html_plugin = 1,
    loaded_logiPat = 1,
    loaded_rrhelper = 1,
    loaded_netrw = 1,
    loaded_netrwPlugin = 1,
    loaded_netrwSettings = 1,
    loaded_netrwFileHandlers = 1
};

--
-- 循环
-- funName 函数名称
-- param 参数名称
function forEach(funName, param)
  for k, v in pairs(funName) do
    param[k] = v
  end
end

function M.get()
 forEach(defautOptions, vim.o);
 forEach(disableDistributionPlugins, vim.g);
end

-----------------------------------------------------------
return M.get()
