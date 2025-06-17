{
  description = "My configurations of NixOS";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
    };
  };

  outputs = { nixpkgs, home-manager, nur, ... }@inputs: 
  let
    overlays = [ nur.overlays.default ];
    pkgs = import nixpkgs { inherit overlays; };
  in {
    formatter = pkgs.nixfmt-rfc-style;

    nixosConfigurations = {
      koralle = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/desktop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.users.koralle = import ./users/koralle/home.nix;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
	      ];
      };
    };
  };
}
