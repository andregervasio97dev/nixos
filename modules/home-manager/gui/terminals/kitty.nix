
{ ... }:

{
	programs.kitty = {
		enable = true;
		font = {
			name = "0xproto Nerd Font";
			size = 12;
		};
		shellIntegration.enableZshIntegration = true;
		themeFile = "Catppuccin-Macchiato";
		settings = {
			confirm_os_window_close = 0;
		};
	};
}
