vim.diagnostic.config({ -- Configure diagnostic options globally or for a specific diagnostic namespace.
    underline = true, -- Use underline for diagnostics.
    signs = true, -- Use signs for diagnostics.
    update_in_insert = false, -- Update diagnostics in Insert mode (if false, diagnostics are updated on InsertLeave)
    severity_sort = true, -- Sort diagnostics by severity.
})

local diagnostic_signs = { -- Create list of icon and severity as key
    Error = "",
    Warn = "",
    Info = "",
    Hint = "",
}
for type, icon in pairs(diagnostic_signs) do -- Create for loop with diagnostic_signs as type and icon
    local highlight = "DiagnosticSign" .. type -- Declare variable to store highlight
    vim.fn.sign_define(highlight, { text = icon, texthl = highlight, numhl = ""}) -- Set diagnostic icon
end

vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc = 'Move to the next diagnostic'})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc = 'Move to the previous diagnostic in the current buffer'})
