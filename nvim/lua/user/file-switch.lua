vim.api.nvim_create_user_command('Sw', function(opts)
    local root = vim.fn.expand('%:p:r')
    local ext  = opts.args
    if ext == '' then
        return
    end
    vim.cmd.edit(root .. '.' .. ext)
end, { nargs = 1 })
