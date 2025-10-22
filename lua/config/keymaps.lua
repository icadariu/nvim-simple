vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { desc = 'Exit from insert mode', noremap = true })

local vkms = vim.keymap.set
local silent = { silent = true }

-- simple toggles to replace missing globals
_G.ToggleCursorColumn = function() vim.wo.cursorcolumn = not vim.wo.cursorcolumn end
_G.ToggleMouse = function() vim.o.mouse = (vim.o.mouse == '' and 'a' or '') end
_G.toggle_spell_check = function() vim.wo.spell = not vim.wo.spell end

vkms('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })
vkms('n', '<leader>qq', '<cmd>bp|bd #<CR>', { desc = 'Close Buffer; Retain Split' })
vkms('n', '<leader>cf', '<cmd>let @+ = expand("%")<CR>', { desc = 'Copy File Name' })
vkms('n', '<leader>cp', '<cmd>let @+ = expand("%:p")<CR>', { desc = 'Copy File Path' })
vkms('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Open Lazy' })
vkms('n', '<leader>QQ', '<cmd>qa!<cr>', { desc = 'Quit All' })
vkms('n', '<leader>qb', '<cmd>bd!<CR>', { desc = 'Force Close Buffer' })
vkms('n', '<leader>uI', '<cmd>InspectTree<cr>', { desc = 'Inspect Tree' })
vkms('n', '<leader>ui', vim.show_pos, { desc = 'Inspect current Position using Treesitter position' })
vkms('x', '<leader>p', [["_dP]], { desc = 'Paste without overwriting register' })
vkms('n', '<leader>Y', [["+Y]], { desc = 'Yank entire line to system clipboard' })
vkms('n', '<leader>tt', ':tab split<CR>', { desc = 'Send current buffer to a new tab' })

vkms('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', { desc = 'Buffer 1', noremap = true, silent = true })
vkms('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', { desc = 'Buffer 2', noremap = true, silent = true })
vkms('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', { desc = 'Buffer 3', noremap = true, silent = true })
vkms('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', { desc = 'Buffer 4', noremap = true, silent = true })
vkms('n', '<leader>0', '<Cmd>BufferLineGoToBuffer -1<CR>', { desc = 'Last buffer', noremap = true, silent = true })
vkms('n', '<leader>x', ':bd<CR>', { desc = 'Close current buffer', noremap = true, silent = true })
vkms({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to clipboard' })
vkms({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete to blackhole' })

-- Spell helpers (moved off <Tab>s…)
vkms('n', '<leader>sa', 'zg', { desc = 'Spell add' })
vkms('n', '<leader>ss', 'z=', { desc = 'Spell suggest' })
vkms('n', '<leader>sf', '1z=', { desc = 'Spell first' })
vkms('n', '<leader>sn', ']s', { desc = 'Spell next' })
vkms('n', '<leader>sp', '[s', { desc = 'Spell prev' })

-- remove Marks* bindings unless you add a marks plugin
vkms('n', '<Tab>x', '<cmd>.lua<CR>', { desc = 'Execute current line' })
vkms('n', '<Tab><Tab>x', '<cmd>source %<CR>', { desc = 'Execute current file' })
vkms('n', '<Tab>tc', _G.ToggleCursorColumn, { desc = 'Toggle Cursor Column' })
vkms('n', '<Tab>tm', _G.ToggleMouse, { desc = 'Toggle Mouse' })
vkms('n', '<Tab>ts', _G.toggle_spell_check, { desc = 'Toggle spell' })

-- Ctrl/navigation
vkms('n', '<C-d>', '<C-d>zz', { desc = 'Half-page down centered' })
vkms('n', '<C-u>', '<C-u>zz', { desc = 'Half-page up centered' })
vkms('n', '<C-n>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer', noremap = true, silent = true })
vkms('n', '<C-p>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Prev buffer', noremap = true, silent = true })
vkms('n', '<C-h>', '<C-w><C-h>', { desc = 'Left window' })
vkms('n', '<C-l>', '<C-w><C-l>', { desc = 'Right window' })
vkms('n', '<C-j>', '<C-w><C-j>', { desc = 'Lower window' })
vkms('n', '<C-k>', '<C-w><C-k>', { desc = 'Upper window' })
vkms({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- Visual mode
vkms('v', '<', '<gv', { desc = 'Indent left keep' })
vkms('v', '>', '>gv', { desc = 'Indent right keep' })
vkms('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move block down' })
vkms('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move block up' })
vkms('v', '//', 'y/<C-R>"<CR>', { desc = 'Search selection' })

-- Splits resize
vkms('n', '<A-Left>', '<c-w>5>', { desc = 'Resize left' })
vkms('n', '<A-Right>', '<c-w>5<', { desc = 'Resize right' })
vkms('n', '<A-Up>', '<C-W>+', { desc = 'Resize up' })
vkms('n', '<A-Down>', '<C-W>-', { desc = 'Resize down' })

vkms('i', '<A-h>', '<Left>', { desc = 'Left', noremap = true, silent = true })
vkms('i', '<A-l>', '<Right>', { desc = 'Right', noremap = true, silent = true })
vkms('n', '[q', vim.cmd.cprev, { desc = 'Prev quickfix' })
vkms('n', ']q', vim.cmd.cnext, { desc = 'Next quickfix' })
vkms('n', '==', 'ggVG', { desc = 'Select whole file' })
vkms('n', 'J', 'mzJ`z', { desc = 'Join keep pos' })
vkms('n', 'n', 'nzzzv', { desc = 'Next match centered' })
vkms('n', 'N', 'Nzzzv', { desc = 'Prev match centered' })
vkms({ 'n', 'i' }, '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vkms({ 'n', 'i' }, '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vkms({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
vkms({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- Disable keys
vkms('n', 'Q', '<nop>', { desc = 'Disable Q' })
vkms('n', 's', '<nop>', { desc = 'Disable s', noremap = true })

-- Diagnostics
vkms('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line diagnostics' })
vkms('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostics to loclist' })
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function() go({ severity = severity }) end
end
vkms('n', ']d', diagnostic_goto(true), { desc = 'Next diagnostic' })
vkms('n', '[d', diagnostic_goto(false), { desc = 'Prev diagnostic' })
vkms('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next error' })
vkms('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev error' })
vkms('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next warning' })
vkms('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev warning' })

-- telescope
vkms('n', '<leader>ff', function() require('telescope.builtin').find_files() end, silent)
vkms('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, silent)
vkms('n', '<leader>fb', function() require('telescope.builtin').buffers() end, silent)
vkms('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, silent)
