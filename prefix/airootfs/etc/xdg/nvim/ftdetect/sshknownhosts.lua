vim.api.nvim_create_autocmd({"BufRead","BufNewfile"}, {pattern = "known_hosts", command = "setfiletype sshknownhosts"}) -- Create autocommand that will detecting matching pattern and execute command
