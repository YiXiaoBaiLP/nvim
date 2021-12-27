-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/yixiaobai/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/yixiaobai/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/yixiaobai/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/yixiaobai/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/yixiaobai/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    after = { "cmp_luasnip" },
    config = { "\27LJ\1\2°\1\0\0\2\0\a\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0007\0\3\0003\1\4\0>\0\2\0014\0\0\0%\1\5\0>\0\2\0027\0\6\0>\0\1\1G\0\1\0\tload luasnip/loaders/from_vscode\1\0\2\fhistory\2\17updateevents\29TextChanged,TextChangedI\15set_config\vconfig\fluasnip\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com.cnpmjs.org/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\1\2Ã\3\0\0\5\0\b\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\6\0003\2\3\0002\3\3\0003\4\4\0;\4\1\3:\3\5\2:\2\a\1>\0\2\1G\0\1\0\foptions\1\0\0\foffsets\1\0\4\ttext\18File Explorer\fpadding\3\1\15text_align\vcenter\rfiletype\rNvimTree\1\0\14\23right_trunc_marker\bï‚©\20max_name_length\3\14\22left_trunc_marker\bï‚¨\22show_buffer_icons\2\24show_tab_indicators\2\rtab_size\3\20\20separator_style\tthin\vnumber\tnone\28show_buffer_close_icons\2\22max_prefix_length\3\r\16diagnostics\rnvim_lsp\27always_show_bufferline\2\22buffer_close_icon\bï™•\18modified_icon\bâœ¥\nsetup\15bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com.cnpmjs.org/akinsho/bufferline.nvim"
  },
  catppuccin = {
    config = { "\27LJ\1\2Æ\5\0\0\5\0\18\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0003\3\a\0003\4\b\0:\4\t\0033\4\n\0:\4\v\3:\3\f\0023\3\r\0:\3\14\0023\3\15\0:\3\16\2:\2\17\1>\0\2\1G\0\1\0\17integrations\21indent_blankline\1\0\2\fenabled\2\26colored_indent_levels\1\rnvimtree\1\0\2\fenabled\2\14show_root\2\15native_lsp\15underlines\1\0\4\16information\14underline\rwarnings\14underline\verrors\14underline\nhints\14underline\17virtual_text\1\0\4\16information\vitalic\rwarnings\vitalic\verrors\vitalic\nhints\vitalic\1\0\1\fenabled\2\1\0\17\15treesitter\2\14vim_sneak\1\15lightspeed\1\14which_key\2\14dashboard\2\16lsp_trouble\2\rmarkdown\2\rgitsigns\2\15bufferline\2\vbarbar\1\bhop\2\rlsp_saga\2\tfern\1\15ts_rainbow\2\14telescope\2\vneogit\1\14gitgutter\1\vstyles\1\0\5\rcomments\vitalic\14variables\tNONE\14functions\16italic,bold\rkeywords\vitalic\fstrings\tNONE\1\0\2\16term_colors\2\27transparent_background\1\nsetup\15catppuccin\frequire\0" },
    loaded = true,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com.cnpmjs.org/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    after = { "cmp-latex-symbols" },
    after_files = { "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["cmp-spell"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com.cnpmjs.org/hrsh7th/cmp-buffer"
  },
  ["cmp-latex-symbols"] = {
    after_files = { "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/cmp-latex-symbols/after/plugin/cmp_latex.lua" },
    load_after = {
      ["cmp-buffer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/cmp-latex-symbols",
    url = "https://github.com.cnpmjs.org/kdheepak/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    after = { "cmp-nvim-lua" },
    after_files = { "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      cmp_luasnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com.cnpmjs.org/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after = { "compe-tmux" },
    after_files = { "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com.cnpmjs.org/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after = { "cmp-spell" },
    after_files = { "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["compe-tmux"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com.cnpmjs.org/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    after = { "cmp-buffer" },
    after_files = { "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/cmp-spell/after/plugin/cmp-spell.lua" },
    load_after = {
      ["cmp-path"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/cmp-spell",
    url = "https://github.com.cnpmjs.org/f3fora/cmp-spell"
  },
  ["cmp-under-comparator"] = {
    loaded = true,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/start/cmp-under-comparator",
    url = "https://github.com.cnpmjs.org/lukas-reineke/cmp-under-comparator"
  },
  cmp_luasnip = {
    after = { "cmp-nvim-lsp" },
    after_files = { "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      LuaSnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com.cnpmjs.org/saadparwaiz1/cmp_luasnip"
  },
  ["compe-tmux"] = {
    after = { "cmp-path" },
    after_files = { "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/compe-tmux/after/plugin/compe_tmux.vim" },
    load_after = {
      ["cmp-nvim-lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/compe-tmux",
    url = "https://github.com.cnpmjs.org/andersevenrud/compe-tmux"
  },
  ["copilot.vim"] = {
    commands = { "Copilot" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/copilot.vim",
    url = "https://github.com.cnpmjs.org/github/copilot.vim"
  },
  ["dashboard-nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/dashboard-nvim",
    url = "https://github.com.cnpmjs.org/glepnir/dashboard-nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com.cnpmjs.org/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    after = { "plenary.nvim" },
    config = { "\27LJ\1\2³\f\0\0\4\0\28\0\0314\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\0013\2\16\0003\3\17\0:\3\18\0023\3\19\0:\3\20\2:\2\21\0013\2\22\0:\2\23\0013\2\24\0:\2\25\0013\2\26\0:\2\27\1>\0\2\1G\0\1\0\14diff_opts\1\0\1\rinternal\2\28current_line_blame_opts\1\0\2\ndelay\3è\a\21virtual_text_pos\beol\17watch_gitdir\1\0\2\rinterval\3è\a\17follow_files\2\fkeymaps\tn [g\1\2\1\0@&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]g\1\2\1\0@&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\f\17v <leader>hsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17v <leader>hrT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\vbuffer\2\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\to ih2:<C-U>lua require\"gitsigns\".text_object()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\tx ih2:<C-U>lua require\"gitsigns\".text_object()<CR>\fnoremap\2\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\nsigns\1\0\4\20update_debounce\3d\18sign_priority\3\6\23current_line_blame\2\14word_diff\1\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\bâ€¾\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\bâ”‚\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\bâ”‚\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com.cnpmjs.org/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2¨\5\0\0\3\0\16\0\0254\0\0\0007\0\1\0)\1\2\0:\1\2\0004\0\0\0007\0\1\0)\1\2\0:\1\3\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0003\1\a\0003\2\b\0:\2\t\0013\2\n\0:\2\v\0013\2\f\0:\2\r\1>\0\2\0014\0\0\0007\0\14\0%\1\15\0>\0\2\1G\0\1\0001autocmd CursorMoved * IndentBlanklineRefresh\bcmd\21context_patterns\1\15\0\0\nclass\rfunction\vmethod\nblock\17list_literal\rselector\b^if\v^table\17if_statement\nwhile\bfor\ttype\bvar\vimport\20buftype_exclude\1\3\0\0\rterminal\vnofile\21filetype_exclude\1\22\0\0\rstartify\14dashboard\16dotooagenda\blog\rfugitive\14gitcommit\vpacker\fvimwiki\rmarkdown\tjson\btxt\nvista\thelp\ftodoist\rNvimTree\rpeekaboo\bgit\20TelescopePrompt\rundotree\24flutterToolsOutline\5\1\0\5\25show_current_context\2\28show_first_indent_level\2\tchar\bâ”‚\25space_char_blankline\6 #show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\tlist\18termguicolors\bopt\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com.cnpmjs.org/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com.cnpmjs.org/ray-x/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "https://github.com.cnpmjs.org/tami5/lspsaga.nvim"
  },
  ["lualine-lsp-progress"] = {
    after = { "lualine.nvim" },
    load_after = {
      ["nvim-gps"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/lualine-lsp-progress",
    url = "https://github.com.cnpmjs.org/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2T\0\0\1\1\3\0\f+\0\0\0007\0\0\0>\0\1\2\15\0\0\0T\1\4€+\0\0\0007\0\1\0@\0\1\0T\0\2€%\0\2\0H\0\2\0G\0\1\0\0À\5\17get_location\17is_availableÀ\a\1\0\t\0/\0U4\0\0\0%\1\1\0>\0\2\0021\1\2\0003\2\r\0003\3\4\0003\4\3\0:\4\5\0033\4\6\0:\4\a\0032\4\0\0:\4\b\0032\4\0\0:\4\t\0032\4\0\0:\4\n\0033\4\v\0:\4\f\3:\3\14\0023\3\15\0:\3\16\0024\3\0\0%\4\17\0>\3\2\0027\3\18\0033\4\23\0003\5\19\0002\6\0\0:\6\20\0053\6\21\0:\6\22\5:\5\24\0043\5\26\0003\6\25\0:\6\5\0052\6\3\0003\a\27\0;\a\1\0063\a\28\0;\a\2\6:\6\a\0052\6\3\0003\a\29\0;\a\1\0063\a\31\0;\1\1\a7\b\30\0:\b \a;\a\2\6:\6\b\0052\6\3\0003\a!\0003\b\"\0:\b#\a3\b$\0:\b%\a;\a\1\6:\6\t\0053\6&\0:\6\n\0053\6'\0:\6\f\5:\5\14\0043\5(\0002\6\0\0:\6\5\0052\6\0\0:\6\a\0053\6)\0:\6\b\0053\6*\0:\6\t\0052\6\0\0:\6\n\0052\6\0\0:\6\f\5:\5+\0042\5\0\0:\5,\0043\5-\0;\2\5\5:\5.\4>\3\2\0010\0\0€G\0\1\0\15extensions\1\5\0\0\rquickfix\14nvim-tree\15toggleterm\rfugitive\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\1\3\0\0\rprogress\rlocation\1\4\0\0\rfiletype\rencoding\15fileformat\fsymbols\1\0\3\tinfo\tïª \twarn\tï± \nerror\tï— \fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\tcond\1\0\0\17is_available\1\2\0\0\17lsp_progress\1\2\0\0\tdiff\1\2\0\0\vbranch\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23section_separators\1\0\2\tleft\bî‚´\nright\bî‚¶\23disabled_filetypes\1\0\3\ntheme\15catppuccin\25component_separators\6|\18icons_enabled\2\nsetup\flualine\14filetypes\1\2\0\0\fOutline\rsections\1\0\0\14lualine_z\1\2\0\0\rlocation\14lualine_y\14lualine_x\14lualine_c\14lualine_b\1\2\0\0\rfiletype\14lualine_a\1\0\0\1\2\0\0\tmode\0\rnvim-gps\frequire\0" },
    load_after = {
      ["lualine-lsp-progress"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com.cnpmjs.org/nvim-lualine/lualine.nvim"
  },
  ["nvim-autopairs"] = {
    config = { '\27LJ\1\2\2\0\0\b\0\14\1\0294\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\0014\0\0\0%\1\3\0>\0\2\0024\1\0\0%\2\4\0>\1\2\0027\2\5\1\16\3\2\0007\2\6\2%\4\a\0007\5\b\0003\6\n\0003\a\t\0:\a\v\6>\5\2\0=\2\2\0017\2\f\0007\3\f\0\19\3\3\0\20\3\0\3%\4\r\0009\4\3\2G\0\1\0\vracket\tlisp\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\2\0' },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com.cnpmjs.org/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs", "LuaSnip" },
    config = { "\27LJ\1\2F\0\1\6\0\3\0\b4\1\0\0007\1\1\0017\1\2\1\16\2\0\0)\3\2\0)\4\2\0)\5\2\0@\1\5\0\27nvim_replace_termcodes\bapi\bvimÐ\1\0\0\a\0\b\2!4\0\0\0004\1\1\0007\1\2\0017\1\3\1'\2\0\0>\1\2\0=\0\0\3\b\1\0\0T\2\20€4\2\1\0007\2\2\0027\2\4\2'\3\0\0\21\4\1\0\16\5\0\0)\6\2\0>\2\5\0028\2\1\2\16\3\2\0007\2\5\2\16\4\1\0\16\5\1\0>\2\4\2\16\3\2\0007\2\6\2%\4\a\0>\2\3\2\n\2\0\0T\2\2€)\2\1\0T\3\1€)\2\2\0H\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2‰\4\0\2\a\0\t\0\0153\2\0\0004\3\2\0007\3\3\3%\4\4\0007\5\1\0016\5\5\0027\6\1\1>\3\4\2:\3\1\0013\3\6\0007\4\a\0007\4\b\0046\3\4\3:\3\5\1H\1\2\0\tname\vsource\1\0\b\tpath\v[PATH]\rnvim_lua\n[LUA]\rnvim_lsp\n[LSP]\vbuffer\n[BUF]\ttmux\v[TMUX]\fluasnip\v[SNIP]\nspell\f[SPELL]\forgmode\n[ORG]\tmenu\n%s %s\vformat\vstring\tkind\1\0\25\tText\bî˜’\rFunction\bïž”\rOperator\bïš”\nColor\bï£—\nClass\bï´¯\vModule\bï’‡\rConstant\bï£¾\rProperty\bï° \vMethod\bïš¦\15EnumMember\bï…\tUnit\bîˆŸ\14Interface\bïƒ¨\vStruct\bï†³\rVariable\bï– \fSnippet\bï‘\vFolder\bïŠ\nEvent\bïƒ§\nField\bï›¼\18TypeParameter\bï™±\tFile\bïœ˜\nValue\bï¢Ÿ\16Constructor\bï£\tEnum\bï…\fKeyword\bï Š\14Reference\bï’†\1\0\1\2\2\4\0\20+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\n€+\1\1\0>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\2\1>\1\1\1T\1\2€4\1\3\0>\1\1\1G\0\1\0\2À\1À\rfallback\rcomplete\21select_next_item\fvisibleR\0\1\2\1\2\0\f+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\2À\21select_prev_item\fvisible›\1\0\1\4\1\b\0\0204\1\0\0%\2\1\0>\1\2\0027\1\2\1'\2ÿÿ>\1\2\2\15\0\1\0T\2\t€4\1\3\0007\1\4\0017\1\5\1+\2\0\0%\3\6\0>\2\2\2%\3\a\0>\1\3\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\0À\5\28<Plug>luasnip-jump-prev\rfeedkeys\afn\bvim\rjumpable\fluasnip\frequire¦\1\0\1\4\1\b\0\0194\1\0\0%\2\1\0>\1\2\0027\1\2\1>\1\1\2\15\0\1\0T\2\t€4\1\3\0007\1\4\0017\1\5\1+\2\0\0%\3\6\0>\2\2\2%\3\a\0>\1\3\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\0À\5!<Plug>luasnip-expand-or-jump\rfeedkeys\afn\bvim\23expand_or_jumpable\fluasnip\frequireC\0\1\3\0\4\0\a4\1\0\0%\2\1\0>\1\2\0027\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\15lsp_expand\fluasnip\frequire®\14\1\0\t\0L\0¦\0014\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\0\0007\0\1\0%\1\3\0>\0\2\0014\0\0\0007\0\1\0%\1\4\0>\0\2\0014\0\0\0007\0\1\0%\1\5\0>\0\2\0014\0\0\0007\0\1\0%\1\6\0>\0\2\0014\0\0\0007\0\1\0%\1\a\0>\0\2\0014\0\0\0007\0\1\0%\1\b\0>\0\2\0014\0\0\0007\0\1\0%\1\t\0>\0\2\0014\0\0\0007\0\1\0%\1\n\0>\0\2\0014\0\0\0007\0\1\0%\1\v\0>\0\2\0014\0\0\0007\0\1\0%\1\f\0>\0\2\0014\0\0\0007\0\1\0%\1\r\0>\0\2\0011\0\14\0001\1\15\0004\2\16\0%\3\17\0>\2\2\0027\3\18\0023\4 \0003\5\30\0002\6\t\0007\a\19\0027\a\20\a7\a\21\a;\a\1\0067\a\19\0027\a\20\a7\a\22\a;\a\2\0067\a\19\0027\a\20\a7\a\23\a;\a\3\0064\a\16\0%\b\24\0>\a\2\0027\a\25\a;\a\4\0067\a\19\0027\a\20\a7\a\26\a;\a\5\0067\a\19\0027\a\20\a7\a\27\a;\a\6\0067\a\19\0027\a\20\a7\a\28\a;\a\a\0067\a\19\0027\a\20\a7\a\29\a;\a\b\6:\6\31\5:\5!\0043\5#\0001\6\"\0:\6$\5:\5%\0043\5)\0007\6&\0027\6'\0063\a(\0>\6\2\2:\6*\0057\6&\0027\6+\6>\6\1\2:\6,\0057\6&\0027\6-\6>\6\1\2:\6.\0057\6&\0027\6/\6'\aüÿ>\6\2\2:\0060\0057\6&\0027\6/\6'\a\4\0>\6\2\2:\0061\0057\6&\0027\0062\6>\6\1\2:\0063\0057\6&\0021\a4\0003\b5\0>\6\3\2:\0066\0057\6&\0021\a7\0003\b8\0>\6\3\2:\0069\0051\6:\0:\6;\0051\6<\0:\6=\5:\5&\0043\5?\0001\6>\0:\6@\5:\5A\0042\5\n\0003\6B\0;\6\1\0053\6C\0;\6\2\0053\6D\0;\6\3\0053\6E\0;\6\4\0053\6F\0;\6\5\0053\6G\0;\6\6\0053\6H\0;\6\a\0053\6I\0;\6\b\0053\6J\0;\6\t\5:\5K\4>\3\2\0010\0\0€G\0\1\0\fsources\1\0\1\tname\18latex_symbols\1\0\1\tname\vbuffer\1\0\1\tname\forgmode\1\0\1\tname\ttmux\1\0\1\tname\nspell\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\fsnippet\vexpand\1\0\0\0\n<C-l>\0\n<C-h>\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\n<C-e>\nclose\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\21select_prev_item\t<CR>\1\0\0\1\0\1\vselect\2\fconfirm\fmapping\15formatting\vformat\1\0\0\0\fsorting\1\0\0\16comparators\1\0\0\norder\vlength\14sort_text\tkind\nunder\25cmp-under-comparator\nscore\nexact\voffset\fcompare\vconfig\nsetup\bcmp\frequire\0\0009highlight CmpItemKindMethod guifg=#B48EAD guibg=NONE;highlight CmpItemKindFunction guifg=#B48EAD guibg=NONE7highlight CmpItemKindText guifg=#81A1C1 guibg=NONE<highlight CmpItemKindInterface guifg=#88C0D0 guibg=NONE;highlight CmpItemKindVariable guifg=#8FBCBB guibg=NONE=highlight CmpItemAbbrMatchFuzzy guifg=#5E81AC guibg=NONE8highlight CmpItemAbbrMatch guifg=#5E81AC guibg=NONE:highlight CmpItemKindKeyword guifg=#EBCB8B guibg=NONE;highlight CmpItemKindProperty guifg=#A3BE8C guibg=NONE7highlight CmpItemKindUnit guifg=#D08770 guibg=NONE:highlight CmpItemKindSnippet guifg=#BF616A guibg=NONEOhighlight CmpItemAbbrDeprecated guifg=#D8DEE9 guibg=NONE gui=strikethrough\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com.cnpmjs.org/hrsh7th/nvim-cmp"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\1\2^\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequire\20\1\0\1\0\1\0\0031\0\0\0000\0\0€H\0\2\0\0\0" },
    loaded = true,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com.cnpmjs.org/terrortylor/nvim-comment"
  },
  ["nvim-gps"] = {
    after = { "lualine-lsp-progress" },
    config = { "\27LJ\1\2Ö\1\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\14languages\1\0\b\6c\2\bcpp\2\15javascript\2\trust\2\ago\2\vpython\2\tjava\2\blua\2\nicons\1\0\1\14separator\b > \1\0\3\15class-name\tï – \16method-name\tïš¦ \18function-name\tïž” \nsetup\rnvim-gps\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/nvim-gps",
    url = "https://github.com.cnpmjs.org/SmiteshP/nvim-gps"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\1\2s\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/nvim-lightbulb",
    url = "https://github.com.cnpmjs.org/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com.cnpmjs.org/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp_signature.nvim", "nvim-lightbulb", "lspsaga.nvim", "nvim-lsp-installer" },
    config = { "\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!modules.completion.lspconfig\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com.cnpmjs.org/neovim/nvim-lspconfig"
  },
  ["nvim-scrollview"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/nvim-scrollview",
    url = "https://github.com.cnpmjs.org/dstein64/nvim-scrollview"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeOpen" },
    config = { "\27LJ\1\2«\15\0\0\t\0V\0ß\0014\0\0\0%\1\1\0>\0\2\0027\0\2\0004\1\0\0%\2\3\0>\1\2\0027\1\4\0013\2\6\0003\3\5\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0002\4\0\0:\4\r\3:\3\14\0023\3\15\0003\4\16\0002\5!\0003\6\18\0003\a\17\0:\a\19\6\16\a\0\0%\b\20\0>\a\2\2:\a\21\6;\6\1\0053\6\23\0003\a\22\0:\a\19\6\16\a\0\0%\b\24\0>\a\2\2:\a\21\6;\6\2\0053\6\25\0\16\a\0\0%\b\26\0>\a\2\2:\a\21\6;\6\3\0053\6\27\0\16\a\0\0%\b\28\0>\a\2\2:\a\21\6;\6\4\0053\6\29\0\16\a\0\0%\b\20\0>\a\2\2:\a\21\6;\6\5\0053\6\30\0\16\a\0\0%\b\31\0>\a\2\2:\a\21\6;\6\6\0053\6 \0\16\a\0\0%\b!\0>\a\2\2:\a\21\6;\6\a\0053\6\"\0\16\a\0\0%\b#\0>\a\2\2:\a\21\6;\6\b\0053\6$\0\16\a\0\0%\b%\0>\a\2\2:\a\21\6;\6\t\0053\6&\0\16\a\0\0%\b%\0>\a\2\2:\a\21\6;\6\n\0053\6'\0\16\a\0\0%\b(\0>\a\2\2:\a\21\6;\6\v\0053\6)\0\16\a\0\0%\b*\0>\a\2\2:\a\21\6;\6\f\0053\6+\0\16\a\0\0%\b,\0>\a\2\2:\a\21\6;\6\r\0053\6-\0\16\a\0\0%\b.\0>\a\2\2:\a\21\6;\6\14\0053\6/\0\16\a\0\0%\b0\0>\a\2\2:\a\21\6;\6\15\0053\0061\0\16\a\0\0%\b2\0>\a\2\2:\a\21\6;\6\16\0053\0063\0\16\a\0\0%\b4\0>\a\2\2:\a\21\6;\6\17\0053\0065\0\16\a\0\0%\b6\0>\a\2\2:\a\21\6;\6\18\0053\0067\0\16\a\0\0%\b8\0>\a\2\2:\a\21\6;\6\19\0053\0069\0\16\a\0\0%\b:\0>\a\2\2:\a\21\6;\6\20\0053\6;\0\16\a\0\0%\b<\0>\a\2\2:\a\21\6;\6\21\0053\6=\0\16\a\0\0%\b>\0>\a\2\2:\a\21\6;\6\22\0053\6?\0\16\a\0\0%\b@\0>\a\2\2:\a\21\6;\6\23\0053\6A\0\16\a\0\0%\bB\0>\a\2\2:\a\21\6;\6\24\0053\6C\0\16\a\0\0%\bD\0>\a\2\2:\a\21\6;\6\25\0053\6E\0\16\a\0\0%\bF\0>\a\2\2:\a\21\6;\6\26\0053\6G\0\16\a\0\0%\bH\0>\a\2\2:\a\21\6;\6\27\0053\6I\0\16\a\0\0%\bJ\0>\a\2\2:\a\21\6;\6\28\0053\6K\0\16\a\0\0%\bL\0>\a\2\2:\a\21\6;\6\29\0053\6M\0\16\a\0\0%\bN\0>\a\2\2:\a\21\6;\6\30\0053\6O\0\16\a\0\0%\bP\0>\a\2\2:\a\21\6;\6\31\0053\6Q\0\16\a\0\0%\bR\0>\a\2\2:\a\21\6;\6 \5:\5S\4:\4T\3:\3U\2>\1\2\1G\0\1\0\tview\rmappings\tlist\16toggle_help\1\0\1\bkey\ag?\nclose\1\0\1\bkey\6q\16system_open\1\0\1\bkey\6s\vdir_up\1\0\1\bkey\6-\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\n<C-r>\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\19toggle_ignored\1\0\1\bkey\6I\17last_sibling\1\0\1\bkey\6J\18first_sibling\1\0\1\bkey\6K\fpreview\1\0\1\bkey\n<Tab>\1\0\1\bkey\v<S-CR>\15close_node\1\0\1\bkey\t<BS>\16parent_node\1\0\1\bkey\6P\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\0\1\3\0\0\19<2-RightMouse>\n<C-]>\acb\vtabnew\bkey\1\0\0\1\4\0\0\t<CR>\6o\18<2-LeftMouse>\1\0\1\16custom_only\2\1\0\3\16auto_resize\1\tside\tleft\nwidth\3\30\24update_focused_file\16ignore_list\1\0\2\15update_cwd\2\venable\2\19auto_ignore_ft\1\3\0\0\rstartify\14dashboard\vignore\1\4\0\0\t.git\17node_modules\v.cache\bgit\1\0\a\15update_cwd\2\15auto_close\2\18disable_netrw\2\16open_on_tab\1\18hijack_cursor\2\27highlight_opened_files\2\17hijack_netrw\2\1\0\3\vignore\1\ftimeout\3ô\3\venable\2\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com.cnpmjs.org/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-gps" },
    config = { '\27LJ\1\2ô\6\0\0\5\0%\0-4\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\0014\0\0\0007\0\1\0007\0\2\0%\1\4\0>\0\2\0014\0\5\0%\1\6\0>\0\2\0027\0\a\0003\1\b\0003\2\t\0003\3\n\0:\3\v\2:\2\f\0013\2\16\0003\3\r\0003\4\14\0:\4\15\3:\3\17\0023\3\18\0003\4\19\0:\4\20\0033\4\21\0:\4\22\0033\4\23\0:\4\24\0033\4\25\0:\4\26\3:\3\27\2:\2\28\0013\2\29\0:\2\30\0013\2\31\0:\2 \0013\2!\0:\2"\0013\2#\0:\2$\1>\0\2\1G\0\1\0\fcontext\1\0\2\rthrottle\2\venable\2\fmatchup\1\0\1\venable\2\26context_commentstring\1\0\2\19enable_autocmd\1\venable\2\frainbow\1\0\3\19max_file_lines\3è\a\18extended_mode\2\venable\2\16textobjects\tmove\22goto_previous_end\1\0\2\a[]\20@function.outer\a[M\17@class.outer\24goto_previous_start\1\0\2\a[m\17@class.outer\a[[\20@function.outer\18goto_next_end\1\0\2\a]]\20@function.outer\a]M\17@class.outer\20goto_next_start\1\0\2\a]m\17@class.outer\a][\20@function.outer\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\fkeymaps\1\0\4\aif\20@function.inner\aaf\20@function.outer\aac\17@class.outer\aic\17@class.inner\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\bvim\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire,set foldexpr=nvim_treesitter#foldexpr()\24set foldmethod=expr\17nvim_command\bapi\bvim\0' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com.cnpmjs.org/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com.cnpmjs.org/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com.cnpmjs.org/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    load_after = {
      ["gitsigns.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com.cnpmjs.org/nvim-lua/plenary.nvim"
  },
  ["vim-cursorword"] = {
    config = { "\27LJ\1\2•\3\0\0\2\1\b\0\29+\0\0\0007\0\0\0%\1\1\0>\0\2\1+\0\0\0007\0\0\0%\1\2\0>\0\2\1+\0\0\0007\0\0\0%\1\3\0>\0\2\1+\0\0\0007\0\0\0%\1\4\0>\0\2\1+\0\0\0007\0\0\0%\1\5\0>\0\2\1+\0\0\0007\0\0\0%\1\6\0>\0\2\1+\0\0\0007\0\0\0%\1\a\0>\0\2\1G\0\1\0\1À\16augroup END/autocmd InsertLeave * let b:cursorword = 1/autocmd InsertEnter * let b:cursorword = 0?autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0Jautocmd FileType NvimTree,lspagafinder,dashboard let b:cursorword = 0\rautocmd!#augroup user_plugin_cursorword\17nvim_command\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/vim-cursorword",
    url = "https://github.com.cnpmjs.org/itchyny/vim-cursorword"
  },
  ["vim-easy-align"] = {
    commands = { "EasyAlign" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yixiaobai/.local/share/nvim/site/pack/packer/opt/vim-easy-align",
    url = "https://github.com.cnpmjs.org/junegunn/vim-easy-align"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\1\2Æ\5\0\0\5\0\18\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0003\3\a\0003\4\b\0:\4\t\0033\4\n\0:\4\v\3:\3\f\0023\3\r\0:\3\14\0023\3\15\0:\3\16\2:\2\17\1>\0\2\1G\0\1\0\17integrations\21indent_blankline\1\0\2\fenabled\2\26colored_indent_levels\1\rnvimtree\1\0\2\fenabled\2\14show_root\2\15native_lsp\15underlines\1\0\4\16information\14underline\rwarnings\14underline\verrors\14underline\nhints\14underline\17virtual_text\1\0\4\16information\vitalic\rwarnings\vitalic\verrors\vitalic\nhints\vitalic\1\0\1\fenabled\2\1\0\17\15treesitter\2\14vim_sneak\1\15lightspeed\1\14which_key\2\14dashboard\2\16lsp_trouble\2\rmarkdown\2\rgitsigns\2\15bufferline\2\vbarbar\1\bhop\2\rlsp_saga\2\tfern\1\15ts_rainbow\2\14telescope\2\vneogit\1\14gitgutter\1\vstyles\1\0\5\rcomments\vitalic\14variables\tNONE\14functions\16italic,bold\rkeywords\vitalic\fstrings\tNONE\1\0\2\16term_colors\2\27transparent_background\1\nsetup\15catppuccin\frequire\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\1\2^\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequire\20\1\0\1\0\1\0\0031\0\0\0000\0\0€H\0\2\0\0\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeOpen lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Copilot lua require("packer.load")({'copilot.vim'}, { cmd = "Copilot", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file EasyAlign lua require("packer.load")({'vim-easy-align'}, { cmd = "EasyAlign", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'vim-cursorword', 'gitsigns.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter', 'indent-blankline.nvim', 'gitsigns.nvim', 'bufferline.nvim', 'nvim-scrollview'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'vim-cursorword', 'nvim-lspconfig'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'dashboard-nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
