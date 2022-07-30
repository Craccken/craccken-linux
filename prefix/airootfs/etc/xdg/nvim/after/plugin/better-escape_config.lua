if not pcall(require, "better_escape") then -- Check if nvim not have better_escape plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("better_escape").setup{ -- Call setup function
    mapping = {"jk"}, -- a table with mappings to use
    timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    clear_empty_lines = false, -- clear line after escaping if there is only whitespace
    keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
}
