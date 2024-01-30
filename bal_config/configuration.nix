{pkgs, user, ...}: {

  imports = [
    # ./hardware-configuration.nix
    # TODO: Uncomment when `hardware-configuration.nix` is done
  ];

  documentation.nixos.enable = true; # aing mah

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

# ...
}
