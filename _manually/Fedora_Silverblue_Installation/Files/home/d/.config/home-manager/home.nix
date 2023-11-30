{ config, pkgs, ... }:

# Update with `nix-channel --update` then `home-manager switch` to see the effects of these changes.

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "d";
  home.homeDirectory = "/home/d";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    # ~~pkgs.vscode~~
    pkgs.vscodium
    # > ~~- why?~~
    # >   ~~- let's andeulkeun rpm-ostree we~~
    # >   ~~- gui apps, pake native package manager we~~
    # > just kidding, BAGUS DA, jadi bersebelahan sama yang di `rpm-ostree`
    # > terus yang ini stable experience terus di update sesuka hati.
    pkgs.lazygit
    pkgs.trash-cli
    pkgs.thefuck
    pkgs.poetry
    pkgs.hub
    pkgs.starship
    pkgs.python312
    pkgs.nodejs_20
    # pkgs.zsh, mending zsh di system, soalnya duplicate
    pkgs.pre-commit
    pkgs.tldr
    pkgs.bun
    pkgs.act
    pkgs.python311Packages.pipx
    pkgs.nushellFull
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/d/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # to allow install pkgs yang unfree
  nixpkgs.config.allowUnfree = true;

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
