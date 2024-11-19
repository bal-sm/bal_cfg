# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [];

  wsl.enable = true;
  wsl.defaultUser = "d";
  
  documentation.nixos.enable = true; # aing mah

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  i18n.supportedLocales = [ "all" ];

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_MESSAGES = "en_US.UTF-8";
    LC_ADDRESS = "id_ID.UTF-8";
    LC_MEASUREMENT = "C";
    LC_MONETARY = "id_ID.UTF-8";
    LC_NAME = "id_ID.UTF-8";
    LC_NUMERIC = "id_ID.UTF-8";
    LC_PAPER = "id_ID.UTF-8";
    LC_TELEPHONE = "id_ID.UTF-8";
    LC_TIME = "id_ID.UTF-8";
  };

  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.d = {
      isNormalUser = true;
      description = "d is my account.";
      extraGroups = [
        "root"
        "wheel"
        "flatpak" # ?
      ]; # TODO: Find out more about `extraGroups` and `/etc/group`
    };
  };

  environment.systemPackages = [

    # CLI apps
    pkgs.nano
    pkgs.git
    pkgs.git-lfs
    pkgs.p7zip

    # Useful `podman`/'docker' development tools
    pkgs.dive # look into docker image layers
    pkgs.podman-tui # status of containers in the terminal
    #pkgs.docker-compose # start group of containers for dev # ! Bad app.
    pkgs.podman-compose
  ];

  # Enable common `podman` container config files in `/etc/containers`
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      package = pkgs.podman;

      # Create a `docker` alias for `podman`, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under `podman-compose` to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
