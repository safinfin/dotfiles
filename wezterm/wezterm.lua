local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local keybind = require 'keybinds'

-- font
config.font = wezterm.font ("UDEV Gothic NF", { weight="Regular", stretch="Normal", style="Normal" })
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.font_size = 10
else
  config.font_size = 14
end
config.freetype_load_target = "Light"
config.freetype_load_flags = "NO_HINTING"

-- prog
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  local launch_menu = {}
  config.default_prog = { "wsl.exe", "-d", "Ubuntu-22.04", "--cd", "~"}
  table.insert(launch_menu, { label = "PowerShell", args = { "pwsh.exe", "-NoLogo" } })
  config.launch_menu = launch_menu
end

config.color_scheme = 'Catppuccin Latte'
config.hide_tab_bar_if_only_one_tab = true
config.default_cursor_style = "BlinkingUnderline"
config.window_close_confirmation = 'AlwaysPrompt'
config.audible_bell = "Disabled"
config.enable_scroll_bar = true

-- keybinds
config.disable_default_key_bindings = true
config.keys = keybind.keys
config.key_tables = keybind.key_tables
config.leader = { key = "j", mods = "CTRL", timeout_milliseconds = 2000 }

return config
