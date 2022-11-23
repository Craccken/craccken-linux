"   ███╗   ██╗██╗   ██╗██╗███╗   ███╗
"   ████╗  ██║██║   ██║██║████╗ ████║
"   ██╔██╗ ██║██║   ██║██║██╔████╔██║
"   ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
"   ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
"   ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
syntax enable        " Enable syntax highlighting 
colorscheme craccken " Load color scheme craccken
" colorscheme ayu-dark
lua << LUA
    -- require('impatient')
    require("plugin_manager") -- Load module (import)
LUA
