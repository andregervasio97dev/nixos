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
	systemd.timers."hello-world" = {
		wantedBy = [ "timers.target" ];
		timerConfig = {
			OnBootSec = "5m";
			OnUnitActiveSec = "5m";
			Unit = "hello-world.service";
		};
	};

	systemd.services."hello-world" = {
		script = ''
			set -eu
			${pkgs.coreutils}/bin/echo "Hello World"
			'';
		serviceConfig = {
			Type = "oneshot";
			User = "root";
		};
	};
}
