{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    plasma-manager,
    disko,
    ...
  }:
    let
      user = "d"; # ? mungkin ini sebenernya gak terlalu penting..
    in {
    # ! HINT: switch to this flake output with:
    # * `sudo nixos-rebuild switch --flake .#nixos-studio`
    nixosConfigurations.nixos-studio = nixpkgs.lib.nixosSystem {
      # ?: What is `nixpkgs.lib.nixosSystem`?
      # Unless you want to handwire something together or use another higher level function from some
      # 3rd party library, your want to use this function. It is basically the entrypoint to a flake based nixos
      # system configuration.
      #
      # See <https://github.com/NixOS/templates/blob/master/simple-container/flake.nix> for an example.
      #
      # The arguments can be found here
      # <https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/eval-config.nix>
      # but system and modules are the only two arguments you need for now. There is
      # probably some documentation in the manual but there is no API documentation.
      #
      # Thanks to <https://www.reddit.com/r/NixOS/comments/13oat7j/comment/jl3lgqp/>.

      system = "x86_64-linux";
      specialArgs = {inherit inputs self user;}; # ? masih gak ngerti ini teh buat apa
      modules = [
        disko.nixosModules.disko
        ./bal__nix__cfg/system/disko-config.nix
        {
          _module.args.disks = [ "/dev/sda" ];
        }
        ./bal__nix__cfg/system/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.d = import ./bal__nix__cfg/home/home.nix;
          home-manager.extraSpecialArgs = {inherit inputs self user;}; # ? sama ini juga, (masih gak ngerti ini teh buat apa)
          home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ]; # <https://github.com/pjones/plasma-manager/issues/14>
        }
      ];
    };
  };
}

# TODO: liat documentation buat masalah "?" comments, terus jadinya bisa diilangin kalau tidak penting.
# // * lakukan sebelum pake `pkgs-unstable` tea.
# * kapan-kapan aja.
