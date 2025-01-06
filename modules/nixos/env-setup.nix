{config, pkgs, ...}:

{
  environment = {
    systemPackages = with pkgs; [
      tree
      curl
      git
	  unzip
      neovim
      wget
      kitty
      kitty-themes
      zsh
      fastfetch
      btop
      wayclip
	  cargo
	  go
	  python313
	  python313Packages.pip
      kdePackages.xwaylandvideobridge
    ];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      TERMINAL = "kitty";
      TERM = "kitty";
      NIXOS_OZONE_WL = "1";
    };
  };
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      enableLsColors = true;
      autosuggestions.enable = true;
      ohMyZsh = {
        enable = true;
        plugins = [
          "colored-man-pages"
        ];
        theme = "agnoster";
      };
    };
    firefox.enable = true;
	npm.enable = true;
  };
  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
    noto-fonts-emoji
    powerline-fonts
  ];
  security.sudo.configFile = "Defaults env_keep+=SSH_AUTH_SOCK";
}
