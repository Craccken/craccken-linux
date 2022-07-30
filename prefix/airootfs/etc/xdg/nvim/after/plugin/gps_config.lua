if not pcall(require, "nvim-gps") then -- Check if nvim not have gps plugin
    return -- Stop sourcing this file.
end -- End if-else statement

require("nvim-gps").setup({ -- Call setup function
	disable_icons = false,          -- Setting it to true will disable all icons
	icons = {
		["class-name"] = ' ',      -- Classes and class-like objects
		["function-name"] = ' ',   -- Functions
		["method-name"] = ' ',     -- Methods (functions inside class-like objects)
		["container-name"] = ' ',  -- Containers (example: lua tables)
		["tag-name"] = '炙'         -- Tags (example: html tags)
	},
	languages = { -- Add custom configuration per language or Disable the plugin for a language. Any language not disabled here is enabled by default
        -- ╭──────────────────────────────────────────────────────────────────────────────╮
        -- │                       Some languages have custom icons                       │
        -- ╰──────────────────────────────────────────────────────────────────────────────╯
		["json"] = {
			icons = {
				["array-name"] = ' ',
				["object-name"] = ' ',
				["null-name"] = '[] ',
				["boolean-name"] = 'ﰰﰴ ',
				["number-name"] = '# ',
				["string-name"] = ' '
			}
		},
		["latex"] = {
			icons = {
				["title-name"] = "# ",
				["label-name"] = " ",
			},
		},
		["norg"] = {
			icons = {
				["title-name"] = " ",
			},
		},
		["toml"] = {
			icons = {
				["table-name"] = ' ',
				["array-name"] = ' ',
				["boolean-name"] = 'ﰰﰴ ',
				["date-name"] = ' ',
				["date-time-name"] = ' ',
				["float-name"] = ' ',
				["inline-table-name"] = ' ',
				["integer-name"] = '# ',
				["string-name"] = ' ',
				["time-name"] = ' '
			}
		},
		["verilog"] = {
			icons = {
				["module-name"] = ' '
			}
		},
		["yaml"] = {
			icons = {
				["mapping-name"] = ' ',
				["sequence-name"] = ' ',
				["null-name"] = '[] ',
				["boolean-name"] = 'ﰰﰴ ',
				["integer-name"] = '# ',
				["float-name"] = ' ',
				["string-name"] = ' '
			}
		},
		["yang"] = {
			icons = {
				["module-name"] = " ",
				["augment-path"] = " ",
				["container-name"] = " ",
				["grouping-name"] = " ",
				["typedef-name"] = " ",
				["identity-name"] = " ",
				["list-name"] = "﬘ ",
				["leaf-list-name"] = " ",
				["leaf-name"] = " ",
				["action-name"] = " ",
			}
		},
        -- ╭──────────────────────────────────────────────────────────────────────────────╮
        -- │                       Disable for particular languages                       │
        -- ╰──────────────────────────────────────────────────────────────────────────────╯
        -- ["bash"] = false, -- disables nvim-gps for bash
        -- ["go"] = false,   -- disables nvim-gps for golang
        -- ╭──────────────────────────────────────────────────────────────────────────────╮
        -- │              Override default setting for particular languages               │
        -- ╰──────────────────────────────────────────────────────────────────────────────╯
		-- ["ruby"] = {
		--	separator = '|', -- Overrides default separator with '|'
		--	icons = {
		--		-- Default icons not specified in the lang config will fallback to the default value "container-name" will fallback to default because it's not set
		--		["function-name"] = '',    -- to ensure empty values, set an empty string
		--		["tag-name"] = ''
		--		["class-name"] = '::',
		--		["method-name"] = '#',
		--	}
		--}
	},
	separator = ' > ',
	depth = 0, -- limit for amount of context shown 0 means no limit
	depth_limit_indicator = ".." -- indicator used when context hits depth limit
})
