{pkgs, user, ...}: {

  imports = [
    # ./hardware-configuration.nix
  ];

# ...

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

# ...
}
