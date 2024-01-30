{pkgs, user, ...}: {

  imports = [
    # ./hardware-configuration.nix
    # TODO: Uncomment when `hardware-configuration.nix` is done
  ];

# ...

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

# ...
}
