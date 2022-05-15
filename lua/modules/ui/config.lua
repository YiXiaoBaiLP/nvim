local M = {};

-- 主题配置
function M.themeConf()
    g = vim.g;
    -- Example config in Lua
    g.tokyonight_style = "night";
    -- 注释斜体
    g.tokyonight_italic_comments = true;
    -- 关键字斜体
    g.tokyonight_italic_keywords = true;
    -- 函数斜体
    g.tokyonight_italic_functions = false;
    -- 变量和标识符斜体
    g.tokyonight_italic_variables = false;
    -- 可以禁用背景色
    g.tokyonight_transparent = false;

    g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" };

    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    g.tokyonight_colors = { hint = "orange", error = "#ff0000" };

    -- Load the colorscheme
    vim.cmd[[colorscheme tokyonight]]
end

-- 状态栏指示插件配置
function M.nvimGps()
	require("nvim-gps").setup({
		icons = {
			["class-name"] = " ", -- Classes and class-like objects
			["function-name"] = " ", -- Functions
			["method-name"] = " ", -- Methods (functions inside class-like objects)
		},
		languages = {
			-- You can disable any language individually here
			["c"] = true,
			["cpp"] = true,
			["go"] = true,
			["java"] = true,
			["javascript"] = true,
			["lua"] = true,
			["python"] = true,
			["rust"] = true,
		},
		separator = " > ",
	})
end

