{ pkgs, inputs, ... }:
 let
	wallpaper-random = pkgs.writeShellApplication {
		name = "wallpaper-random";
		text = ''
			bash /home/illyanda/Scripts/set_random_wallpaper.sh >> /dev/null
		'';
	};
in{
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
	systemd.timers."wallpaper-random" = {
		wantedBy = [ "timers.target" ];
		timerConfig = {
			OnBootSec = "10s";
			OnUnitActiveSec = "10s";
			Unit = "wallpaper-random.service";
		};
	};

	systemd.services."wallpaper-random" = {
		path = with pkgs; [ bash hyprland ];
		script = ''
			set -eu
			${wallpaper-random}/bin/wallpaper-random
			'';
		serviceConfig = {
			Type = "oneshot";
			User = "root";
		};
	};
}
