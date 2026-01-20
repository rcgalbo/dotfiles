-- Minimal Neovim config with Solarized Light theme
-- Basic settings
vim.cmd('syntax enable')
vim.opt.termguicolors = true
vim.opt.background = 'light'
vim.opt.number = true
vim.opt.cursorline = true

-- Set leader key to space
vim.g.mapleader = " "

-- File browser settings (netrw)
vim.g.netrw_banner = 0        -- Hide banner
vim.g.netrw_liststyle = 3     -- Tree view
vim.g.netrw_browse_split = 4  -- Open in previous window
vim.g.netrw_altv = 1          -- Open splits to the right
vim.g.netrw_winsize = 20      -- Width of directory explorer

-- Try to load Solarized, fall back to default if not available
local status_ok, _ = pcall(vim.cmd, 'colorscheme solarized')
if not status_ok then
  vim.notify('Solarized not found, using default')
  vim.cmd('colorscheme default')
end

-- Add key mappings for working with multiple files
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})  -- Move to left window
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})  -- Move to window below
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})  -- Move to window above
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})  -- Move to right window

-- File browser shortcut
vim.api.nvim_set_keymap('n', '<Leader>e', ':Lexplore<CR>', {noremap = true})  -- Toggle file explorer

-- Easy buffer navigation
vim.api.nvim_set_keymap('n', '<Leader>b', ':buffers<CR>', {noremap = true})  -- List buffers
vim.api.nvim_set_keymap('n', '<Leader>n', ':bnext<CR>', {noremap = true})    -- Next buffer
vim.api.nvim_set_keymap('n', '<Leader>p', ':bprev<CR>', {noremap = true})    -- Previous buffer
