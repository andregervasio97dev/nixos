{ ... }:

{
	environment = {
		variables = {
			EDITOR = "nvim";
			VISUAL = "nvim";
			TERMINAL = "kitty";
			TERM = "kitty";
			NIXOS_OZONE_WL = "1";
		};
		pathsToLink = [ "share/zsh" ];
	};
}
