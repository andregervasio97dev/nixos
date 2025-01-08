{ ... }: 
{
	imports = [
		./browsers/browsers.nix
		./git/git.nix
		./gui/gui.nix
		./voip/voip.nix
		./dotfiles/dotfiles.nix
		./shells/shells.nix
	];

	nixpkgs = {
		config = {
			allowUnfree = true;
			allowUnfreePredicate = (_: true);
		};
	};
}

