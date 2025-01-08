{ ... }:

{
	imports = [
		./env-variables/env-variables.nix
		./packages/system-packages.nix
		./packages/system-programs.nix
		./packages/system-fonts.nix
	];
}
