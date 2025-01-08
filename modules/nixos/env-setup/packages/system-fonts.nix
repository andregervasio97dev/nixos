{ pkgs, ... }:

{
	fonts.packages = with pkgs; [
		nerd-fonts._0xproto
		noto-fonts-emoji
		powerline-fonts
	];
}
