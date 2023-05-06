if not pcall(require, "nvim-startup") then -- Check if nvim has nvim-startup plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require('nvim-startup').setup { -- Call setup function
    startup_file = '/tmp/nvim-startuptime', -- sets startup log path (string)
    message = function(time) -- function-based custom message
        return time < 1000 and 'Just {}? ZAMMNNN!' or 'BLOATEDDD!!!' -- Return string
    end -- End function
}
