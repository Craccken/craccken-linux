if not pcall(require, "impatient") then -- Check if nvim has impatient plugin
    return -- Stop sourcing this file.
end -- End if-else statement
require('impatient').enable_profile()
