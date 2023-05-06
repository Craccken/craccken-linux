if not pcall(require, "tabout") then -- Check if nvim has tabout plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require('tabout').setup { -- Call setup function
    tabkey = '<Tab>', -- Set the key to trigger tabout, set to an empty string to disable
    backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
    act_as_tab = true, -- shift content if tab out is not possible
    act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
    default_shift_tab = '<C-d>', -- reverse shift default action,
    enable_backwards = true, -- Disable if you just want to move forward
    completion = true, -- if the tabkey is used in a completion pum
    tabouts = { -- Here you can add more symbols you want to tab out from.
        {open = "'", close = "'"},
        {open = '"', close = '"'},
        {open = '`', close = '`'},
        {open = '(', close = ')'},
        {open = '[', close = ']'},
        {open = '{', close = '}'}
    },
    ignore_beginning = true, -- If set to true you can also tab out from the beginning of a string, object property, etc.
    exclude = {} -- tabout will ignore these filetypes
}
