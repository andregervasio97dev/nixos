{ pkgs, ... }:
{
	environment.systemPackages = [(
		pkgs.catppuccin-sddm.override {
			flavor = "mocha";
			font  = "0xProto";
			fontSize = "12";
			loginBackground = true;
		}
	)];
}
