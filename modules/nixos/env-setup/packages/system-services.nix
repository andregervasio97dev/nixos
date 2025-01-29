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
  						grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
  						tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
  						caps a    s    d    f    g    h    j    k    l    ;    '    ret
  						lsft z    x    c    v    b    n    m    ,    .    /    rsft
  						lctl lmet lalt           spc            ralt rmet rctl
					)
					(defvar
						tap-time 200
						hold-time 200
					)
					(defalias
						tab-mod (tap-hold $tap-time $hold-time tab layer-toggle movement)
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
					(deflayer qwerty
						grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
						@tab-mod  q    w    e    r    t    y    u    i    o    p    [    ]    \
						@caps-mod @a-mod    @s-mod    @d-mod    @f-mod    g    h    @j-mod    @k-mod    @l-mod    @;-mod    '    ret
						lsft z    x    c    v    b    n    m    ,    .    /    rsft
						lctl lmet lalt           spc            ralt rmet rctl
					)
					(deflayer movement
						_    _    _    _    _    _    _    _    _    _    _    _    _    _
						_    _    _    _    _    _    _    _    _    _    _    _    _    _
						_    _    _    _    _    lft  down up   rght _    _    _    _
						_    _    _    _    _    _    _    _    _    _    _    _
						_    _    _              _              _    _    _
					)
				'';
			};
	};
}
