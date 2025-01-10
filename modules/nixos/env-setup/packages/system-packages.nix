{ pkgs, ... }:

{
	environment = {
		systemPackages = with pkgs; [
			# Basic tools
			curl
			wget
			unzip
			gzip
			btop
			wayclip
			git
			# Terminal usage
			tree
			neovim
			zsh
			# Visual
			kitty-themes
			fastfetch
			# HEHEHEHEHE
			sl
			cowsay
			lolcat
			# Package managers
			cargo
			python313Packages.pip
			# Languages
			go
			rustc
			python313
			odin
			# Language server
			nil
			# Builders
			libgcc
		];
	};
}
