{ config, pkgs, inputs, ... }:

{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };
  environment.systemPackages = with pkgs; [
    # Bar for wayland
    waybar
    (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
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

  ];
  xdg.portal = {
    enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk 
    ];
  };
}
