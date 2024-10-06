# <https://nixos.org/manual/nixos/unstable/options>
# -----

{ config, pkgs, pkgs-stable, pkgs-unstable, pkgs-unstable-small, apple-fonts, ... }: {

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

  services.earlyoom = {
    # * Avoid Linux locking up in low memory situations using `earlyoom`
    # * Grabbed from <https://dataswamp.org/~solene/2022-09-28-earlyoom.html>
    enable = true;
    freeMemThreshold = 10; # default: 10
    freeMemKillThreshold = 7; # default: 5
    freeSwapThreshold = 10; # default: 10
    freeSwapKillThreshold = 7; # default: 5
    extraArgs = [
        "-g" "--avoid '^(X|plasma.*|konsole|kwin)$'"
        "--prefer '^(electron|libreoffice|gimp)$'"
    ];
  };

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
    package = pkgs.pipewire;
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
  # * programs.zsh.package, gak ada.

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
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })
      pkgs.noto-fonts
      pkgs.noto-fonts-cjk
      pkgs.noto-fonts-emoji
      pkgs.font-awesome
      pkgs.liberation_ttf
      pkgs.source-han-sans
      pkgs.source-han-serif
      pkgs.source-han-sans-japanese
      pkgs.source-han-serif-japanese
      pkgs.inter
      apple-fonts.packages.${pkgs.system}.sf-pro
      apple-fonts.packages.${pkgs.system}.sf-compact
      apple-fonts.packages.${pkgs.system}.sf-mono
      apple-fonts.packages.${pkgs.system}.sf-arabic
      apple-fonts.packages.${pkgs.system}.ny
      pkgs.fira-go
    ];

    fontconfig = {
      # * readded `fontconfig`.
      enable = true;
      defaultFonts = {
        monospace = ["JetBrainsMono Nerd Font Propo"];
        serif = ["Noto Serif" "Source Han Serif"];
        sansSerif = ["Noto Sans" "Source Han Sans"];
        emoji = ["Noto Color Emoji"];
      };
    };

  };

  environment.systemPackages = [
    # KDE apps
    # --------
    pkgs.kdePackages.kate # * soalnya zaman Plasma 5, pernah gak ke-install as default.
    pkgs.kdePackages.qtstyleplugin-kvantum
    pkgs.haruna # * video player.

    # GUI apps
    # --------

    # Multimedia players
    # -------------
    pkgs.celluloid
    pkgs.smplayer
    pkgs.mpv

    # `libreoffice`
    # -------------
    pkgs.libreoffice-qt6-fresh
    # 'libreoffice' dependencies
    pkgs.hunspell
    pkgs.hunspellDicts.en_US

    # CLI apps
    pkgs-stable.nano
    pkgs.nix-index
    pkgs-stable.micro
    pkgs-stable.git
    pkgs-stable.git-lfs
    pkgs-stable.p7zip
    pkgs-stable.distrobox

    # Useful `podman`/'docker' development tools
    pkgs-stable.dive # look into docker image layers
    pkgs-stable.podman-tui # status of containers in the terminal
    #pkgs.docker-compose # start group of containers for dev # ! Bad app.
    # ---
    pkgs-unstable.podman-compose
    # * used 'unstable', soalnya yang 'stable' buggy.
    # TODO: ubah ke 'stable' kalo udah bener.
    # ---
  ];

  # Enable common `podman` container config files in `/etc/containers`
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      package = pkgs-stable.podman;

      # Create a `docker` alias for `podman`, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under `podman-compose` to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  xdg.portal = {
    # * IT'S NOT ACTUALLY AUTO-ENABLED BY ENABLING KDE..
    # * and it's actually Flatpak's thing, ~~gak ada lagi yang make~~.. (I should've known.)
    # * native `firefox` pake loh, ternyata.
    enable = true;
    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde # * tuh tapi, `kdePackages`, weird,
      pkgs.xdg-desktop-portal-gtk
    ];
  };

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
