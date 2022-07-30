if not pcall(require, "nvim-navic") then -- Check if nvim not have navic plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("nvim-navic").setup { -- Call setup function
    icons = { -- Indicate the type of symbol captured.
        File          = " ",
        Module        = " ",
        Namespace     = " ",
        Package       = " ",
        Class         = " ",
        Method        = " ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "練",
        Interface     = "練",
        Function      = " ",
        Variable      = " ",
        Constant      = " ",
        String        = " ",
        Number        = " ",
        Boolean       = "◩ ",
        Array         = " ",
        Object        = " ",
        Key           = " ",
        Null          = "ﳠ ",
        EnumMember    = " ",
        Struct        = " ",
        Event         = " ",
        Operator      = " ",
        TypeParameter = " ",
    },
    separator = " > ", -- Separator between code context
    highlight = false, -- If set to true, will add colors to icons and text as defined by highlight groups
    depth_limit = 7, -- Maximum depth of context to be shown. If the context hits this depth limit, it is truncated.
    depth_limit_indicator = "…", -- Icon to indicate that depth_limit was hit and the shown context is truncated.
}
