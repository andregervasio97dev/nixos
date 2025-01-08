{ ... }:
let
	gradientColors = {
		first = "rgb(54, 1, 103)";
		second = "rgb(107, 7, 114)";
		third = "rgb(175, 7, 114)";
		fourth = "rgb(207, 38, 138)";
		fifth = "rgb(230, 38, 156)";
		sixth = "rgb(251, 140, 171)";
		fullGradient = "linear-gradient(
			to right bottom,
			${gradientColors.first},
			${gradientColors.second},
			${gradientColors.third},
			${gradientColors.fourth},
			${gradientColors.fifth},
			${gradientColors.sixth}
		)";
		firstHex = "360167";
		sixthHex = "FB8CAB";
	};

	contrastColors = {
		main = "rgb(252, 199, 55)";
		accent = "rgb(242, 107, 15)";
	};

	mainColors = {
		textColor = "rgb(255, 255, 255)";
		background-color = "rgba(100, 100, 100, 0.6)";
		border = "2px solid rgb(60, 60, 60)";
	};
	lightColors = {
		background-color = "rgba(160, 160, 160, 0.6)";
		textColor = "rgb(52, 180, 235)";
	};
	altColors = {
		textColor = "rgb(66, 245, 108)";
		regular = "rgba(66, 245, 108, 0.9)";
		warning = "rgba(255, 255, 26, 0.9)";
		critical = "rgba(255, 51, 0, 0.9)";
	};
	fontSizes = {
		mainSize = "14px";
		midSize = "12px";
		smallSize = "10px";
	};
	programs = {
		terminal = "kitty";
		fileManager = "dolphin";
		browser = "firefox";
		menu = "wofi";
	};
