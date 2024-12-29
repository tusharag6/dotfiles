local wezterm = require("wezterm")
local commands = require("commands")
local constants = require("constants")

local config = wezterm.config_builder()

config.default_domain = 'WSL:Debian'

-- Font settings
--config.font_size = 19
config.line_height = 1.2
config.font = wezterm.font("JetBrains Mono")

-- Colors
config.colors = {
	cursor_bg = "white",
	cursor_border = "white",
	indexed = { [239] = "lightslategrey" },
}

-- Appearance
-- config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 15,
	bottom = 0,
}
config.window_background_image = constants.bg_image
config.win32_system_backdrop = 'Acrylic'

-- Custom commands
wezterm.on("augment-command-palette", function()
	return commands
end)

return config
