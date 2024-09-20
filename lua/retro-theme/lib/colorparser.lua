local config = require("retro-theme").config

local M = {}

local has_no_gui = vim.fn.has("gui") == 0

local function is_valid_key(key)
  return key == "fg" or key == "bg" or key == "sp" or key == "gui" or key == "blend" or key == "italic" or key == "bold"
end

local is_valid_color_table = function(color)
  return type(color) == "table" and color.hex ~= nil
end

local is_embedded_table = function(color)
  return type(color) == "table" and color.hex == nil
end

local merge_groups = function(group_def_table, group_def_table_value)
  for key, value in pairs(group_def_table_value) do
    if group_def_table[key] == nil then
      group_def_table[key] = value
    end
  end
end

M.parse = function(colors)
  for _, group_def_table in pairs(colors) do
    if type(group_def_table) ~= "table" then
      vim.print("Invalid group definition: " .. vim.inspect(group_def_table))
      return
    end
    for group_def_table_key, group_def_table_value in pairs(group_def_table) do
      if is_embedded_table(group_def_table_value) then
        merge_groups(group_def_table, group_def_table_value)
      end
      if is_valid_key(group_def_table_key) == false then
        group_def_table[group_def_table_key] = nil
      end
    end
  end

  for _, group_def_table in pairs(colors) do
    for group_def_table_key, group_def_table_value in pairs(group_def_table) do
      if group_def_table_key == "gui" and has_no_gui then
        group_def_table[group_def_table_key] = nil
      else
        if is_valid_color_table(group_def_table_value) then
          group_def_table[group_def_table_key] = group_def_table_value.hex
        else
          group_def_table[group_def_table_key] = group_def_table_value
        end
      end
    end
  end
end

return M
