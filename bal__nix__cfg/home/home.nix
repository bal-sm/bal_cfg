{ config, pkgs, ... }:

# Update with `nix-channel --update` then `home-manager switch` to see the effects of these changes.

{
  imports = [
    ./programs
  ];

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
  home.stateVersion = "23.11"; # Please read the comment before changing.

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

    # GUI apps
    pkgs.bottles
    pkgs.insync
    pkgs.jetbrains.pycharm-professional

    # CLI apps
    pkgs.trash-cli
    pkgs.thefuck
    pkgs.starship
    pkgs.tldr
    pkgs.nushellFull
    pkgs.micro

    # CLI/Python things
    #pkgs.ruff soalnya mending pre-commit / poetry langsung
    #pkgs.pre-commit soalnya ngandelin poetry dong
    pkgs.python312
    pkgs.nodePackages_latest.pyright
    pkgs.python311Packages.jedi
    pkgs.python311Packages.pipx
    pkgs.poetry
    pkgs.ruff
    pkgs.pre-commit

    # CLI/JS things
    pkgs.nodejs_20
    pkgs.bun

    # CLI/Git things
    pkgs.gh
    pkgs.hub
    pkgs.lazygit
    pkgs.git-filter-repo
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

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    #histSize = 10000;
    #histFile = "${config.xdg.dataHome}/zsh/history";

    zplug = {
      enable = true;
      plugins = [
        # { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
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
    # https://starship.rs/installing/#nix
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      # add_newline = false;

      # character = {
      #   success_symbol = "[➜](bold green)";
      #   error_symbol = "[➜](bold red)";
      # };

      # package.disabled = true;
    };
  };

  programs.git = {
    enable = true;
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

}
