{ pkgs }:

pkgs.writeShellScriptBin "set-random-wallpaper" ''
	echo Fuck | ${pkgs.cowsay}/bin/cowsay | ${pkgs.cowsay}/bin/lolcat
'';
