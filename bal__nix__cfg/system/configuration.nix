# <https://nixos.org/manual/nixos/unstable/options>
# -----

{ config, pkgs, pkgs-unstable, pkgs-unstable-small, apple-fonts, ... }: {

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
    pkgs.kdePackages.kate # * soalnya zaman Plasma 5, pernah gak ke-install as default.
    pkgs.kdePackages.qtstyleplugin-kvantum

    # GUI apps
    pkgs.libreoffice-qt6-fresh
    # 'libreoffice' dependencies
    pkgs.hunspell
    pkgs.hunspellDicts.en_US

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
  ];

  programs.firefox = {
    enable = true;
    package = pkgs-unstable-small.firefox-devedition-bin;
    #nativeMessagingHosts.packages = [ pkgs.kdePackages.plasma-browser-integration ];
    preferences = {
      "extensions.pocket.enabled" = false;
      #"media.hardwaremediakeys.enabled" = false;
      "widget.use-xdg-desktop-portal.file-picker" = 1;

      # Fastfox
      "gfx.webrender.all" = true;
      "gfx.webrender.compositor" = true;
      "gfx.webrender.compositor.force-enabled" = true;
      "media.hardware-video-decoding.enabled" = true;
      "media.ffmpeg.vaapi.enabled" = true;
      "network.http.pacing.requests.enabled" = false;
      "network.ssl_tokens_cache_capacity" = 10240;
      "browser.tabs.unloadOnLowMemory" = true;
      "browser.low_commit_space_threshold_mb" = 2640; # 4 GB
      "browser.tabs.min_inactive_duration_before_unload" = 120000; # 2 minutes

      # Securefox
      "browser.contentblocking.category" = "strict";
      "urlclassifier.trackingSkipURLs" = "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com";
      "urlclassifier.features.socialtracking.skipURLs" = "*.instagram.com, *.twitter.com, *.twimg.com";
      "browser.download.start_downloads_in_tmp_dir" = true;
      "browser.helperApps.deleteTempFileOnExit" = true;
      "privacy.globalprivacycontrol.enabled" = true;
      "security.OCSP.enabled" = 0;
      "security.remote_settings.crlite_filters.enabled" = true;
      "security.pki.crlite_mode" = 2;
    };
  };

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
