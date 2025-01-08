{ pkgs }:
{
	pkgs.writeShellApplication = {
		name = "set-random-wallpaper";
		text = ''
			echo "Fuck" | ${pkgs.cowsay}/bin/cowsay | ${pkgs.cowsay}/bin/lolcat
		'';
	};
}
