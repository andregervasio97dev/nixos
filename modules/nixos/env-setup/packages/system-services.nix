{ ... }:

{
	# Enable uinput
	#boot.kernelModules = [ "uinput" ];
	#hardware.uinput.enable = true;
	#services.udev.extraRules = ''
	#	KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
	#'';
	users.groups.uinput = { };

	# Adds kanata to necessary groups
	systemd.services.kanata-internalKeyboard.serviceConfig = {
		SupplementaryGroups = [
			"input"
			"uinput"
		];
	};
	
	services.kanata = {
		enable = true;
		keyboards = {
			internalKeyboard = {
				devices = [
					"/dev/input/by-path/platform-i8042-serio-0-event-kbd"
				];
				extraDefCfg = "process-unmapped-keys yes";
				config = ''
					(defsrc
						caps
					)
					(defvar
						tap-time 200
						hold-time 200
					)
					(defalias
						caps (tap-hold $tap-time $hold-time esc caps)
					)
					(deflayer base
						@caps
					)
				'';
			};
		};
	};
}