-- nvim启动界面配置
function M.alphaConf()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")
    -- 开始界面的字符画
	dashboard.section.header.val = {  [[                                                                                  ]],
        [[                                                                                  ]],
        [[ __   __    _    __  __     _                      ___              _             ]],
        [[ \ \ / /   (_)   \ \/ /    (_)    __ _     ___    | _ )   __ _     (_)      o O O ]],
        [[  \ V /    | |    >  <     | |   / _` |   / _ \   | _ \  / _` |    | |     o      ]],
        [[  _|_|_   _|_|_  /_/\_\   _|_|_  \__,_|   \___/   |___/  \__,_|   _|_|_   TS__[O] ]],
        [[_| """ |_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""| {======| ]],
        [["`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'./o--000' ]],
        [[                                                                                  ]],
        [[                                                                                  ]],
    }

	local function button(sc, txt, leader_txt, keybind, keybind_opts)
		local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")

		local opts = {
			position = "center",
			shortcut = sc,
			cursor = 5,
			width = 50,
			align_shortcut = "right",
			hl_shortcut = "Keyword",
		}

		if nil == keybind then
			keybind = sc_after
		end
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_after, keybind, keybind_opts }

		local function on_press()
			-- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
			local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
			vim.api.nvim_feedkeys(key, "t", false)
		end

		return {
			type = "button",
			val = txt,
			on_press = on_press,
			opts = opts,
		}
	end
	local leader = "comma"
    -- 字符画下面的选项
	dashboard.section.buttons.val = {
		button("comma s c", " Scheme change", leader, "<cmd>Telescope colorscheme<cr>"),
		button("comma f r", " File frecency", leader, "<cmd>Telescope frecency<cr>"),
		button("comma f e", " File history", leader, "<cmd>Telescope oldfiles<cr>"),
		button("comma f p", " Project find", leader, "<cmd>Telescope project<cr>"),
		button("comma f f", " File find", leader, "<cmd>Telescope find_files<cr>"),
		button("comma f n", " File new", leader, "<cmd>enew<cr>"),
		button("comma f w", " Word find", leader, "<cmd>Telescope live_grep<cr>"),
	}
	dashboard.section.buttons.opts.hl = "String"

	local function footer()
		local total_plugins = #vim.tbl_keys(packer_plugins)
		return "   Have Fun with neovim"
			.. "   v"
			.. vim.version().major
			.. "."
			.. vim.version().minor
			.. "."
			.. vim.version().patch
			.. "   "
			.. total_plugins
			.. " plugins"
	end
	dashboard.section.footer.val = footer()
	dashboard.section.footer.opts.hl = "Function"

	local head_butt_padding = 2
	local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
	local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.25))
	local foot_butt_padding = 1

	dashboard.config.layout = {
		{ type = "padding", val = header_padding },
		dashboard.section.header,
		{ type = "padding", val = head_butt_padding },
		dashboard.section.buttons,
		{ type = "padding", val = foot_butt_padding },
		dashboard.section.footer,
	}

	alpha.setup(dashboard.opts)
end

-- nvim的状态栏配置
function M.lualine()
    local gps = require("nvim-gps");

    local function gps_content()
        if gps.is_available() then
            return gps.get_location()
        else
            return ""
        end
    end
    local symbols_outline = {
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'filetype'},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {'location'}
        },
        filetypes = {'Outline'}
    }

    require("lualine").setup {
        options = {
            -- 启用图标
            icons_enabled = true,
            -- 设置主题
            theme = "tokyonight",
            disabled_filetypes = {},
            -- 组件分割符
            component_separators = "|",
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = {"mode"},
            lualine_b = {
                {"branch"},
                {"diff"},
            },
            lualine_c = {
                {"lsp_progress"},
                {
                    gps_content, 
                    cond = gps.is_available
                }
            },
            lualine_x = {
                {
                    "diagnostics",
                    sources = {'nvim_diagnostic'},
                    symbols = {
                        error = " ",
                        warn = " ",
                        info = " "
                    }
                }
            },
            lualine_y = {
                "filetype", 
                "progress",
                "location"
            },
            lualine_z = {
                "fileformat",
                "encoding"
            }
        },
        -- 不活跃时显示的内容
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {"filename"},
            lualine_x = {"location"},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        -- 为特定的插件配置窗口
        extensions = {
            "quickfix",
            "nvim-tree",
            "toggleterm",
            "fugitive",
            symbols_outline
        }
    }
end

-- 文件树配置

function M.nvimTree()
	vim.g.nvim_tree_root_folder_modifier = ":e"
	vim.g.nvim_tree_icon_padding = " "
	vim.g.nvim_tree_symlink_arror = "  "
	vim.g.nvim_tree_respect_buf_cwd = 1

	vim.g.nvim_tree_icons = {
		["default"] = "", --
		["symlink"] = "",
		["git"] = {
			["unstaged"] = "",
			["staged"] = "", --
			["unmerged"] = "שׂ",
			["renamed"] = "", --
			["untracked"] = "ﲉ",
			["deleted"] = "",
			["ignored"] = "", --◌
		},
		["folder"] = {
			['arrow_open'] = "",
			['arrow_closed'] = "",
			--["arrow_open"] = "",
			--["arrow_closed"] = "",
			["default"] = "",
			["open"] = "",
			["empty"] = "",
			["empty_open"] = "",
			["symlink"] = "",
			["symlink_open"] = "",
		},
	}

	require("nvim-tree").setup({
		auto_reload_on_write = true,
		disable_netrw = false,
		hijack_cursor = true,
		hijack_netrw = true,
		hijack_unnamed_buffer_when_opening = false,
		ignore_buffer_on_setup = false,
		open_on_setup = false,
		open_on_setup_file = false,
		open_on_tab = false,
		sort_by = "name",
		update_cwd = true,
		view = {
			width = 30,
			height = 30,
			side = "left",
			preserve_window_proportions = false,
			number = false,
			relativenumber = false,
			signcolumn = "yes",
			hide_root_folder = false,
		},
		renderer = {
			indent_markers = {
				enable = true,
				icons = {
					corner = "└ ",
					edge = "│ ",
					none = "  ",
				},
			},
		},
		hijack_directories = {
			enable = true,
			auto_open = true,
		},
		update_focused_file = {
			enable = true,
			update_cwd = true,
			ignore_list = {},
		},
		ignore_ft_on_setup = {},
		filters = {
			dotfiles = false,
			custom = { ".DS_Store" },
			exclude = {},
		},
		actions = {
			use_system_clipboard = true,
			change_dir = {
				enable = true,
				global = false,
			},
			open_file = {
				quit_on_open = false,
				resize_window = false,
				window_picker = {
					enable = true,
					chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
					exclude = {
						filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
						buftype = { "nofile", "terminal", "help" },
					},
				},
			},
		},
	})
end

function M.nvimBufferline()
	require("bufferline").setup({
		options = {
			number = "none",
			modified_icon = "✥",
			buffer_close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			max_name_length = 14,
			max_prefix_length = 13,
			tab_size = 20,
			show_buffer_close_icons = true,
			show_buffer_icons = true,
			show_tab_indicators = true,
			diagnostics = "nvim_lsp",
			always_show_bufferline = true,
			separator_style = "thin",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					padding = 1,
				},
			},
		},
	})
end

-- Git相关配置
function M.gitsigns()
	require("gitsigns").setup({
		signs = {
			add = {
				hl = "GitSignsAdd",
				text = "│",
				numhl = "GitSignsAddNr",
				linehl = "GitSignsAddLn",
			},
			change = {
				hl = "GitSignsChange",
				text = "│",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
			delete = {
				hl = "GitSignsDelete",
				text = "_",
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			topdelete = {
				hl = "GitSignsDelete",
				text = "‾",
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			changedelete = {
				hl = "GitSignsChange",
				text = "~",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
		},
		keymaps = {
			-- Default keymap options
			noremap = true,
			buffer = true,
			["n ]g"] = {
				expr = true,
				"&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'",
			},
			["n [g"] = {
				expr = true,
				"&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'",
			},
			["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
			["v <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
			["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
			["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
			["v <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
			["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
			["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
			["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
			-- Text objects
			["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
			["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
		},
		watch_gitdir = { interval = 1000, follow_files = true },
		current_line_blame = true,
		current_line_blame_opts = { delay = 1000, virtual_text_pos = "eol" },
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		word_diff = false,
		diff_opts = { internal = true },
	})
end


function M.indentBlankline()
	opt.termguicolors = true
	opt.list = true
	require("indent_blankline").setup({
		char = "│",
		show_first_indent_level = true,
		filetype_exclude = {
			"startify",
			"dashboard",
			"dotooagenda",
			"log",
			"fugitive",
			"gitcommit",
			"packer",
			"vimwiki",
			"markdown",
			"json",
			"txt",
			"vista",
			"help",
			"todoist",
			"NvimTree",
			"peekaboo",
			"git",
			"TelescopePrompt",
			"undotree",
			"flutterToolsOutline",
            "java",
			"", -- for all buffers without a file type
		},
		buftype_exclude = { "terminal", "nofile" },
		show_trailing_blankline_indent = false,
		show_current_context = true,
		context_patterns = {
			"class",
			"function",
			"method",
			"block",
			"list_literal",
			"selector",
			"^if",
			"^table",
			"if_statement",
			"while",
			"for",
			"type",
			"var",
			"import",
		},
		space_char_blankline = " ",
	})
	-- because lazy load indent-blankline so need readd this autocmd
	vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")
end

return M;
