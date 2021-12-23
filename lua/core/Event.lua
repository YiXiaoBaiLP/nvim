local M = {};
local autoCmd = {};
local api = vim.api;

----------------------------------------------------------------------------------------------------

function autoCmd.nvimCreateAugroups(definitions)
    for groupName, definition in pairs(definitions)do
        api.nvim_command('augroup ' .. groupName);
        api.nvim_command('autocmd!');
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ');
            api.nvim_command(command);
        end
        api.nvim_command('augroup END');
    end
end

function autoCmd.loadAutoCmds()
    local definitions = {
        packer = {
            {"BufWritePost", "*.lua", "lua require('core.pack').auto_compile()"};
        },
        bufs = {
            -- Reload vim config automatically
            {"BufWritePost", [[$VIM_PATH/{*.vim, *.yaml, vimrc} nested source $MYVIMRC | redraw]]};
            -- Reload Vim script automatically if setlocal autoread
            {"BufWritePost, FileWritePost", "*.vim", [[nested if &l:autoread > 0 | source <afile> | echo 'source ' . bufname('%') | endif]]};
            {"BufWritePre","/tmp/*","setlocal noundofile"};
            {"BufWritePre","COMMIT_EDITMSG","setlocal noundofile"};
            {"BufWritePre","MERGE_MSG","setlocal noundofile"};
            {"BufWritePre","*.tmp","setlocal noundofile"};
            {"BufWritePre","*.bak","setlocal noundofile"};
            {"BufWritePre","*.tsx","lua vim.api.nvim_command('Format')"};
            {"BufWritePre","*.go","lua require('internal.golines').golines_format()"};
        };
        
        -- 窗口相关
        wins = {
            -- Highlight current line only on focused window
            {"WinEnter,BufEnter,InsertLeave", "*", [[if ! &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal cursorline | endif]]};
            {"WinLeave,BufLeave,InsertEnter", "*", [[if &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal nocursorline | endif]]};
            -- Equalize window dimensions when resizing vim window
            {"VimResized", "*", [[tabdo wincmd = ]]};
            -- Force write shada on leaving nvim
            {"VimLeave", "*", [[if has('nvim') | wshada! | else | wviminfo! | endif]]};
            -- Check if file changed when its window is focus, more eager than 'autoread'
            {"FocusGained", "* checktime"};
        };

        ft = {
            {"FileType", "dashboard", "set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2"};
            {"BufNewFile,BufRead", "*.toml", " setf toml"};
        };

        yank = {
            {"TextYankPost", [[* silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=400})]]};
        };
    }

    autoCmd.nvimCreateAugroups(definitions);
end

function M.get()
    autoCmd.loadAutoCmds();
end
----------------------------------------------------------------------------------------------------
return M.get()
