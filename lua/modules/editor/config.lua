local config = {};
local api = vim.api;

-- 相同单词添加下划线
function config.vim_cursorword()
    api.nvim_command("augroup user_plugin_cursorword");
    api.nvim_command("autocmd!");
    api.nvim_command("autocmd FileType NvimTree,lspagafinder,dashboard let b:cursorword = 0");
    api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0");
    api.nvim_command("autocmd InsertEnter * let b:cursorword = 0");
    api.nvim_command("autocmd InsertLeave * let b:cursorword = 1");
    api.nvim_command("augroup END");
end

-- 批量注释
function config.nvimComment()
    local hook = function()
        require("ts_context_commentstring.internal").update_commentstring();
    end
    return hook;
end

-- 语法高亮（加强版）
function config.nvim_treesitter()
    vim.api.nvim_command("set foldmethod=expr")
    vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")

    require"nvim-treesitter.configs".setup {
        ensure_installed = "maintained",
        highlight = {enable = true, disable = {"vim"}},
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner"
                }
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]["] = "@function.outer",
                    ["]m"] = "@class.outer"
                },
                goto_next_end = {
                    ["]]"] = "@function.outer",
                    ["]M"] = "@class.outer"
                },
                goto_previous_start = {
                    ["[["] = "@function.outer",
                    ["[m"] = "@class.outer"
                },
                goto_previous_end = {
                    ["[]"] = "@function.outer",
                    ["[M"] = "@class.outer"
                }
            }
        },
        rainbow = {
            enable = true,
            extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
            max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
        },
        context_commentstring = {enable = true, enable_autocmd = false},
        matchup = {enable = true},
        context = {enable = true, throttle = true}
    }
end

-- 简单的状态栏组件
function config.nvim_gps()
    require("nvim-gps").setup({
        icons = {
            ["class-name"] = " ", -- Classes and class-like objects
            ["function-name"] = " ", -- Functions
            ["method-name"] = " " -- Methods (functions inside class-like objects)
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
            ["rust"] = true
        },
        separator = " > "
    })
end

return config;
