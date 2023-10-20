--
--  nvim 基本设置
--

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
local global = require("core.global")

local function load_options()
	local global_local = {
		-- 配置备份文件存放路径
		-- 交换文件的目录名
		-- backupdir = global.cache_dir .. "backup/",
		-- directory = global.cache_dir .. "swap/",
		-- spellfile = global.cache_dir .. "spell/en.uft-8.add",
		-- viewdir = global.cache_dir .. "view/",
		-- Neovim QT GUI字体设置
		guifont = "FuraCode Nerd Font:h12";
		-- 使用'<' 或 ’'>' 缩进时将<Tab>替换成空格
		autoindent = true,
		autoread = true,
		autowrite = true,
		backspace = "indent,eol,start",
		-- 当backup 与 writebackup 同时为 false时，没有备份文件
		-- 关闭文件备份
		backup = false,
		-- 跳过此目录的文件备份
		backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
		-- 可以指定的字符中换行
		breakat = [[\ \	;:,!?]],
		breakindentopt = "shift:2,min:20",
		-- 使用系统剪贴版
		clipboard = "unnamedplus",
		-- 命令行使用的屏幕行数
		cmdheight = 1, -- 0, 1, 2
		-- 打开命令窗口的大小 普通界面 q: 打开 或者命令行 :<C-F> 打开 
		cmdwinheight = 5,
		-- 设置插入模式补全的匹配
		complete = ".,w,b,k",
		-- 用于插入模式的补全操作
		completeopt = "menuone,noselect",
		concealcursor = "niv",
		conceallevel = 0,
		cursorcolumn = true,
		cursorline = true,
		-- 比较模式的选项
		diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience",
		display = "lastline",
		-- 设置Vim的内部字符编码，作用于缓冲区、寄存器、表达式所用的字符串、viminfo保存的各种文本等
		encoding = "utf-8",
		-- 关闭：分割窗口会减少当前窗口的尺寸，并保持其他窗口不变
		-- 如果关闭窗口，额外的空间分配给紧邻的窗口
		-- 当打开时，所有的窗口在打开后自动做出相同的大小分裂或关闭窗口。
		-- 当关闭窗口时，额外的行被指定给旁边的窗口(取决于'splitbelow'和'splitright')。
		equalalways = false,
		-- 关闭错误信息响铃
		errorbells = true,
		-- 将TAB转换成空格
		expandtab = true,
		-- 给出换行符的格式（<EOL>)
		fileformats = "unix,mac,dos",
		foldenable = true,
		-- 文件内容是否有折叠（99:没有折叠）
		foldlevelstart = 99,
		formatoptions = "1jcroql",
		-- 识别 :grep命令的输出格式
		grepformat = "%f:%l:%c:%m",
		grepprg = "rg --hidden --vimgrep --smart-case --",
		-- 使用 :help 命令打开窗口的宽度
		helpheight = 12,
		-- 提示缓冲区已经修改，但文件尚未保存
		hidden = true,
		-- 设置历史操作记录为2000条
		history = 2000,
		-- 搜索时忽略大小写
		ignorecase = true,
		-- nosplit 在缓冲区中以增量方式显示命令的效果。
		-- split 与“nosplit”类似，但也在预览窗口中显示部分离屏结果。
		inccommand = "nosplit",
		-- 查找时高亮匹配的字符
		incsearch = true,
		-- 插入模式总的补全
		infercase = true,
		jumpoptions = "stack",
		-- 最后一个窗口是否拥有状态栏（2:总是拥有）
		laststatus = 2,
		linebreak = true,
		-- 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
		list = true,
		listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
		magic = true,
		mousescroll = "ver:3,hor:6",
		-- 显示行号
		number = true,
		-- 预览窗口的高度
		previewheight = 12,
		-- Do NOT adjust the following option (pumblend) if you're using transparent background
		-- 为弹出菜单启用伪透明
		pumblend = 0,
		-- 插入模式补全弹出菜单显示项目的最大数目
		pumheight = 17,
		redrawtime = 1500,
		-- 相对的显示行号
		relativenumber = true,
		-- 标尺，显示光标位置的行号和列号
		ruler = true,
		-- 光标上下最少保留的屏幕行
		scrolloff = 5,
		-- 恢复前一次窗口状态
		sessionoptions = "buffers,curdir,folds,help,tabpages,winpos,winsize",
		shada = "!,'500,<50,@100,s10,h",
		-- 缩进取整到 shiftwidth的倍数，用于 > 和 < 命令
		shiftround = true,
		-- 缩进的长度
		shiftwidth = 4,
		-- 底部状态信息显示的内容选项
		shortmess = "aoOTIcF",
		-- 回绕行放置在开头的字符串
		showbreak = "↳  ",
		-- 屏幕最后一行显示命令（如果终端变得很慢，关闭此选项）
		showcmd = false,
		-- 如果处于插入、替换或可视化模式，则将消息放在最后一行。
		showmode = false,
		-- 永远显示标签页与标签行
		showtabline = 2,
		-- 光标两侧最少保留的屏幕行
		sidescrolloff = 5,
		signcolumn = "yes",
		-- 查找时，小写字母也可以匹配大写字母
		smartcase = true,
		-- 打开时，行首的<Tab> 根据 shiftwidth 选项插入空白
		smarttab = true,
		-- 编辑时，插入<Tab>或者使用<BS>时，把<TAB>算作空格的数目
		softtabstop = 4,
		-- 窗口分割时，将新的窗口放到当前窗口的下方
		splitbelow = true,
		splitkeep = "screen",
		-- 窗口分割时，将新的窗口放到当前窗口的右方
		splitright = true,
		-- 页面移动时不将光标移动到第一个非空字符上，而是保持在本列中
		startofline = false,
		-- 关闭缓冲区使用交换文件（关闭后不要在大文件，无法恢复）
		swapfile = false,
		-- 控制缓冲区的切换行为
		switchbuf = "usetab,uselast",
		synmaxcol = 2500,
		-- 设置 TAB 的长度
		tabstop = 4,
		-- 使vim支持真彩（highlight-guifg 和 highlight-guibg)
		termguicolors = true,
		-- 打开映射的超时选项
		timeout = true,
		-- 毫秒计的等待键码或者映射的键序列完成的时间
		timeoutlen = 300,
		-- 打开键码的超时选项
		ttimeout = true,
		ttimeoutlen = 0,
		undodir = global.cache_dir .. "undo/",
		undofile = true,
		-- Please do NOT set `updatetime` to above 500, otherwise most plugins may not function correctly
		updatetime = 200,
		-- 记住前一次打开文件的状态
		viewoptions = "folds,cursor,curdir,slash,unix",
		-- 允许可视列块的虚拟编辑
		virtualedit = "block",
		-- 使用可视响亮代替鸣叫
		visualbell = true,
		-- 当光标到最右边或者最左边，按以下按键光标会移动到上一行或下一行
		whichwrap = "h,l,<,>,[,],~",
		-- 文件模式的列表，忽略这些文件
		wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
		-- 置位时对文件名称喝目录的补全，忽略大小写
		wildignorecase = true,
		-- Do NOT adjust the following option (winblend) if you're using transparent background
		-- 本地窗口为浮动窗口启用伪透明
		winblend = 0,
		winminwidth = 10,
		winwidth = 30,
		wrap = false,
		-- 打开回绕查询
		wrapscan = true,
		-- 覆盖文件前建立备份，文件写入成功后，除非 backup 打开，否则删除该备份
		writebackup = false,
	}

	local function isempty(s)
		return s == nil or s == ""
	end
	local function use_if_defined(val, fallback)
		return val ~= nil and val or fallback
	end

	-- custom python provider
	local conda_prefix = os.getenv("CONDA_PREFIX")
	if not isempty(conda_prefix) then
		vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, conda_prefix .. "/bin/python")
		vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, conda_prefix .. "/bin/python")
	else
		vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, "python")
		vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, "python3")
	end

	for name, value in pairs(require("modules.utils").extend_config(global_local, "user.options")) do
		vim.o[name] = value
	end
end

load_options()
