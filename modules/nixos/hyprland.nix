{ pkgs, inputs, ... }:

{
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
			${pkgs.coreutils}/bin/env/bash /home/illyanda/Scripts/set_random_wallpaper.sh >> /dev/null
			'';
		serviceConfig = {
			Type = "oneshot";
			User = "root";
		};
	};
}
