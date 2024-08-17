{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable-small.url = "github:nixos/nixpkgs/nixos-unstable-small";
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
      url = "github:nix-community/disko/v1.6.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    apple-fonts = {
      url = "github:bal-sm/apple-fonts.nix/bal-sm-official-branch-no-nerd-fonts";
      inputs.nixpkgs.follows = "nixpkgs";
      # * inputs.flake-utils
    };
    # * flake-utils = { inputs.systems }
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixpkgs-unstable-small,
    home-manager,
    plasma-manager,
    disko,
    apple-fonts,
    ...
  }:
    let
      user = "d"; # ? mungkin ini sebenernya gak terlalu penting..
      system = "x86_64-linux";
      pkgs-stable = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      # To use packages from `nixpkgs-unstable`,
      # we configure some parameters for it first
      pkgs-unstable = import nixpkgs-unstable {
        # Refer to the `system` parameter from
        # the outer scope recursively
        inherit system;
        # To use proprietary packages, we need to allow the
        # installation of them.
        config.allowUnfree = true;
      };
      # another variant which has faster release schedule than regular `unstable`
      pkgs-unstable-small = import nixpkgs-unstable-small {
        inherit system;
        config.allowUnfree = true;
      };
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

      inherit system;

      specialArgs = {
        inherit inputs self user; # ? masih gak ngerti ini teh buat apa
        inherit pkgs-stable;
        inherit pkgs-unstable;
        inherit pkgs-unstable-small;
        inherit apple-fonts;
      };

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
          home-manager.extraSpecialArgs = {
            inherit inputs self user; # ? sama ini juga, (masih gak ngerti ini teh buat apa)
            inherit pkgs-stable;
            inherit pkgs-unstable;
            inherit pkgs-unstable-small;
          };
          home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ]; # <https://github.com/pjones/plasma-manager/issues/14>
          home-manager.backupFileExtension = "bak-hm";
        }
      ];
    };
  };
}

# TODO: liat documentation buat masalah "?" comments, terus jadinya bisa diilangin kalau tidak penting.
# // * lakukan sebelum pake `pkgs-unstable` tea.
# * kapan-kapan aja.
