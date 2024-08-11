---- Custom Commands ----

-- Open custom keymaps file with :Keymaps
vim.api.nvim_create_user_command('Keymaps', 'edit ~/.config/nvim/lua/custom/keymaps.lua', {})

-- Open init.lua with :Keymaps
vim.api.nvim_create_user_command('Vimrc', 'edit ' .. vim.env.MYVIMRC, {})

-- Open custom commands file with :Commands
vim.api.nvim_create_user_command('Commands', 'edit ~/.config/nvim/lua/custom/commands.lua', {})
