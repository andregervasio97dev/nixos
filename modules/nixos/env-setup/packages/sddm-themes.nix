{ pkgs, ... }:
{
	environment.systemPackages = [(
		pkgs.catppuccin-sddm.override {
			flavor = "Macchiato";
			font  = "0xProto";
			fontSize = "12";
			background = "/home/illyanda/Pictures/Ygg.jpg";
			loginBackground = true;
		}
	)];
}
