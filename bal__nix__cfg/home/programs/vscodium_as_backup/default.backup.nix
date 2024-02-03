{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = true;
    package = pkgs.vscodium;
    extensions = [
      pkgs.vscode-extensions.ms-pyright.pyright
      pkgs.vscode-extensions.ms-python.black-formatter
      pkgs.vscode-extensions.batisteo.vscode-django
      pkgs.vscode-extensions.tamasfe.even-better-toml
      pkgs.vscode-extensions.eamodio.gitlens # fun
      pkgs.vscode-extensions.ms-toolsai.jupyter
      pkgs.vscode-extensions.ms-toolsai.vscode-jupyter-slideshow
      pkgs.vscode-extensions.ms-toolsai.vscode-jupyter-cell-tags
      pkgs.vscode-extensions.ms-toolsai.jupyter-renderers
      pkgs.vscode-extensions.ms-toolsai.jupyter-keymap
      pkgs.vscode-extensions.yzhang.markdown-all-in-one
      pkgs.vscode-extensions.davidanson.vscode-markdownlint
      pkgs.vscode-extensions.redhat.vscode-xml
      pkgs.vscode-extensions.redhat.vscode-yaml
      #pkgs.vscode-extensions.charliermarsh.ruff
      pkgs.vscode-extensions.jnoortheen.nix-ide

      # Disabled
      # --------

      # > Me: Disabled 'cause proprietary euy.
      # --------
      # pkgs.vscode-extensions.ms-vscode.cmake-tools
      # pkgs.vscode-extensions.ms-vscode.cpptools
    ]; # > Me: udah we segini aja dulu.
    globalSnippets = { }; # gak usah dulu
    # haskell things, liat geura vscode options-nya
    keybindings = [ ];
    # look keybindings for more options
    languageSnippets = { }; # gimana nanti
    mutableExtensionsDir = false; # biar FUN.
    userSettings = { }; # gimana nanti ketang, soalna beda tanda baca sama `json` asli.
    userTasks = { }; # gimana nanti
  };

  # To enable Insiders Build
  # https://nixos.wiki/wiki/Visual_Studio_Code#Insiders_Build
  # programs.vscode.package = (pkgs.vscode.override{ isInsiders = true; }).overrideAttrs (oldAttrs: rec {
  #   src = (builtins.fetchTarball {
  #     url = "https://update.code.visualstudio.com/latest/linux-x64/insider";
  #     sha256 = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
  #   });
  #   version = "latest";
  #
  #   buildInputs = oldAttrs.buildInputs ++ [ pkgs.krb5 ];
  # });
  #
  # ! It doesn't work.
  # TODO: Fix it.

}
