# <https://nixos.org/manual/nixos/unstable/options>
# -----

{ config, pkgs, ... }: {

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

  i18n.defaultLocale = "en_US.UTF-8";

  # console = {
  #   packages = [ pkgs.jetbrains-mono ];
  #   font = "JetBrains Mono";
  #   useXkbConfig = true;
  # };
  # * Disabled 'cause ada `fonts` options tea dibawah.

  services = {
    flatpak.enable = true;

    xserver = {
      # <https://nixos.wiki/wiki/KDE>
      # -----

      enable = true;
      displayManager = {
        sddm.enable = true;
        defaultSession = "plasmawayland";
      };
      desktopManager.plasma5.enable = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };

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
    pkgs.nano
    pkgs.micro
    pkgs.git
    pkgs.git-lfs
  ];

  # skipped `virtualisation` things.

  # skipped `xdg.portal` soalnya ada KDE.

  # skipped `security.polkit` terus sama `systemd` servicenya, again, soalnya ada KDE.

  # To enable support for Bluetooth devices
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  system.stateVersion = "23.11";

}
