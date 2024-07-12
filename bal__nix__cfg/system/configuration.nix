# <https://nixos.org/manual/nixos/unstable/options>
# -----

{ config, pkgs, pkgs-unstable, ... }: {

  imports = [
    ./hardware-configuration.nix
    # TODO: Uncomment when `hardware-configuration.nix` is done
    ./disko-config.nix
  ];

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

  boot = {
    kernelParams = [ "nohibernate" ];
    tmp.cleanOnBoot = true;
    supportedFilesystems = [
      "btrfs"
      "ext4"
      "ntfs"
      "exFAT"
      "FAT"
    ]; # ?: meureun kieu ieu teh maksudna

    loader = {
      #efi.canTouchEfiVariables = true;
      grub = {
        device = "nodev";
        efiSupport = true;
        efiInstallAsRemovable = false; # ketang
        enable = true; # * defaultnya: !config.boot.isContainer . wow. liat di `search.nixos.org`.
        #useOSProber = false;
        timeoutStyle = "menu";
      };
      timeout = 13;
    };
  };

  networking = {
    hostName = "bal-frame-work-13";
    networkmanager.enable = true;
    enableIPv6 = false;
    firewall.enable = false;
  };

  time.timeZone = "Asia/Jakarta";

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

  # console = {
  #   packages = [ pkgs.jetbrains-mono ];
  #   font = "JetBrains Mono";
  #   useXkbConfig = true;
  # };
  # * Disabled 'cause ada `fonts` options tea dibawah.

  services.flatpak.enable = true;

  services.xserver = {
    # <https://nixos.wiki/wiki/KDE>
    # -----

    enable = true;
    #desktopManager.plasma5.enable = true;
  };

  services.displayManager = {
    sddm.enable = true;
    sddm.wayland.enable = true;
    defaultSession = "plasma";
  };

  services.desktopManager.plasma6.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # rtkit is optional for `pipewire` but recommended, cenah
  security.rtkit.enable = true;

  # To fix: KDE things: GTK themes are not applied in Wayland applications
  programs.dconf.enable = true;

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

  # skipped `programs.steam` things 'cause mau use flatpak instead.

  fonts = {
    # <https://nixos.wiki/wiki/Fonts>
    # -----

    packages = [
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      pkgs.noto-fonts
      pkgs.font-awesome
      pkgs.source-han-sans
      pkgs.source-han-serif
    ];

    # skipped `fontconfig` soalnya ada KDE tea.

  };

  environment.systemPackages = [
    # KDE apps
    pkgs.kdePackages.kate # * soalnya zaman Plasma 5, pernah gak ke-install as default.
    pkgs.kdePackages.qtstyleplugin-kvantum

    # GUI apps
    # ...

    # CLI apps
    pkgs.nano
    pkgs.nix-index
    pkgs.micro
    pkgs.git
    pkgs.git-lfs
    pkgs.p7zip
    pkgs.distrobox

  # Useful `podman`/'docker' development tools
    pkgs.dive # look into docker image layers
    pkgs.podman-tui # status of containers in the terminal
    #pkgs.docker-compose # start group of containers for dev # ! Bad app.
    pkgs-unstable.podman-compose # start group of containers for dev
    # * use `pipx` to install `podman-compose` instead.
  ];

  # Enable common `podman` container config files in `/etc/containers`
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for `podman`, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under `podman-compose` to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # skipped `xdg.portal` soalnya ada KDE.

  # skipped `security.polkit` terus sama `systemd` servicenya, again, soalnya ada KDE.

  # To enable support for Bluetooth devices
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Compatibility for binaries designed for normal Linux OS (FHS)
  # https://github.com/bal-sm/repo-for-learning/blob/4c47753b292678437a6a65ff723361d39a853c5c/systems/Linux/NixOS/_tidbits/binaries_for_normal_linux_incompatibility.md
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [
    pkgs.stdenv.cc.cc.lib # `libstdc++.so.6` for `pgadmin4`
  ];

  system.stateVersion = "23.11";

}
