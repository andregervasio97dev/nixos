
{ ... }:

{
	programs.kitty = {
		enable = true;
		font = {
			name = "0xproto Nerd Font";
			size = 12;
		};
		shellIntegration.enableZshIntegration = true;
		themeFile = "Tropical_Neon";
		settings = {
			confirm_os_window_close = 0;
			enable_audio_bell = false;
			show_hyperlink_targets = true;
		};
	};
}
