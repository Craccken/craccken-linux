vim.opt_local.iskeyword="@,48-57,_,192-255,#,-" -- Keywords are used in searching and recognizing with many commands: "w", "*", "[i", etc.
vim.cmd[[ syntax match sshknownhostspubkey "AAA[0-9a-zA-Z+/]\+[=]\{0,2}" ]] -- Set matching syntax with regex and store it to sshknownhostspubkey
vim.cmd[[ highlight link sshknownhostspubkey Special ]] -- Set highlight group for sshknownhostspubkey
vim.cmd[[ syntax keyword sshalg ssh-rsa ]] -- Set matching keyword and store it to sshalg
vim.cmd[[ highlight link sshalg Identifier ]] -- Set highlight group for sshalg
vim.cmd[[ syntax match sshknownhostsip "\<\(\d\{1,3}\.\)\{3}\d\{1,3}\>" ]] -- Set matching syntax with regex and store it to sshknownhostsip
vim.cmd[[ hi link sshknownhostsip Constant ]] -- Set highlight group for sshknownhostsip
