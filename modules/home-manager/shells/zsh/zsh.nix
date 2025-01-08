{ ... }:

{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		enableLsColors = true;
		autosuggestion.enable = true;
		shellAliases = {
			ll = "ls -sahl";
			tree = "tree --filesfirst";
		};
		syntaxHighlighting = {
			enable = true;
		};
		ohMyZsh = {
			enable = true;
			theme = "agnoster";
			plugins = [
				"colored-man-pages"
			];
		};
	};
}
