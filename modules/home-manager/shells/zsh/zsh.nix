{ ... }:

{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		shellAliases = {
			ll = "ls -sahl";
			tree = "tree --filesfirst";
		};
		syntaxHighlighting = {
			enable = true;
		};
		oh-my-zsh = {
			enable = true;
			theme = "gnzh";
			plugins = [
				"colored-man-pages"
			];
		};
	};
}
