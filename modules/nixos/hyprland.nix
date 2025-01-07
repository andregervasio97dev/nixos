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

	systemd.timers."set_random_wallpaper" = {
		wantedBy = [ "timers.target" ];
		timerConfig = {
			OnBootSec = "1m";
			OnUnitActiveSec = "30m";
			Unit = "set_random_wallpaper.service";
		};
	};

	systemd.services."set-random-wallpaper" = {
		script = ''
			set -eu
			zsh $HOME/Scripts/set_random_wallpaper.sh
		'';
		serviceConfig = {
			Type = "oneshot";
			User = "root";
		};
	};

	
}
