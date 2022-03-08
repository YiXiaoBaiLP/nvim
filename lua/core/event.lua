local M = {};
local api = vim.api;
---------------------------------------------------------------------------------------------

function M.nvimCreateAugroups(definitions)
    for groupName, definition in pairs(definitions) do
        api.nvim_command('augroup ' .. groupName);
        api.nvim_command('autocmd!');
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ');
            api.nvim_command(command);
        end
        api.nvim_command('augroup END');
    end
end

function M.loadAutoCmds()
    --[=[
            BufWritePost：把整个缓冲区写回文件后
            BufWritePre或BufWrite：把整个缓冲区写回文件前
            BufWriteCmd：把整个缓冲区写回到文件前。应执行把文件写回的操作并在成功后复位 'modified' 标志，   除非 'cpo'里包含了 '+' 并且写到另一个文件里 |cpo-+|。它不应改动缓冲区的内容。
    --]=]
    local definitions = {
        packer = {
           -- {"BufWritePost", "*.lua", "lua require('core.Pack').autoCompile()"},
        },
        bufs = {
            -- Reload vim config automatically
            {
             "BufWritePost", [[$VIM_PATH/{*.vim,*.yaml,vimrc} nested source $MYVIMRC | redraw]]
            },
            -- Reload Vim script automatically if setlocal autoread
            {"BufWritePost, FileWritePost", "*.vim", [[nested if &l:autoread > 0 | source <afile> | echo 'source ' . bufname('%') | endif]]},
            {"BufWritePre","/tmp/*","setlocal noundofile"},
            {"BufWritePre","COMMIT_EDITMSG","setlocal noundofile"},
            {"BufWritePre","MERGE_MSG","setlocal noundofile"},
            {"BufWritePre","*.tmp","setlocal noundofile"},
            {"BufWritePre","*.bak","setlocal noundofile"},
            {"BufWritePre","*.tsx","lua vim.api.nvim_command('Format')"},
            {"BufWritePre","*.go","lua require('internal.golines').golines_format()"},
        },

        -- 窗口相关
        wins = {
            -- Highlight current line only on focused window
            {"WinEnter,BufEnter,InsertLeave", "*", [[if ! &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal cursorline | endif]]},
            {"WinLeave,BufLeave,InsertEnter", "*", [[if &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal nocursorline | endif]]},
            -- Equalize window dimensions when resizing vim window
            {"VimResized", "*", [[tabdo wincmd = ]]},
            -- Force write shada on leaving nvim
            {"VimLeave", "*", [[if has('nvim') | wshada! | else | wviminfo! | endif]]},
            -- Check if file changed when its window is focus, more eager than 'autoread'
            {"FocusGained", "* checktime"},
        };
        -- 文件相关
        ft = {
            {"FileType", "dashboard", "set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2"},
            {"BufNewFile,BufRead", "*.toml", " setf toml"},
        },

        yank = {
            {"TextYankPost", [[* silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=400})]]},
        },
    }
    M.nvimCreateAugroups(definitions);
end

---------------------------------------------------------------------------------------------
return M;
