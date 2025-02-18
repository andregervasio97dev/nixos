{ pkgs, ... }:

{
	environment = {
		systemPackages = with pkgs; [
			# Basic tools
			ripgrep
			curl
			wget
			unzip
			gzip
			btop
			wayclip
			git
			pavucontrol
			syncthing
			syncthingtray
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
			python312Packages.pip
			python312Packages.python-lsp-server
			# Languages
			go
			rustc
			python312Full
			deno
			# Language server
			nil
			typescript-language-server
			lua-language-server
			bash-language-server
			vim-language-server
			gopls
			# Builders
			libgcc
			# Version managers
			fnm
		];
	};
}
