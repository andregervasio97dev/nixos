{ ... }:

{
	hardware.uinput.enable = true;
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
				kanata.extraDefCfg = "process-unmapped-keys yes";
				kanata.config = ''
					(defsrc
						caps
						a s d f
						j k l ;
					)
					(defvar
						tap-time 200
						hold-time 200
					)
					(defalias
						caps-mod (tap-hold $tap-time $hold-time esc caps)
						a-mod (tap-hold $tap-time $hold-time a lsft)
						s-mod (tap-hold $tap-time $hold-time s ctl)
						d-mod (tap-hold $tap-time $hold-time d lmet)
						f-mod (tap-hold $tap-time $hold-time f lalt)
						j-mod (tap-hold $tap-time $hold-time j lalt)
						k-mod (tap-hold $tap-time $hold-time k rmet)
						l-mod (tap-hold $tap-time $hold-time l rctl)
						;-mod (tap-hold $tap-time $hold-time ; rsft)
					)
					(deflayer base
						@caps-mod
						@a-mod
                        @s-mod
                        @d-mod
                        @f-mod
                        @j-mod
                        @k-mod
                        @l-mod
                        @;-mod
					)
				'';
			};
	};
}
