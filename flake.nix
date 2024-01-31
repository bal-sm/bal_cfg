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
  
  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: 
    let
      user = "d";
    in {
    nixosConfigurations.nixos-studio = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs self user;};
      modules = [
        ./bal_config/system/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.d = import ./bal_config/home.nix;
          home-manager.extraSpecialArgs = {inherit inputs self user;};
        }
      ];
    };
  };
}
