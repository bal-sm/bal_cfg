{
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = true;
    package = pkgs.vscodium;
    extensions = [ ]; # fill plz
    globalSnippets = { }; # gak usah dulu
    # haskell things, liat geura vscode options-nya
    keybindings = [ ];
    # look keybindings for more options
    languageSnippets = { }; # gimana nanti
    mutableExtensionsDir = true; # aja we
    userSettings = { }; # fill plz
    userTasks = { }; # gimana nanti
  };
}