# <https://nixos.org/manual/nixos/unstable/options>
# -----

{pkgs, user, ...}: {

  imports = [
    # ./hardware-configuration.nix
    # TODO: Uncomment when `hardware-configuration.nix` is done
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

# ..., skipped `boot` things for a while

  networking = {
    hostName = "bal-frame-work-13";
    networkmanager.enable = true;
    enableIPv6 = false;
    firewall.enable = false;
  };

  time.timeZone = "Asia/Jakarta";

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    packages = [ pkgs.jetbrains-mono ];
    font = "JetBrains Mono";
    useXkbConfig = true;
  };

  services = {
    flatpak.enable = true;

    xserver = {
      enable = true;
      displayManager = {
        sddm.enable = true;
        defaultSession = "plasmawayland";
      };
      desktopManager.plasma5.enable = true;
    };

  };

  # To fix: KDE things: GTK themes are not applied in Wayland applications
  programs.dconf.enable = true;

  users.users.d = {
    # ...
  };

# ...

}
