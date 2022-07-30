if not pcall(require, "nvim-lastplace") then -- Check if nvim has nvim-lastplace plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require'nvim-lastplace'.setup { -- Call setup function
    lastplace_ignore_buftype = {"quickfix", "nofile", "help", "man"},
    lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit", "alpha"},
    lastplace_open_folds = true
}
