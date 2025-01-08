{ ... }: 
{
	imports = [
		./browsers/browsers.nix
		./git/git.nix
		./gui/gui.nix
		./voip/voip.nix
		./dotfiles/dotfiles.nix
		./shells/shells.nix
		./notes/notes.nix
		./image-handling/image-handling.nix
	];

	nixpkgs = {
		config = {
			allowUnfree = true;
			allowUnfreePredicate = (_: true);
		};
	};
}

