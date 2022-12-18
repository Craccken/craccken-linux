local module = {} -- Create a table for storing function

module.force_quit_dialog = function() -- Create function and store it to module
    local choice = vim.fn.confirm("do you really want to force quit?", '&yes\n&no', 1) -- Ask the user with dialog
    if(choice == 1) then -- If choice is yes then:
        vim.cmd("quit!") -- Force Quit
    end -- End if-else statement
end -- End function statement

return module -- If this module loaded will return value of module(table)
