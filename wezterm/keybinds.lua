local wezterm = require 'wezterm'
local act = wezterm.action

return {
  keys = {
    { key = '!', mods = 'CTRL|SHIFT', action = act.ActivateTab(0) },
    { key = '1', mods = 'SUPER', action = act.ActivateTab(0) },
    { key = '@', mods = 'CTRL|SHIFT', action = act.ActivateTab(1) },
    { key = '2', mods = 'SUPER', action = act.ActivateTab(1) },
    { key = '#', mods = 'CTRL|SHIFT', action = act.ActivateTab(2) },
    { key = '3', mods = 'SUPER', action = act.ActivateTab(2) },
    { key = '$', mods = 'CTRL|SHIFT', action = act.ActivateTab(3) },
    { key = '4', mods = 'SUPER', action = act.ActivateTab(3) },
    { key = '%', mods = 'CTRL|SHIFT', action = act.ActivateTab(4) },
    { key = '5', mods = 'SUPER', action = act.ActivateTab(4) },
    { key = '^', mods = 'CTRL|SHIFT', action = act.ActivateTab(5) },
    { key = '6', mods = 'SUPER', action = act.ActivateTab(5) },
    { key = '&', mods = 'CTRL|SHIFT', action = act.ActivateTab(6) },
    { key = '7', mods = 'SUPER', action = act.ActivateTab(6) },
    { key = '*', mods = 'CTRL|SHIFT', action = act.ActivateTab(7) },
    { key = '8', mods = 'SUPER', action = act.ActivateTab(7) },
    { key = '(', mods = 'CTRL|SHIFT', action = act.ActivateTab(-1) },
    { key = '9', mods = 'SUPER', action = act.ActivateTab(-1) },
    { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
    { key = 'l', mods = 'LEADER|CTRL', action = act.ActivateTabRelative(1) },
    { key = 'Tab', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
    { key = 'h', mods = 'LEADER|CTRL', action = act.ActivateTabRelative(-1) },
    { key = 'T', mods = 'CTRL|SHIFT', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'T', mods = 'SUPER|SHIFT', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'c', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'W', mods = 'CTRL|SHIFT', action = act.CloseCurrentTab{ confirm = true } },
    { key = 'W', mods = 'SUPER|SHIFT', action = act.CloseCurrentTab{ confirm = true } },
    { key = '&', mods = 'LEADER|SHIFT', action = act.CloseCurrentTab{ confirm = true } },
    { key = '\\', mods = 'LEADER', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
    { key = '-', mods = 'LEADER', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
    { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
    { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
    { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
    { key = 'H', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize{ 'Left', 1 } },
    { key = 'L', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize{ 'Right', 1 } },
    { key = 'K', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize{ 'Up', 1 } },
    { key = 'J', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize{ 'Down', 1 } },
    { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane{ confirm = true } },
    { key = 'Enter', mods = 'ALT', action = act.ToggleFullScreen },
    { key = '+', mods = 'CTRL|SHIFT', action = act.IncreaseFontSize },
    { key = '+', mods = 'SUPER|SHIFT', action = act.IncreaseFontSize },
    { key = '_', mods = 'CTRL|SHIFT', action = act.DecreaseFontSize },
    { key = '_', mods = 'SUPER|SHIFT', action = act.DecreaseFontSize },
    { key = ')', mods = 'CTRL|SHIFT', action = act.ResetFontSize },
    { key = ')', mods = 'SUPER|SHIFT', action = act.ResetFontSize },
    { key = 'L', mods = 'CTRL|SHIFT', action = act.ShowDebugOverlay },
    { key = 'L', mods = 'SUPER|SHIFT', action = act.ShowDebugOverlay },
    { key = 'N', mods = 'CTRL|SHIFT', action = act.SpawnWindow },
    { key = 'N', mods = 'SUPER|SHIFT', action = act.SpawnWindow },
    { key = 'P', mods = 'CTRL|ALT|SHIFT', action = act.ActivateCommandPalette },
    { key = 'Q', mods = 'CTRL|SHIFT', action = act.QuitApplication },
    { key = 'Q', mods = 'SUPER|SHIFT', action = act.QuitApplication },
    { key = 'R', mods = 'CTRL|SHIFT', action = act.ReloadConfiguration },
    { key = 'R', mods = 'SUPER|SHIFT', action = act.ReloadConfiguration },
    { key = 'Z', mods = 'CTRL|SHIFT', action = act.TogglePaneZoomState },
    { key = '[', mods = 'LEADER', action = act.ActivateCopyMode },
    { key = 'C', mods = 'SUPER|SHIFT', action = act.CopyTo 'Clipboard' },
    { key = 'C', mods = 'CTRL|SHIFT', action = act.CopyTo 'Clipboard' },
    { key = 'P', mods = 'SUPER|SHIFT', action = act.PasteFrom 'Clipboard' },
    { key = 'P', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },
    { key = 'F', mods = 'CTRL|SHIFT', action = act.Search 'CurrentSelectionOrEmptyString' },
    { key = 'F', mods = 'SUPER|SHIFT', action = act.Search 'CurrentSelectionOrEmptyString' },
    { key = 'K', mods = 'CTRL|SHIFT', action = act.ClearScrollback 'ScrollbackOnly' },
    { key = 'K', mods = 'SUPER|SHIFT', action = act.ClearScrollback 'ScrollbackOnly' },
    { key = 'U', mods = 'CTRL|SHIFT', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
    { key = 'phys:Space', mods = 'CTRL|SHIFT', action = act.QuickSelect },
  },

  key_tables = {
    copy_mode = {
      { key = 'Tab', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
      { key = 'Tab', mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'Enter', mods = 'NONE', action = act.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { CopyMode =  'Close' } } },
      { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 'Space', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
      { key = '$', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
      { key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
      { key = ',', mods = 'NONE', action = act.CopyMode 'JumpReverse' },
      { key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
      { key = ';', mods = 'NONE', action = act.CopyMode 'JumpAgain' },
      { key = 'F', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
      { key = 'F', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
      { key = 'G', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackBottom' },
      { key = 'G', mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
      { key = 'H', mods = 'NONE', action = act.CopyMode 'MoveToViewportTop' },
      { key = 'H', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
      { key = 'L', mods = 'NONE', action = act.CopyMode 'MoveToViewportBottom' },
      { key = 'L', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
      { key = 'M', mods = 'NONE', action = act.CopyMode 'MoveToViewportMiddle' },
      { key = 'M', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
      { key = 'O', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
      { key = 'O', mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
      { key = 'T', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
      { key = 'T', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
      { key = 'V', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Line' } },
      { key = 'V', mods = 'SHIFT', action = act.CopyMode{ SetSelectionMode =  'Line' } },
      { key = '^', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLineContent' },
      { key = '^', mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
      { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'b', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'b', mods = 'CTRL', action = act.CopyMode 'PageUp' },
      { key = 'c', mods = 'CTRL', action = act.CopyMode 'Close' },
      { key = 'd', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (0.5) } },
      { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWordEnd' },
      { key = 'f', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = false } } },
      { key = 'f', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
      { key = 'f', mods = 'CTRL', action = act.CopyMode 'PageDown' },
      { key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
      { key = 'g', mods = 'CTRL', action = act.CopyMode 'Close' },
      { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
      { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
      { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
      { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
      { key = 'm', mods = 'ALT', action = act.CopyMode 'MoveToStartOfLineContent' },
      { key = 'o', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEnd' },
      { key = 'q', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 't', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = true } } },
      { key = 'u', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (-0.5) } },
      { key = 'v', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
      { key = 'v', mods = 'CTRL', action = act.CopyMode{ SetSelectionMode =  'Block' } },
      { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
      { key = 'y', mods = 'NONE', action = act.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { CopyMode =  'Close' } } },
      { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PageUp' },
      { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'PageDown' },
      { key = 'End', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
      { key = 'Home', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
      { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
      { key = 'LeftArrow', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
      { key = 'RightArrow', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
      { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
      { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
    },

    search_mode = {
      { key = 'Enter', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
      { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
      { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
      { key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
      { key = 'u', mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
      { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
      { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
      { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
      { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
    },

  }
}
