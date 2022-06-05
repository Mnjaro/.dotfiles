local utils_dir = "utilities"

return {
	-- Default Applications
	default = {
		-- Default terminal emulator
		terminal = "alacritty",
		-- Default text editor
		text_editor = "alacritty -e nvim",
		-- Default web browser
		web_browser = "firefox",
		-- Default bluetooth manager
		bluetooth_manager = "blueman-manager",
		-- Default rofi global menu
		app_launcher = "rofi -no-lazy-grab -show drun -modi drun -theme .config/rofi/rofi.rasi",
	},

	-- List of binaries/shell scripts that will execute for a certain task
	utils = {
		-- Fullscreen screenshot
		full_screenshot = utils_dir .. "screensht full",
		-- Area screenshot
		area_screenshot = utils_dir .. "screensht area",
		-- Color Picker
		color_picker = utils_dir .. "xcolor-pick",
	},
}
