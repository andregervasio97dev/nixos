{ lib, config, pkgs, ... }:

let 
cfg = config.main-user;
in
{
	options.main-user = {
		enable = lib.mkEnableOption "enable user module";

		userName = lib.mkOption {
			default = "illyanda";
			description = ''
				username
			'';
		};
	};

	config = lib.mkIf cfg.enable {
		users.users.${cfg.userName} = {
			isNormalUser = true;
			initialPassword = "a";
			extraGroups = [
				"networkmanager" 
				"wheel"
				"input"
				"uinput"
			];
			description = "illyanda";
			shell = pkgs.zsh;
		};
	};
}
