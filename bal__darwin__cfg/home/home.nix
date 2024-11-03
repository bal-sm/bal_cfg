{ config, pkgs, pkgs-stable, pkgs-unstable, ... }:

{
  imports = [
    ./programs
  ];

  home.username = "d";
  home.homeDirectory = "/home/d";

  home.stateVersion = "24.05";

  home.packages = [

    # CLI apps
    pkgs-stable.trash-cli
    pkgs-stable.thefuck
    pkgs-stable.tldr
    pkgs-stable.nushellFull
    pkgs-stable.gnumake

    # CLI/Python things
    #pkgs.ruff soalnya mending pre-commit / poetry langsung
    #pkgs.pre-commit soalnya ngandelin poetry dong
    pkgs-unstable.python312
    pkgs-unstable.python312Packages.pipx
    #pkgs.poetry soalnya mending pake pipx

    # CLI/JS things
    pkgs-stable.nodejs_20
    pkgs-stable.bun
    pkgs-stable.tailwindcss

    # CLI/Git things
    pkgs-stable.gh
    pkgs-stable.hub
    pkgs-stable.lazygit
    pkgs-stable.git-filter-repo
  ];

  home.file = {};

  home.sessionVariables = {};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # to allow install pkgs yang unfree
  nixpkgs.config.allowUnfree = true;

  programs.zsh = {
    enable = true;
    package = pkgs.zsh;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "marlonrichert/zsh-autocomplete"; }
        { name = "agkozak/zsh-z"; }
      ];
    };

  };

  home.sessionPath = [
    "$HOME/.local/bin" # for `pipx` installed binaries
  ];

  programs.starship = {
    enable = true;
    package = pkgs.starship;
    settings = {};
  };

  programs.git = {
    enable = true;
    package = pkgs.git;
    userName  = "Mahmuda";
    userEmail = "bal.mahmuda@gmail.com";
    aliases = {
      cleanup = "!git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 -r git branch -d";
      rb = "rebase --interactive --autosquash --rebase-merges";
      new-branch = "checkout -b";
      list-branch = "branch -a";
      delete-branch = "branch -d";
      delete-branch-yes = "branch -D";
      meg = "merge --no-ff";
      pretty-log = "log --oneline --graph --decorate";
      pretty-log-all = "log --oneline --graph --decorate --all";
      push-force = "push --force-with-lease";
      tag-it = "!f() { git tag -a \"$@\" && git push origin \"$@\"; }; f";
    };
  };

  programs.direnv = {
    enable = true;
    package = pkgs.direnv;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

}
