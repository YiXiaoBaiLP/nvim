local M = {};

--    lua            command      global_value       local_value ~
--vim.o           :set                set                set
--vim.bo/vim.wo   :setlocal            -                 set
--vim.go          :setglobal          set                 -
-- vim.opt：返回一个options对象

--[=[
	|buffer-variable|    b:	  Local to the current buffer.
	|window-variable|    w:	  Local to the current window.
	|tabpage-variable|   t:	  Local to the current tab page.
	|global-variable|    g:	  Global.
	|local-variable|     l:	  Local to a function.
	|script-variable|    s:	  Local to a |:source|'ed Vim script.
	|function-argument|  a:	  Function argument (only inside a function).
	|vim-variable|       v:	  Global, predefined by Vim.
--]=]

o, bo, wo, go, opt, g = vim.o, vim.bo, vim.wo, vim.go, vim.opt, vim.g;
local cmd = vim.cmd;

-- 调用临时文件保存目录
local caches = require("core.caches");
-- 获取缓存相关路径
local cacheDir = caches.dirs().cacheDir;

-- 关闭不需要的插件
local disableDistributionPlugins = {
	"loaded_gzip",
	"loaded_tar",
	"loaded_tarPlugin",
	"loaded_zip",
	"loaded_zipPlugin",
	"loaded_getscript",
	"loaded_getscriptPlugin",
	"loaded_vimball",
	"loaded_vimballPlugin",
	"loaded_matchit",
	"loaded_matchparen",
	"loaded_2html_plugin",
	"loaded_logiPat",
	"loaded_rrhelper",
	"loaded_netrw",
	"loaded_netrwPlugin",
	"loaded_netrwSettings",
	"loaded_netrwFileHandlers",
};

-- 使vim支持真彩（highlight-guifg 和 highlight-guibg)
go.termguicolors = true;
-- 允许使用鼠标，a：所有模式中允许
go.mouse = "a";
-- 关闭错误信息响铃
go.errorbells = false;
-- 使用可视响亮代替鸣叫
go.visualbell = true;
-- 提示缓冲区已经修改，但文件尚未保存
go.hidden = true;
-- 允许可视列块的虚拟编辑
go.virtualedit = "block";
-- 当backup 与 writebackup 同时为 false时，没有备份文件
-- 关闭文件备份
go.backup = true;
-- 覆盖文件前建立备份，文件写入成功后，除非 backup 打开，否则删除该备份
go.writebackup = true;
-- 关闭缓冲区使用交换文件（关闭后不要在大文件，无法恢复）
go.swapfile = true;

-- 配置备份文件存放路径
go.directory = cacheDir .. "swag/";
go.undodir = cacheDir .. "undo/";
go.backupdir = cacheDir .. "backup/";
go.viewdir = cacheDir .. "view/";
--bo.spellfile = cacheDir .. "spell/en.utf-8.add";
-- 显示行号
wo.number = true;
-- 相对的显示行号
wo.relativenumber = true;
wo.cursorline = true;
wo.cursorcolumn = true;

-- 使用系统剪贴版
go.clipboard = "unnamedplus";
-- 修复索引线
o.colorcolumn = "99999";
-- so that `` is visible in markdown files
o.conceallevel = 0;
-- 设置历史操作记录为2000条
o.history = 2000;
-- 给出换行符的格式（<EOL>)
o.fileformats = "unix,dos,mac";
-- 关闭八进制
bo.nrformats = "bin,hex";
go.magic = true;
-- 设置Vim的内部字符编码，作用于缓冲区、寄存器、表达式所用的字符串、viminfo保存的各种文本等
o.encoding = "UTF-8";
-- 记住前一次打开文件的状态
go.viewoptions = "folds,cursor,curdir,slash,unix";
-- 恢复前一次窗口状态
go.sessionoptions = "curdir,help,tabpages,winsize";
-- 置位时对文件名称喝目录的补全，忽略大小写
go.wildignorecase = true;
-- 文件模式的列表，忽略这些文件
go.wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**";
go.shada = "!,'1000,<300,@120,s10,h";
-- 跳过此目录的文件备份
go.backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim";
-- 缩进取整到 shiftwidth的倍数，用于 > 和 < 命令
go.shiftround = true;
-- 打开映射的超时选项
go.timeout = true;
-- 打开键码的超时选项
go.ttimeout = true;
-- 毫秒计的等待键码或者映射的键序列完成的时间
go.timeoutlen = 500;
go.ttimeoutlen = 10;
-- 间隔100毫秒没有输入，则将内容写入磁盘
go.updatetime = 100;
--readrawtime = 1500,
-- 搜索时忽略大小写
go.ignorecase = true;
-- 查找时，小写字母也可以匹配大写字母
go.smartcase = true;
-- 插入模式总的补全
bo.infercase = true;
-- 查找时高亮匹配的字符
go.incsearch = true;
-- 打开回绕查询
go.wrapscan = true;
-- 设置插入模式补全的匹配
--complete = ".,w,b,k";

