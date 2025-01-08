{ pkgs, ... }:

{
	environment = {
		systemPackages = with pkgs; [
			tree
			curl
			git
			unzip
			neovim
			wget
			kitty-themes
			zsh
			fastfetch
			btop
			wayclip
			cargo
			go
			libgcc
			rustc
			python313
			python313Packages.pip
			nil
			kdePackages.xwaylandvideobridge
			cowsay
			lolcat
		];
		variables = {
			EDITOR = "nvim";
			VISUAL = "nvim";
			TERMINAL = "kitty";
			TERM = "kitty";
			NIXOS_OZONE_WL = "1";
		};
		pathsToLink = [ "/share/zsh" ];
	};
	programs = {
		zsh = {
			enable = true;
			enableCompletion = true;
			enableLsColors = true;
			autosuggestions.enable = true;
			shellAliases = {
				ll = "ls -sahl";
				tree = "tree --filesfirst";
			};
			ohMyZsh = {
				enable = true;
				plugins = [
					"colored-man-pages"
				];
				theme = "agnoster";
			};
		};
		npm.enable = true;
		nix-ld.enable = true;
	};
	fonts.packages = with pkgs; [
		nerd-fonts._0xproto
		noto-fonts-emoji
		powerline-fonts
	];
}
