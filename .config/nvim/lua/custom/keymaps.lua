---- Keymaps ----

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- ctrl+d and ctrl+u for navigating up and down half a page + zz for recentering
map('n', '<C-d>', '<C-d>zz', default_opts)
map('n', '<C-u>', '<C-u>zz', default_opts)

-- telescope config
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string { search = vim.fn.input 'Grep > ' }
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

-- Insert mode mappings for <TAB> and <S-TAB> with completion popup visibility check
map('i', '<TAB>', 'pumvisible() ? "<C-n>" : "<TAB>"', { noremap = true, expr = true, silent = true })
map('i', '<S-TAB>', 'pumvisible() ? "<C-p>" : "<TAB>"', { noremap = true, expr = true, silent = true })

-- Select all content with ctrl+a
map('n', '<C-a>', 'ggVG', default_opts)

-- ctrl + / to comment
map('i', '<C-/>', '<Esc><Plug>CommentaryLineA', default_opts)
map('n', '<C-/>', '<Plug>CommentaryLine', default_opts)
