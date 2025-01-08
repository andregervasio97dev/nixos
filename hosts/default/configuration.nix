# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, lib, ... }:

{
	imports = [ 
		# Include the results of the hardware scan.
		./hardware-configuration.nix
		# User modules
		../../modules/nixos/nixos-index.nix
		# Home-manager setup
		inputs.home-manager.nixosModules.default
	];

	main-user.enable = true;
	main-user.userName = "illyanda";

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	
	networking.hostName = "illyanda";
	
	# Enable networking
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "America/Sao_Paulo";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "pt_BR.UTF-8";
		LC_IDENTIFICATION = "pt_BR.UTF-8";
		LC_MEASUREMENT = "pt_BR.UTF-8";
		LC_MONETARY = "pt_BR.UTF-8";
		LC_NAME = "pt_BR.UTF-8";
		LC_NUMERIC = "pt_BR.UTF-8";
		LC_PAPER = "pt_BR.UTF-8";
		LC_TELEPHONE = "pt_BR.UTF-8";
		LC_TIME = "pt_BR.UTF-8";
	};

	# Enable the X11 windowing system.
	# You can disable this if you're only using the Wayland session.
	services.xserver.enable = false;

	# Enables flatpak
	services.flatpak.enable = true;
	services.displayManager = {
		sddm = {
			enable = true;
			autoNumlock = true;
			theme = "catppuccin-mocha";
			package = lib.mkForce(pkgs.kdePackages.sddm);
		};
		defaultSession = "hyprland";
	};

	# Enable the KDE Plasma Desktop Environment.
	services.desktopManager.plasma6.enable = true;

	# Configure keymap in X11
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

	# Enable CUPS to print documents.
	services.printing.enable = true;

	# Enable sound with pipewire.
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
		wireplumber.enable = true;
	};

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	home-manager = {
		backupFileExtension = "backup";
		extraSpecialArgs = { inherit inputs; };
		users = {
			"illyanda" = import ./home.nix;
		};
	};

	# List packages installed in system profile. To search, run:
	# $ nix search wget

	hardware.bluetooth.enable = true;

	# Enable the OpenSSH daemon.
	services.openssh.enable = true;
	security.pam = {
		rssh.enable = true;
		sshAgentAuth.enable = true;
	};
	system.stateVersion = "24.11";
}
