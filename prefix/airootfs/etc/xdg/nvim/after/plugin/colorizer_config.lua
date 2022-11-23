if not pcall(require, "colorizer") then -- Check if nvim not have nvim-colorizer plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("colorizer").setup({ -- Attach to certain filetypes.
    css = { css = true; };
    scss = { css = true; };
    html = { names = false; };
    'sh';
    'dosini';
    'cfg';
    'gitconfig';
    'conf';
    'bash';
    'toml';
    'lua';
    'vim';
    'qml';
    'javascript';
},{ -- Default options
    css = false;            -- Enable all CSS features: rgb_fn, hsl_fn, RGB, names, RRGGBB.
    RGB = true;             -- #RGB hex codes, example: #321, #123, #439
    names = true;           -- "Name" codes, example: Blue, Red, Green, White, Black
    RRGGBB = true;          -- #RRGGBB hex codes, example: #af0000, #00aff0, #011025
    RRGGBBAA = true;        -- #RRGGBBAA hex codes, example: #aff00095
    rgb_fn = false;         -- CSS rgb() and rgba() functions
    hsl_fn = false;         -- CSS hsl() and hsla() fucntions
    mode = 'background';    -- Set display mode, foreground ? background
})
