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

	textColors = {
		active = "rgb(255, 255, 255)";
		focused = "${contrastColors.main}"; 
		unfocused = "rgb(150, 150, 150)";
	};
in {
	programs.wofi = {
		enable = true;
		settings = {
			prompt = "";
			sort_order = "alphabetical";
			width = "25%";
		};
		style = ''
			window {
				border-radius: 0.5rem;
				overflow: hidden;
			}
			#outer-box {
				background: linear-gradient(
					rgba(150, 150, 150, 0.5),
					rgba(150, 150, 150, 0.5)
					) padding-box,
					${gradientColors.fullGradient} border-box;
				border: 2px solid transparent;
			}
			#inner-box {
				background: unset;
				border: unset;
			}
			#input {
				background: unset;
				background-color: ${gradientColors.fullGradient};
				color: ${textColors.active};
			}
			#entry:selected {
				background-color: ${gradientColors.second};
			}
			#text {
				font-size: 14px;
				color: ${textColors.unfocused};
			}
			#text:selected {
				color: ${textColors.active};
			}
			#img {
				all: unset;
			}
		'';
	};
}
