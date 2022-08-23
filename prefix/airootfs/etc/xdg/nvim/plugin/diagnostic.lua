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
