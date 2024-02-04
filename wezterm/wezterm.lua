-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 18
config.line_height = 1.2
config.window_decorations = "TITLE|RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
	font = wezterm.font({ family = "FiraCode Nerd Font", weight = "Regular" }),
}
config.window_padding = {
	left = "0",
	right = "0",
	top = "0",
	bottom = "0",
}
config.tab_max_width = 32
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.unzoom_on_switch_pane = true
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 0.95

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Ocean (dark) (terminal.sexy)"

config.use_dead_keys = false
config.scrollback_lines = 5000

config.disable_default_key_bindings = true
config.native_macos_fullscreen_mode = true

config.keys = {
	{ key = "]", mods = "CTRL|SUPER", action = act.ActivateTabRelative(1) },
	{ key = "[", mods = "CTRL|SUPER", action = act.ActivateTabRelative(-1) },
	{ key = "{", mods = "CTRL|SUPER", action = act.MoveTabRelative(-1) },
	{ key = "}", mods = "CTRL|SUPER", action = act.MoveTabRelative(1) },
	{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
	{ key = "1", mods = "CTRL|SUPER", action = act.ActivateTab(0) },
	{ key = "2", mods = "CTRL|SUPER", action = act.ActivateTab(1) },
	{ key = "3", mods = "CTRL|SUPER", action = act.ActivateTab(2) },
	{ key = "4", mods = "CTRL|SUPER", action = act.ActivateTab(3) },
	{ key = "5", mods = "CTRL|SUPER", action = act.ActivateTab(4) },
	{ key = "6", mods = "CTRL|SUPER", action = act.ActivateTab(5) },
	{ key = "7", mods = "CTRL|SUPER", action = act.ActivateTab(6) },
	{ key = "8", mods = "CTRL|SUPER", action = act.ActivateTab(7) },
	{ key = "9", mods = "CTRL|SUPER", action = act.ActivateTab(8) },
	{ key = "v", mods = "CTRL|SUPER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "CTRL|SUPER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "s", mods = "CTRL|SUPER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "/", mods = "CTRL|SUPER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "SUPER", action = act.DecreaseFontSize },
	{ key = "=", mods = "SUPER", action = act.IncreaseFontSize },

	{ key = "k", mods = "CTRL|SUPER", action = act.ClearScrollback("ScrollbackOnly") },

	{ key = "f", mods = "SUPER", action = act.Search("CurrentSelectionOrEmptyString") },
	{ key = "!", mods = "SUPER", action = act.ShowDebugOverlay },
	-- { key = "m", mods = "SUPER", action = act.Hide },
	{ key = "p", mods = "SUPER", action = act.ActivateCommandPalette },
	{ key = "q", mods = "SUPER", action = act.QuitApplication },
	{ key = "r", mods = "SUPER", action = act.ReloadConfiguration },
	{ key = "t", mods = "SUPER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "t", mods = "CTRL|SUPER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "n", mods = "SUPER", action = act.SpawnWindow },
	{ key = "n", mods = "CTRL|SUPER", action = act.SpawnWindow },
	{ key = "w", mods = "SUPER", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "w", mods = "CTRL|SUPER", action = act.CloseCurrentTab({ confirm = true }) },
	{
		key = "u",
		mods = "CTRL|SUPER",
		action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
	},
	{ key = "x", mods = "CTRL|SUPER", action = act.ActivateCopyMode },
	{ key = "m", mods = "CTRL|SUPER", action = act.TogglePaneZoomState },

	{ key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },

	{ key = "y", mods = "CTRL|SUPER", action = act.QuickSelect },
	{ key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },

	{ key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },

	{ key = "h", mods = "CTRL|SUPER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CTRL|SUPER", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "CTRL|SUPER", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "CTRL|SUPER", action = act.ActivatePaneDirection("Down") },
	{ key = "LeftArrow", mods = "CTRL|SUPER", action = act.AdjustPaneSize({ "Left", 10 }) },
	{ key = "RightArrow", mods = "CTRL|SUPER", action = act.AdjustPaneSize({ "Right", 10 }) },
	{ key = "UpArrow", mods = "CTRL|SUPER", action = act.AdjustPaneSize({ "Up", 10 }) },
	{ key = "DownArrow", mods = "CTRL|SUPER", action = act.AdjustPaneSize({ "Down", 10 }) },
	{ key = "LeftArrow", mods = "CTRL|SHIFT|SUPER", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "RightArrow", mods = "CTRL|SHIFT|SUPER", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "UpArrow", mods = "CTRL|SHIFT|SUPER", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "DownArrow", mods = "CTRL|SHIFT|SUPER", action = act.AdjustPaneSize({ "Down", 1 }) },
	{ key = "c", mods = "CTRL|SUPER", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard") },
	{ key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard") },
	{
		key = "e",
		mods = "CTRL|SUPER",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

config.key_tables = {
	copy_mode = {
		{ key = "Tab", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
		{ key = "Tab", mods = "SHIFT", action = act.CopyMode("MoveBackwardWord") },
		{ key = "Enter", mods = "NONE", action = act.CopyMode("MoveToStartOfNextLine") },
		{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
		{ key = "Space", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
		{ key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
		{ key = "$", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
		{ key = ",", mods = "NONE", action = act.CopyMode("JumpReverse") },
		{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
		{ key = ";", mods = "NONE", action = act.CopyMode("JumpAgain") },
		{ key = "F", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
		{ key = "F", mods = "SHIFT", action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
		{ key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
		{ key = "G", mods = "SHIFT", action = act.CopyMode("MoveToScrollbackBottom") },
		{ key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
		{ key = "H", mods = "SHIFT", action = act.CopyMode("MoveToViewportTop") },
		{ key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },
		{ key = "L", mods = "SHIFT", action = act.CopyMode("MoveToViewportBottom") },
		{ key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
		{ key = "M", mods = "SHIFT", action = act.CopyMode("MoveToViewportMiddle") },
		{ key = "O", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
		{ key = "O", mods = "SHIFT", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
		{ key = "T", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = true } }) },
		{ key = "T", mods = "SHIFT", action = act.CopyMode({ JumpBackward = { prev_char = true } }) },
		{ key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
		{ key = "V", mods = "SHIFT", action = act.CopyMode({ SetSelectionMode = "Line" }) },
		{ key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },
		{ key = "^", mods = "SHIFT", action = act.CopyMode("MoveToStartOfLineContent") },
		{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
		{ key = "b", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
		{ key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
		{ key = "c", mods = "CTRL", action = act.CopyMode("Close") },
		{ key = "d", mods = "CTRL", action = act.CopyMode({ MoveByPage = 0.5 }) },
		{ key = "e", mods = "NONE", action = act.CopyMode("MoveForwardWordEnd") },
		{ key = "f", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = false } }) },
		{ key = "f", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
		{ key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },
		{ key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },
		{ key = "g", mods = "CTRL", action = act.CopyMode("Close") },
		{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
		{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
		{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
		{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
		{ key = "m", mods = "ALT", action = act.CopyMode("MoveToStartOfLineContent") },
		{ key = "o", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEnd") },
		{ key = "q", mods = "NONE", action = act.CopyMode("Close") },
		{ key = "t", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = true } }) },
		{ key = "u", mods = "CTRL", action = act.CopyMode({ MoveByPage = -0.5 }) },
		{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
		{ key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },
		{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
		{
			key = "y",
			mods = "NONE",
			action = act.Multiple({ { CopyTo = "ClipboardAndPrimarySelection" }, { CopyMode = "Close" } }),
		},
		{ key = "PageUp", mods = "NONE", action = act.CopyMode("PageUp") },
		{ key = "PageDown", mods = "NONE", action = act.CopyMode("PageDown") },
		{ key = "End", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
		{ key = "Home", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
		{ key = "LeftArrow", mods = "NONE", action = act.CopyMode("MoveLeft") },
		{ key = "LeftArrow", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
		{ key = "RightArrow", mods = "NONE", action = act.CopyMode("MoveRight") },
		{ key = "RightArrow", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
		{ key = "UpArrow", mods = "NONE", action = act.CopyMode("MoveUp") },
		{ key = "DownArrow", mods = "NONE", action = act.CopyMode("MoveDown") },
	},

	search_mode = {
		{ key = "Enter", mods = "NONE", action = act.CopyMode("PriorMatch") },
		{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
		{ key = "n", mods = "CTRL", action = act.CopyMode("NextMatch") },
		{ key = "p", mods = "CTRL", action = act.CopyMode("PriorMatch") },
		{ key = "r", mods = "CTRL", action = act.CopyMode("CycleMatchType") },
		{ key = "u", mods = "CTRL", action = act.CopyMode("ClearPattern") },
		{ key = "PageUp", mods = "NONE", action = act.CopyMode("PriorMatchPage") },
		{ key = "PageDown", mods = "NONE", action = act.CopyMode("NextMatchPage") },
		{ key = "UpArrow", mods = "NONE", action = act.CopyMode("PriorMatch") },
		{ key = "DownArrow", mods = "NONE", action = act.CopyMode("NextMatch") },
	},
}

-- and finally, return the configuration to wezterm
return config
