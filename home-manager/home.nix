{ 
  config,
  pkgs, 
  ... 
}: {
  home.username = "illyanda";

  home.packages = with pkgs; [

    zip
    unzip

    ripgrep
  
    docker
    docker-compose  
    lazydocker

    cowsay
  ];

  programs.git = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    defaultEditor = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;

    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    shellAliases = {
      ll = "ls -ahlsS";
      ls = "ls --color=tty";
      clr = "clear";
    };
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
