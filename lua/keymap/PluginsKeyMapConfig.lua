local M = {};
---------------------------------------------------------------------------------------
local bind = require('keymap.bind');
local mapCR = bind.mapCR;
local mapCU = bind.mapCU;
local mapCMD = bind.mapCMD;
local mapArgs = bind.mapArgs;
--require('keymap.config');

local plugMap = {
   -- ["i|<Tab>"]         = mapCMD('v:lua.tab_complete()'):withExpr():withSilent(),
   -- ["i|<S-Tab>"]       = mapCMD('v:lua.s_tab_complete()'):withSilent():withExpr(),
   -- ["i|<CR>"]          = mapCMD([[compe#confirm({'keys': "\<Plug>delimitMateCR", 'mode': ''})]]):withNoremap():withExpr():withNowait(),
    -- person keymap
   -- ["n|mf"]            = mapCR("<cmd>lua require('internal.fsevent').file_event()<CR>"):withSilent():withNowait():withNoremap(),
	-- Bufferline
    -- 标签相关插件
	["n|gb"] = mapCR("BufferLinePick"):withNoremap():withSilent(),
	["n|<A-j>"] = mapCR("BufferLineCycleNext"):withNoremap():withSilent(),
	["n|<A-k>"] = mapCR("BufferLineCyclePrev"):withNoremap():withSilent(),
	["n|<A-S-j>"] = mapCR("BufferLineMoveNext"):withNoremap():withSilent(),
	["n|<A-S-k>"] = mapCR("BufferLineMovePrev"):withNoremap():withSilent(),
	["n|<leader>be"] = mapCR("BufferLineSortByExtension"):withNoremap(),
	["n|<leader>bd"] = mapCR("BufferLineSortByDirectory"):withNoremap(),
	["n|<A-1>"] = mapCR("BufferLineGoToBuffer 1"):withNoremap():withSilent(),
	["n|<A-2>"] = mapCR("BufferLineGoToBuffer 2"):withNoremap():withSilent(),
	["n|<A-3>"] = mapCR("BufferLineGoToBuffer 3"):withNoremap():withSilent(),
	["n|<A-4>"] = mapCR("BufferLineGoToBuffer 4"):withNoremap():withSilent(),
	["n|<A-5>"] = mapCR("BufferLineGoToBuffer 5"):withNoremap():withSilent(),
	["n|<A-6>"] = mapCR("BufferLineGoToBuffer 6"):withNoremap():withSilent(),
	["n|<A-7>"] = mapCR("BufferLineGoToBuffer 7"):withNoremap():withSilent(),
	["n|<A-8>"] = mapCR("BufferLineGoToBuffer 8"):withNoremap():withSilent(),
	["n|<A-9>"] = mapCR("BufferLineGoToBuffer 9"):withNoremap():withSilent(),

    -- packer
    ["n|<Leader>pu"]    = mapCR("PackerUpdate"):withSilent():withNoremap():withNowait(),
    ["n|<Leader>pi"]    = mapCR("PackerInstall"):withSilent():withNoremap():withNowait(),
    ["n|<Leader>pc"]    = mapCR("PackerCompile"):withSilent():withNoremap():withNowait(),
    -- Plugin nvim-tree
    -- 文件目录树插件
	["n|<C-n>"] = mapCR("NvimTreeToggle"):withNoremap():withSilent(),
	["n|<Leader>nf"] = mapCR("NvimTreeFindFile"):withNoremap():withSilent(),
	["n|<Leader>nr"] = mapCR("NvimTreeRefresh"):withNoremap():withSilent(),
	-- Plugin Undotree
    -- 可视化历史命令
	["n|<Leader>u"]     = mapCR("UndotreeToggle"):withNoremap():withSilent(),
    -- Lsp mapp work when insertenter and lsp start
    ["n|<Leader>li"]    = mapCR("LspInfo"):withNoremap():withSilent():withNowait(),
    ["n|<Leader>ll"]    = mapCR("LspLog"):withNoremap():withSilent():withNowait(),
    ["n|<Leader>lr"]    = mapCR("LspRestart"):withNoremap():withSilent():withNowait(),
    ["n|<C-f>"]         = mapCMD("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>"):withNoremap():withSilent():withNowait(),
    ["n|<C-b>"]         = mapCMD("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>"):withNoremap():withSilent():withNowait(),
    ["n|[e"]            = mapCR('Lspsaga diagnostic_jump_next'):withNoremap():withSilent(),
    ["n|]e"]            = mapCR('Lspsaga diagnostic_jump_prev'):withNoremap():withSilent(),
    ["n|K"]             = mapCR("Lspsaga hover_doc"):withNoremap():withSilent(),
    ["n|ga"]            = mapCR("Lspsaga code_action"):withNoremap():withSilent(),
    ["v|ga"]            = mapCU("Lspsaga ranger_code_action"):withNoremap():withSilent(),
    ["n|gd"]            = mapCR("Lspsaga preview_definition"):withNoremap():withSilent(),
    ["n|gD"]            = mapCMD("<cmd>lua vim.lsp.buf.implementaion()<CR>"):withNoremap():withSilent(),
    ["n|gs"]            = mapCR("Lspsaga signature_help"):withNoremap():withSilent(),
    ["n|gr"]            = mapCR("Lspsaga rename"):withNoremap():withSilent(),
    ["n|gh"]            = mapCR("Lspsaga lsp_finder"):withNoremap():withSilent(),
    ["n|gt"]            = mapCMD("<cmd>lua vim.lsp.buf.type_definition()<CR>"):withNoremap():withSilent(),
    ["n|<Leader>cw"]    = mapCMD("<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"):withNoremap():withSilent(),
    ["n|<Leader>ce"]    = mapCR("Lspsaga show_line_diagnostics"):withNoremap():withSilent(),
    ["n|<Leader>ct"]    = mapArgs("Template"),
    ["n|<Leader>tf"]    = mapCU("DashboardNewFile"):withNoremap():withSilent(),
    -- Plugin nim-tree
    ["n|<Leader>e"]     = mapCR("NvimTreeToggle"):withNoremap():withSilent(),
    ["n|<Leader>F"]     = mapCR("NvimTreeFindFile"):withNoremap():withSilent(),
    -- Plugin markdownPreview
    ["n|<Leader>om"]    = mapCU("MarkdownPreview"):withNoremap():withSilent(),
    -- Plugin DadbodUI
    ["n|<Leader>od"]    = mapCR("DBUIToggle"):withNoremap():withSilent(),
    -- Plugins Floaterm
    ["n|<A-d>"]         = mapCR("Lspsaga open_floaterm"):withNoremap():withSilent(),
    ["t|<A-d>"]         = mapCU([[<C-\><C-n>:Lspsaga close_floaterm<CR>]]):withNoremap():withSilent(),
    ["n|<Leader>g"]     = mapCU("Lsgsaga open_floaterm lazygit"):withNoremap():withSilent(),



};

function M.get()
    bind.nvimLoadMapping(plugMap);
end
---------------------------------------------------------------------------------------
return M.get();
