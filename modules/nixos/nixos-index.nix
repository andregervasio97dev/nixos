{ ... }:

{
	imports = [
		./systemd/systemd.nix
		./env-setup/env-setup.nix
		./main-user/main-user.nix
		./gui/gui.nix
		./gaming/gaming.nix
	];
}
