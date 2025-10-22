-- utils.lua
local M = {}

function M.list_snippets_for_current_filetype()
  local ft = vim.bo.filetype
  local snippets = require("luasnip").get_snippets(ft)

  -- Create a new scratch buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- Set buffer options using vim.bo[buf]
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].filetype = "snippet_list" -- Set a unique filetype

  -- Determine maximum trigger length for alignment
  local max_trigger_length = 0
  for _, snippet in pairs(snippets) do
    local trigger = snippet.trigger or ""
    if #trigger > max_trigger_length then
      max_trigger_length = #trigger
    end
  end

  -- Adjust max_trigger_length to add padding for readability
  max_trigger_length = max_trigger_length + 2

  -- Populate the buffer with a header and aligned snippet details
  local lines = {
    "Available snippets for filetype: " .. ft,
    "",
    string.format("%-" .. max_trigger_length .. "s | %s", "Snippet", "Description"),
    string.rep("-", max_trigger_length + 15), -- Underline for header
  }

  for _, snippet in pairs(snippets) do
    local trigger = snippet.trigger or "No trigger"
    local description = snippet.description

    -- Handle description being a table or nil
    if type(description) == "table" then
      description = table.concat(description, ", ")
    elseif type(description) ~= "string" then
      description = "No description"
    end

    -- Format each line with aligned descriptions
    local formatted_line = string.format("%-" .. max_trigger_length .. "s | %s", trigger, description)
    table.insert(lines, formatted_line)
  end

  -- Set lines in buffer and open it in a new split window
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_command "split"
  vim.api.nvim_win_set_buf(0, buf)
end

return M
