{ ... }:

{
	programs.wofi = {
		enable = true;
		settings = {
			prompt = "";
			sort_order = "alphabetical";
			key_left = "h";
			key_down = "j";
			key_up = "k";
			key_right = "l";
		};
		style = ''
		'';
	};
}
