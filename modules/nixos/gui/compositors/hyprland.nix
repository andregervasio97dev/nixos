{ pkgs, inputs, ... }:
{
	programs.hyprland = {
		enable = true;
		package = inputs.hyprland.packages."${pkgs.system}".hyprland;
	};

	environment.systemPackages = with pkgs; [
		# App runner
		wofi
		# Notifier daemon
		dunst
		# Dependancy for dunst
		libnotify
		# Wallpaper daemon
		hyprpaper
		# Screenshot App
		hyprshot
		# Screen-Lock
		hyprlock
		# GUI for network
		networkmanagerapplet
		qt5.qtwayland
		qt6.qtwayland
		kdePackages.xwaylandvideobridge
	];

	xdg.portal = {
		enable = true;
		wlr.enable = true;
		extraPortals = [ 
			pkgs.xdg-desktop-portal-gtk 
			pkgs.xdg-desktop-portal-wlr
		];
	};
}