-- nosplit 在缓冲区中以增量方式显示命令的效果。
-- split 与“nosplit”类似，但也在预览窗口中显示部分离屏结果。
go.inccommand = "nosplit";
-- 识别 :grep命令的输出格式
go.grepformat = "%f:%l:%c:%m";
o.grepprg = "rg --hidden --vimgrep --smart-case --";
-- 可以指定的字符中换行
go.breakat = [[\ \ ;:,!?]];
-- 页面移动时不将光标移动到第一个非空字符上，而是保持在本列中
go.startofline = false;
-- 当光标到最右边或者最左边，按以下按键光标会移动到上一行或下一行
go.whichwrap = "h,l,<,>,[,],~";
-- 控制缓冲区的切换行为
go.switchbuf = "useopen";
--backspace = "indent,eol,start",
-- 比较模式的选项
go.diffopt = "filler,iwhite,internal,algorithm:patience";
-- 用于插入模式的补全操作
opt.completeopt = "menu,menuone,noselect";
go.jumpoptions = "stack";
-- 如果处于插入、替换或可视化模式，则将消息放在最后一行。
go.showmode = false;
-- 底部状态信息显示的内容选项
go.shortmess = "aoOTIcF";
-- 光标上下最少保留的屏幕行
o.scrolloff = 5;
-- 光标两侧最少保留的屏幕行
o.sidescrolloff = 5;
-- 文件内容是否有折叠（99:没有折叠）
go.foldlevelstart = 99;
-- 标尺，显示光标位置的行号和列号
go.ruler = true;
-- 永远显示标签页与标签行
go.showtabline = 2;
-- 窗口的宽度
--winwidth = 30,
-- 窗口的最小宽度
--winminwidth = 12,
-- 插入模式补全弹出菜单显示项目的最大数目
go.pumheight = 17;
-- 使用 :help 命令打开窗口的宽度
go.helpheight = 17;
-- 预览窗口的高度
go.previewheight = 17;
-- 屏幕最后一行显示命令（如果终端变得很慢，关闭此选项）
go.showcmd = true;
-- 命令行使用的屏幕行数
go.cmdheight = 2;
-- 打开命令窗口的大小 普通界面 q: 打开 或者命令行 :<C-F> 打开 
go.cmdwinheight = 17;
-- 关闭：分割窗口会减少当前窗口的尺寸，并保持其他窗口不变
-- 如果关闭窗口，额外的空间分配给紧邻的窗口
-- 当打开时，所有的窗口在打开后自动做出相同的大小分裂或关闭窗口。
-- 当关闭窗口时，额外的行被指定给旁边的窗口(取决于'splitbelow'和'splitright')。
go.equalalways = false;
-- 窗口分割时，将新的窗口放到当前窗口的下方
go.splitbelow = true;
-- 窗口分割时，将新的窗口放到当前窗口的右方
go.splitright = true;
-- 最后一个窗口是否拥有状态栏（2:总是拥有）
go.laststatus = 2;
--display = "lastline",
-- 回绕行放置在开头的字符串
o.showbreak = "↳  ";
-- 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
o.list = true;
o.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←";
-- 打开时，行首的<Tab> 根据 shiftwidth 选项插入空白
go.smarttab = true;
-- 设置 TAB 的长度
bo.tabstop = 4;
-- 编辑时，插入<Tab>或者使用<BS>时，把<TAB>算作空格的数目
bo.softtabstop = 4;
-- 缩进的长度
bo.shiftwidth = 4;
-- 将TAB转换成空格
bo.expandtab = true;
-- 使用'<' 或 ’'>' 缩进时将<Tab>替换成空格
bo.autoindent = true;
-- 为弹出菜单启用伪透明
go.pumblend = 17;
-- 本地窗口为浮动窗口启用伪透明
wo.winblend = 17;
-- 拼写检查
--wo.spell = true;
-- 对指定的语言进行拼写检查
--bo.spelllang = "en_us,cjk";
-- 映射 mapleader 
g.mapleader = ",";

--关闭不需要的插件
for k, v in pairs(disableDistributionPlugins) do
    g[v] = 1;
end
