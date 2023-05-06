if not pcall(require, "luasnip") then -- Check if nvim not have luasnip plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("luasnip").config.setup({ -- Call setup function
    history = true,                 -- If true, Snippets that were exited can still be jumped back into. As Snippets are not removed when their text is deleted, they have to be removed manually via LuasnipUnlinkCurrent if delete_check_events is not enabled (set to eg. 'TextChanged').
    update_events = 'TextChanged,TextChangedI', -- Choose which events trigger an update of the active nodes' dependents. Default is just 'InsertLeave', 'TextChanged,TextChangedI' would update on every change.
    -- region_check_events = "",       -- Events on which to leave the current snippet if the cursor is outside its' 'region'. Disabled by default, 'CursorMoved', 'CursorHold' or 'InsertEnter' seem reasonable.
    -- delete_check_events = "TextChanged", -- When to check if the current snippet was deleted, and if so, remove it from the history. Off by default, 'TextChanged' (perhaps 'InsertLeave', to react to changes done in Insert mode) should work just fine (alternatively, this can also be mapped using <Plug>luasnip-delete-check).
    -- store_selection_keys = "",      -- Mapping for populating TM_SELECTED_TEXT and related variables (not set by default).
    enable_autosnippets = true,     -- Autosnippets are disabled by default to minimize performance penalty if unused. Set to true to enable.
    ext_opts = {                    -- Additional options passed to extmarks. Can be used to add passive/active highlight on a per-node-basis (more info in DOC.md)
        [require("luasnip.util.types").choiceNode] = {
            active = {
                virt_text = { { "●", "Statement" } },
            },
        },
        [require("luasnip.util.types").insertNode] = {
			active = {
				virt_text = { { "●", "Identifier" } }
			},
        },
    },
    -- parser_nested_assembler = "",   -- Override the default behaviour of inserting a choiceNode containing the nested snippet and an empty insertNode for nested placeholders ("${1: ${2: this is nested}}"). For an example (behaviour more similar to vscode), check here
    -- ft_func = "",                   -- Source of possible filetypes for snippets. Defaults to a function, which returns vim.split(vim.bo.filetype, ".", true), but check filetype_functions for other options
    -- snip_env = "",                  -- The global environment will be extended with this table in some places, eg. in files loaded by the lua-loader. Setting snip_env to { some_global = "a value" } will add the global variable some_global while evaluating these files. If you mind the (probably) large number of generated warnings, consider adding the keys set here to the globals recognized by lua-language-server or add ---@diagnostic disable: undefined-global somewhere in the affected files.
})
require("luasnip.loaders.from_vscode").lazy_load() -- To use existing vs-code style snippets from a plugin (eg. rafamadriz/friendly-snippets

vim.keymap.set("i", "<c-l>", function() -- Create function
    if require("luasnip").choice_active() then -- Check if snippet is a choice list then:
        require("luasnip").change_choice(1) -- Change to the next choice
    end -- End if-else statement
end) -- End function statement