in {
	programs.waybar = {
		enable = true;
		settings = {
			mainBar = {
				layer = "bottom";
				position = "top";
				margin-top = 2;
				modules-left = [
					"clock"
					"battery"
					"cpu"
					"memory"
					"pulseaudio"
					"temperature"
					"backlight"
					"bluetooth"
				];
				modules-center = [
					"hyprland/workspaces"
				];
				modules-right = [
					"tray"
				];
				"hyprland/workspaces" = {
					format = "<sub>{id}</sub>{windows}";
					format-window-separator = " ";
					persistent-workspaces = {
						"*" = 3;
					};
					window-rewrite = {
						"kitty" = ">_";
						"firefox" = " ";
						"dolphin" = " ";
						"steam" = " ";
						"discord" = " ";
						"obsidian" = "󰠮";
					};
				};
				"tray" = {
					icon-size = 20;
					spacing = 5;
				};
				"clock" = {
					format = "{:%H:%M   %d/%m/%Y  }";
					tooltip-format = "<tt><small>{calendar}</small></tt>";
					calendar = {
						mode = "year";
						mode-mon-col = 4;
						on-scroll = 1;
						format = {
							months = "<span color='#ffead3'><b>{}</b></span>";
							days = "<span color='#ecc6d9'><b>{}</b></span>";
							weekdays = "<span color='#ffcc66'><b>{}</b></span>";
							today = "<span color='#ff6699'><b><u>{}</u></b></span>";
						};
					};
				};
				"battery" = {
					interval = 10;
					states = {
						warning = 45;
						critical = 15;
					};
					format = "{capacity}% {icon}";
					format-icons = [
						"󱊡"
						"󱊢"
						"󱊣"
					];
					format-charging = "{capacity}% 󱊦 ";
					format-plugged = "{capacity}% 󱊦 ";
					tooltip = "true";
				};
				"cpu" = {
					interval = 10;
					format = "{usage}% ";
					tooltip = "true";
				};
				"memory" = {
					interval = 30;
					format = "{used:0.1f}G/{total:0.1f}G  ";
				};
				"pulseaudio" = {
					format = "{volume}%  ";
					scroll-step = 5;
				};
				"temperature" = {
					format = "{temperatureC}°C ";
					critical-threshold = 75;
				};
				"backlight" = {
					format = "{percent}% {icon}";
					format-icons = [
						"󰃟 "
						"󰃠 "
					];
				};
				"bluetooth" = {
					format = " {status}";
					format-connected = " {device_alias}";
					tooltip-format-connected = "{num_connections} connected";
				};
			};
		};
		style = ''
			window#waybar {
				background-color: rgba(255, 255, 255, 0);
				font-size: ${fontSizes.mainSize};
			}
			#workspaces button {
				margin: 0 2px;
				padding: 3px 10px;
				border: unset;
				border-radius: 0.8rem;
				background-color: ${gradientColors.first};
				color: ${contrastColors.main};
			}
			#workspaces button.active {
				color: ${contrastColors.accent};
				background: linear-gradient(
					rgba(150, 150, 150, 0.5),
					rgba(150, 150, 150, 0.5)
				) padding-box,
				${gradientColors.fullGradient} border-box;
				border: 2px solid transparent;
			}
			button:hover {
				background: none;
				text-shadow: none;
				box-shadow: none;
			}
			#workspaces button:hover {
				background-color: ${gradientColors.sixth};
				color: ${contrastColors.accent};
			}

			#clock,
			#battery,
			#cpu,
			#memory,
			#pulseaudio,
			#temperature,
			#backlight,
			#bluetooth {
				margin: 0 2px;
				padding: 0 5px;
				border: unset;
				border-radius: 1rem;
				background-color: ${mainColors.background-color};
				color: ${mainColors.textColor};
			}
			#battery.warning {
				border: 2px solid ${altColors.warning};
			}
			#battery.critical {
				border: 2px solid ${altColors.critical};
			}
			#battery.plugged {
				border: 2px solid ${altColors.regular};
			}
			#battery.charging {
				border: 2px solid ${altColors.regular};
			}
			#temperatuce.critical {
				border: 2px solid ${altColors.critical};
			}
			#bluetooth.connected {
				border: 2px solid ${altColors.regular};
			}
			#tray {
				margin: 0 2px;
				padding: 0 5px;
				border: ${mainColors.border};
				border-radius: 0.5rem;
				background-color: ${lightColors.background-color};
			}
		'';
};
wayland.windowManager.hyprland = {
	enable = true;

	settings = {
# Display settings
		monitor =  [
			"eDP-1, preferred, 0x0, 1"
				"HDMI-A-1, preferred, 0x0, 1, mirror, eDP-1"
		];
# Program definitions
		"$terminal" = "${programs.terminal}";
		"$fileManager" = "${programs.fileManager}";
		"$menu" = "${programs.menu} --show drun";
		"$browser" = "${programs.browser}";

# Autostart daemons and processes
		exec-once = [
			"$terminal"
			"nm-applet &"
			"waybar &"
			"hyprpaper && sleep 1 && zsh $HOME/Scripts/set_random_wallpaper.sh"
		];

# Env variables
		env = [
			"XCURSOR_SIZE,24"
				"HYPRCURSOR_SIZE,24"
		];

# Look and feel
		general = {
			"gaps_in" = "2";
			"gaps_out" = "5";
			"border_size" = "2";
			"col.active_border" = "rgba(${gradientColors.firstHex}EE) rgba(${gradientColors.sixthHex}EE) 45deg";
			"col.inactive_border" = "rgba(BBBBBBaa)";

# Set no enable resizing by click and drag on gaps
			"resize_on_border" = "false";
			"allow_tearing" = "false";

			layout = "dwindle";
		};

# Decoration
		decoration = {
			rounding = "3";
			"active_opacity" = "0.9";
			"inactive_opacity" = "0.7";

			shadow = {
				enabled = "true";
				range = "4";
				"render_power" = "3";
				color = "rgba(1a1a1aee)";
			};

			blur = {
				enabled = "true";
				size = "3";
				passes = "1";
				vibrancy = "0.1696";
			};
		};

# Animations
		animations = {
			enabled = "yes";

# Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
			bezier = [
				"easeOutQuint,0.23,1,0.32,1"
					"easeInOutCubic,0.65,0.05,0.36,1"
					"linear,0,0,1,1"
					"almostLinear,0.5,0.5,0.75,1.0"
					"quick,0.15,0,0.1,1"
			];

			animation = [
				"global, 1, 10, default"
					"border, 1, 5.39, easeOutQuint"
					"windows, 1, 4.79, easeOutQuint"
					"windowsIn, 1, 4.1, easeOutQuint, popin 87%"
					"windowsOut, 1, 1.49, linear, popin 87%"
					"fadeIn, 1, 1.73, almostLinear"
					"fadeOut, 1, 1.46, almostLinear"
					"fade, 1, 3.03, quick"
					"layers, 1, 3.81, easeOutQuint"
					"layersIn, 1, 4, easeOutQuint, fade"
					"layersOut, 1, 1.5, linear, fade"
					"fadeLayersIn, 1, 1.79, almostLinear"
					"fadeLayersOut, 1, 1.39, almostLinear"
					"workspaces, 1, 1.94, almostLinear, fade"
					"workspacesIn, 1, 1.21, almostLinear, fade"
					"workspacesOut, 1, 1.94, almostLinear, fade"
			];
		};

# Dwindle Layout
		dwindle = {
			pseudotile = "true";
			"preserve_split" = "true";
		};

# Master Layout
		master = {
			"new_status" = "master";
		};

# Misc
		misc = {
			"force_default_wallpaper" = "0";
			"disable_hyprland_logo" = false;
		};

# Input
		input = {
			"kb_layout" = "us";

			"follow_mouse" = "2";
		};

# Keybindings
		"$mainMod" = "SUPER";
		bind = [
# Main shortcuts
			"$mainMod, return, exec, $terminal"
				"$mainMod, Q, killactive,"
				"$mainMod, M, exit,"
				"$mainMod, E, exec, $menu"
				"$mainMod, N, exec, $fileManager"
				"$mainMod, V, togglefloating,"
				"$mainMod, P, pseudo,"
				"$mainMod, O, togglesplit,"
				"$mainMod, F, fullscreen"
				"$mainMod, W, exec, $browser"


# Move focus
				"$mainMod, H, movefocus, l"
				"$mainMod, J, movefocus, d"
				"$mainMod, K, movefocus, u"
				"$mainMod, L, movefocus, r"

# Move active window
				"$mainMod SHIFT, H, movewindow, l"
				"$mainMod SHIFT, J, movewindow, d"
				"$mainMod SHIFT, K, movewindow, u"
				"$mainMod SHIFT, L, movewindow, r"

# Switch workspaces
				"$mainMod, 1, workspace, 1"
				"$mainMod, 2, workspace, 2"
				"$mainMod, 3, workspace, 3"
				"$mainMod, 4, workspace, 4"
				"$mainMod, 5, workspace, 5"
				"$mainMod, 6, workspace, 6"
				"$mainMod, 7, workspace, 7"
				"$mainMod, 8, workspace, 8"
				"$mainMod, 9, workspace, 9"
				"$mainMod, 0, workspace, 10"

# Move window to workspace
				"$mainMod SHIFT, 1, movetoworkspace, 1"
				"$mainMod SHIFT, 2, movetoworkspace, 2"
				"$mainMod SHIFT, 3, movetoworkspace, 3"
				"$mainMod SHIFT, 4, movetoworkspace, 4"
				"$mainMod SHIFT, 5, movetoworkspace, 5"
				"$mainMod SHIFT, 6, movetoworkspace, 6"
				"$mainMod SHIFT, 7, movetoworkspace, 7"
				"$mainMod SHIFT, 8, movetoworkspace, 8"
				"$mainMod SHIFT, 9, movetoworkspace, 9"
				"$mainMod SHIFT, 0, movetoworkspace, 10"

# Alt + Tab support
				"Alt, Tab, cyclenext"
				"Alt, Tab, bringactivetotop"

				];

		bindm = [
			"SUPER, mouse:272, movewindow"
				"SUPER, mouse:273, resizewindow"
		];

# Laptop multimedia keys
		bindel = [
			",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
				",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
				",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
				",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
		];

# Extra
		windowrulev2 = [
			"suppressevent maximize, class:.*"
			"opacity 0.0 override, class:^(xwaylandvideobridge)$"
			"noanim, class:^(xwaylandvideobridge)$"
			"noinitialfocus, class:^(xwaylandvideobridge)$"
			"maxsize 1 1, class:^(xwaylandvideobridge)$"
			"noblur, class:^(xwaylandvideobridge)$"
			# Defining workspaces for certain windows
			"workspace 2 silent, class:^(${programs.browser})$"
			"workspace 3 silent, class:.*${programs.fileManager}$"
			"workspace 10 silent, class:^(discord)$"
			"workspace 9 silent, class:^(steam)$"
		];
	};
};
}
