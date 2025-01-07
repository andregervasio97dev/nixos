{ pkgs, inputs, ... }:

let
	set-random-wallpaper = pkgs.pkgs.writeShellScriptBin "set-random-wallpaper"
	''
		hyprctl hyprpaper unload all
		wallpapers''\=''\(''\$''\(ls -d /home/illyanda/Pictures/*''\)''\)
		wall''\=''\$''\{wallpapers''\[ ''\$RANDOM ''\% ''\(''\$''\{''\#wallpapers''\[''\@''\]''\} ''\+ 1''\) ''\]''\}
		hyprctl hyprpaper preload ''\$wall
		hyprctl hyprpaper wallpaper ''\,''\$wall
	'';
in {
	programs.hyprland = {
		enable = true;
		package = inputs.hyprland.packages."${pkgs.system}".hyprland;
	};

	environment.systemPackages = with pkgs; [
		# app launcher 
		wofi
		# Notifier daemon
		dunst
		# dependancy for dunst
		libnotify
		# wallpaper daemon
		hyprpaper
		# GUI for network
		networkmanagerapplet
		qt5.qtwayland
		qt6.qtwayland
	];

	xdg.portal = {
		enable = true;
		extraPortals = [ 
			pkgs.xdg-desktop-portal-gtk 
		];
	};
	systemd.timers."set-random-wallpaper" = {
		wantedBy = [ "timers.target" ];
		timerConfig = {
			OnBootSec = "10s";
			OnUnitActiveSec = "10s";
			Unit = "set-random-wallpaper.service";
		};
	};

	systemd.services."set-random-wallpaper" = {
		script = ''
			set -eu
			${set-random-wallpaper}/bin/set-random-wallpaper
			'';
		serviceConfig = {
			Type = "oneshot";
			User = "illyanda";
		};
	};
}
