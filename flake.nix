# TODO: Code this fully

{ ... }:

{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  home-manager.users.d = import ./bal_config/home.nix;
  
  # ...

}
