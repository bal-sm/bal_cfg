{pkgs, user, ...}: {

# ...

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

# ...
}
