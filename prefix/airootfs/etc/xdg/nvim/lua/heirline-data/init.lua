local data = {
    mode_colors = { -- Create table to map the output of nvim_get_mode()
        n = { -- Normal
            gradient_1  = "#69E2C8",
            gradient_2  = "#66DDCB",
            gradient_3  = "#63D7CE",
            gradient_4  = "#60D2D1",
            gradient_5  = "#5DCDD4",
            gradient_6  = "#5AC7D6",
            gradient_7  = "#57C2D9",
            gradient_8  = "#54BDDC",
            gradient_9  = "#51B7DF",
            gradient_10 = "#4EB2E2",
        },
        i = { -- Insert
            gradient_1  = "#8DE9D5",
            gradient_2  = "#86E3D6",
            gradient_3  = "#7FDDD8",
            gradient_4  = "#78D7D9",
            gradient_5  = "#71D0DB",
            gradient_6  = "#6ACADC",
            gradient_7  = "#63C4DE",
            gradient_8  = "#5CBEDF",
            gradient_9  = "#55B8E1",
            gradient_10 = "#4EB2E2",
        },
        v = { -- Visual by character
            gradient_1  = "#D0F4DE",
            gradient_2  = "#CEF0E2",
            gradient_3  = "#CBECE5",
            gradient_4  = "#C9E8E9",
            gradient_5  = "#C7E4ED",
            gradient_6  = "#C4E0F0",
            gradient_7  = "#C2DCF4",
            gradient_8  = "#C0D8F8",
            gradient_9  = "#BDD4FB",
            gradient_10 = "#BBD0FF",
        },
        V = { -- Visual by line
            gradient_1  = "#FFAFCC",
            gradient_2  = "#F5A6CA",
            gradient_3  = "#EA9EC8",
            gradient_4  = "#E095C6",
            gradient_5  = "#D68DC3",
            gradient_6  = "#CB84C1",
            gradient_7  = "#C17CBF",
            gradient_8  = "#B673BD",
            gradient_9  = "#AC6ABB",
            gradient_10 = "#A262B9",
        },
        [""] = { -- Visual blockwise
            gradient_1  = "#BDE0FE",
            gradient_2  = "#B6D5F9",
            gradient_3  = "#AFCAF4",
            gradient_4  = "#A8BFF0",
            gradient_5  = "#A1B3EB",
            gradient_6  = "#9BA8E6",
            gradient_7  = "#949DE1",
            gradient_8  = "#8D92DC",
            gradient_9  = "#8687D8",
            gradient_10 = "#7F7CD3",
        },
        c = { -- Command-line editing
            gradient_1  = "#60EFFF",
            gradient_2  = "#56EBFE",
            gradient_3  = "#4CE6FE",
            gradient_4  = "#42E2FD",
            gradient_5  = "#38DEFC",
            gradient_6  = "#2FD9FC",
            gradient_7  = "#25D5FB",
            gradient_8  = "#1BD1FA",
            gradient_9  = "#11CCFA",
            gradient_10 = "#07C8F9",
        },
        s = { -- Select by character
            gradient_1  = "#BDE0FE",
            gradient_2  = "#B6D5F9",
            gradient_3  = "#AFCAF4",
            gradient_4  = "#A8BFF0",
            gradient_5  = "#A1B3EB",
            gradient_6  = "#9BA8E6",
            gradient_7  = "#949DE1",
            gradient_8  = "#8D92DC",
            gradient_9  = "#8687D8",
            gradient_10 = "#7F7CD3",
        },
        S = { -- Select by line
            gradient_1  = "#BDE0FE",
            gradient_2  = "#B6D5F9",
            gradient_3  = "#AFCAF4",
            gradient_4  = "#A8BFF0",
            gradient_5  = "#A1B3EB",
            gradient_6  = "#9BA8E6",
            gradient_7  = "#949DE1",
            gradient_8  = "#8D92DC",
            gradient_9  = "#8687D8",
            gradient_10 = "#7F7CD3",
        },
        [""]  = { -- Select blockwise
            gradient_1  = "#BDE0FE",
            gradient_2  = "#B6D5F9",
            gradient_3  = "#AFCAF4",
            gradient_4  = "#A8BFF0",
            gradient_5  = "#A1B3EB",
            gradient_6  = "#9BA8E6",
            gradient_7  = "#949DE1",
            gradient_8  = "#8D92DC",
            gradient_9  = "#8687D8",
            gradient_10 = "#7F7CD3",
        },
        R = { -- Replace
            gradient_1  = "#B429F9",
            gradient_2  = "#B830F3",
            gradient_3  = "#BB37EE",
            gradient_4  = "#BF3EE8",
            gradient_5  = "#C344E3",
            gradient_6  = "#C64BDD",
            gradient_7  = "#CA52D8",
            gradient_8  = "#CD59D2",
            gradient_9  = "#D160CC",
            gradient_10 = "#D567C7",
        },
        r = { -- Hit-enter prompt
            gradient_1  = "#69E2C8",
            gradient_2  = "#66DDCB",
            gradient_3  = "#63D7CE",
            gradient_4  = "#60D2D1",
            gradient_5  = "#5DCDD4",
            gradient_6  = "#5AC7D6",
            gradient_7  = "#57C2D9",
            gradient_8  = "#54BDDC",
            gradient_9  = "#51B7DF",
            gradient_10 = "#4EB2E2",
        },
        ["!"] = { -- Shell or external command is executing
            gradient_1  = "#B429F9",
            gradient_2  = "#AD31F9",
            gradient_3  = "#A539F8",
            gradient_4  = "#9E42F8",
            gradient_5  = "#964AF8",
            gradient_6  = "#8F52F7",
            gradient_7  = "#875AF7",
            gradient_8  = "#8062F7",
            gradient_9  = "#786BF6",
            gradient_10 = "#7173F6",
        },
        t = {  -- Terminal mode
            gradient_1  = "#B429F9",
            gradient_2  = "#AD31F9",
            gradient_3  = "#A539F8",
            gradient_4  = "#9E42F8",
            gradient_5  = "#964AF8",
            gradient_6  = "#8F52F7",
            gradient_7  = "#875AF7",
            gradient_8  = "#8062F7",
            gradient_9  = "#786BF6",
            gradient_10 = "#7173F6",
        },
        special = {  -- Special buffer
            gradient_1  = "#69E2C8",
            gradient_2  = "#66DDCB",
            gradient_3  = "#63D7CE",
            gradient_4  = "#60D2D1",
            gradient_5  = "#5DCDD4",
            gradient_6  = "#5AC7D6",
            gradient_7  = "#57C2D9",
            gradient_8  = "#54BDDC",
            gradient_9  = "#51B7DF",
            gradient_10 = "#4EB2E2",
        },
        terminal = {  -- Terminal buffer
            gradient_1  = "#B429F9",
            gradient_2  = "#AD31F9",
            gradient_3  = "#A539F8",
            gradient_4  = "#9E42F8",
            gradient_5  = "#964AF8",
            gradient_6  = "#8F52F7",
            gradient_7  = "#875AF7",
            gradient_8  = "#8062F7",
            gradient_9  = "#786BF6",
            gradient_10 = "#7173F6",
        },
    },
    mode_names = { -- Define dictionary to map the output of nvim_get_mode()
        n           = "▌",  -- Normal
        no          = "▌",  -- Operator-pending
        nov         = "▌",  -- Operator-pending (forced charwise o_v)
        noV         = "▌",  -- Operator-pending (forced linewise o_V)
        ["no"]    = "▌",  -- Operator-pending (forced blockwise o_CTRL-V)
        niI         = "▌",  -- Normal using i_CTRL-O in Insert-mode
        niR         = "▌",  -- Normal using i_CTRL-O in Replace-mode
        niV         = "▌",  -- Normal using i_CTRL-O in Virtual-Replace-mode
        nt          = "▌",  -- Normal in terminal-emulator (insert goes to Terminal mode)
        v           = "▌",  -- Visual by character
        vs          = "▌",  -- Visual by character using v_CTRL-O in Select mode
        V           = "▌",  -- Visual by line
        Vs          = "▌",  -- Visual by line using v_CTRL-O in Select mode
        [""]      = "▌",  -- Visual blockwise
        ["s"]     = "▌",  -- Visual blockwise using v_CTRL-O in Select mode
        s           = "▌",  -- Select by character
        S           = "▌",  -- Select by line
        [""]      = "▌",  -- Select blockwise
        i           = "▌",  -- Insert
        ic          = "▌",  -- Insert mode completion compl-generic
        ix          = "▌",  -- Insert mode i_CTRL-X completion
        R           = "▌",  -- Replace
        Rc          = "▌",  -- Replace mode completion compl-generic
        Rx          = "▌",  -- Replace mode i_CTRL-X completion
        Rv          = "▌",  -- Virtual Replace gR
        Rvc         = "▌",  -- Virtual Replace mode completion compl-generic
        Rvx         = "▌",  -- Virtual Replace mode i_CTRL-X completion
        c           = "▌",  -- Command-line editing
        cv          = "▌",  -- Vim Ex mode Q or gQ
        r           = "▌",  -- Hit-enter prompt
        rm          = "▌",  -- The -- more -- prompt
        ["r?"]      = "▌",  -- A :confirm query of some sort
        ["!"]       = "▌",  -- Shell or external command is executing
        t           = "▌",  -- Terminal mode: keys go to the job
    },
    scrollbar = { -- Set of string that will use in scrollbar
        '▁',
        '▂',
        '▃',
        '▄',
        '▅',
        '▆',
        '▇',
        '█',
    },
    priority = { -- The priority will determine the order at which multiple flexible components will be expanded or contracted:
        lowest      = 1,
        very_low    = 10,
        low         = 25,
        medium      = 50,
        high        = 75,
        very_high   = 90,
        highest     = 100,
    },
}
return data -- If this module loaded will return value of data(table)
