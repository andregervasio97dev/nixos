{ ... }:

{
	imports = [
		../../modules/home-manager/hm-index.nix
	];
	home.username = "illyanda";
	home.homeDirectory = "/home/illyanda";
	home.stateVersion = "24.11";

	home.sessionVariables = {
		EDITOR = "nvim";
	};

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
