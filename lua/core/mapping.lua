local _M = {};
local bind = require(keymap.bind);
--------------------------------------------------------------------------------------------
local mapCR = bind.mapCR;
local mapCU = bind.mapCU;
local mapCMD = bind.mapCMD;


local defMap = {
    -- Vim map
    ["n|<C-x>k"] = mapCR('bdelete'):withNoremap():withSilent(),
    ["n|<C-s>"]  = mapCU('write'):withNoremap(),
    ["n|Y"]      = mapCmd('y$'):,
    ["n|]w"]     = mapCU('WhitespaceNext'):withNoremap(),
    ["n|[w"]     = mapCU('WhitespacePrev'):withNoremap(),
    ["n|]b"]     = mapCU('bp'):withNoremap(),
    ["n|[b"]     = mapCU('bn'):withNoremap(),
    ["n|<Space>cw"] = mapCU([[silent! keeppatterns %substitute/\s\+$//e]]):withNoremap():withSilent(),
    ["n|<C-h>"]     = mapCMD('<C-w>h'):withNoremap(),
    ["n|<C-j>"]     = mapCMD('<C-w>j'):withNoremap(),
    ["n|<C-k>"]     = mapCMD('<C-w>k'):withNoremap(),
    ["n|<C-l>"]     = mapCMD('<C-l>l'):withNoremap(),
    ["n|<A-[>"]     = mapCR('vertical resize -5'):withSilent(),
    ["n|<A-]>"]     = mapCR('vertical resize +5'):withSilent(),
    ["n|<C-q>"]     = mapCMD(':wq<CR>'),
    ["n|<Leader>ss"]= mapCU('SessionSave'):withNoremap(),
    ["n|<Leader>sl"]= mapCU('SessionLoad'):withNoremap(),

    -- Insert
    ["i|<C-w>"]     = mapCMD('<C-[>diwa'):withNoremap(),
    ["i|<C-h>"]     = mapCMD('<BS>'):withNoremap(),
    ["i|<C-d>"]     = mapCMD('<Del>'):withNoremap(),
    ["i|<C-u>"]     = mapCMD('<C-G>u<C-U>'):withNoremap(),
    ["i|<C-b>"]     = mapCMD('<Left>'):withNoremap(),
    ["i|<C-f>"]     = mapCMD('<Right>'):withNoremap(),
    ["i|<C-a>"]     = mapCMD('<ESC>^i'):withNoremap(),
    ["i|<C-j>"]     = mapCMD('<Esc>o'):withNoremap(),
    ["i|<C-k>"]     = mapCMD('<Esc>O'):withNoremap(),
    ["i|<C-s>"]     = mapCMD('<Esc>:w<CR>'),
    ["i|<C-q>"]     = mapCMD('<Esc>:wq<CR>'),
    ["i|<C-e>"]     = mapCMD([[pumvisible() ? "\<C-e>" : "\<End>"]]):withNoremap():withExpr(),

    --Command line
    ["c|<C-b>"]     = mapCMD('<Left>'):withNoremap(),
    ["c|<C-f>"]     = mapCMD('<Right>'):withNoremap(),
    ["c|<C-a>"]     = mapCMD('<Home>'):withNoremap(),
    ["c|<C-e>"]     = mapCMD('<End>'):withNoremap(),
    ["c|<C-d>"]     = mapCMD('<Del>'):withNoremap(),
    ["c|<C-h>"]     = mapCMD('<BS>'):withNoremap(),
    ["c|<C-t>"]     = mapCMD([[<C-R>=expand("%:p:h") . "/" <CR>]]):withNoremap(),

};

function get()
    -- 设置按键绑定
    bind.nvimLoadMapping(defMap);

end

--------------------------------------------------------------------------------------------
return _M.get();
