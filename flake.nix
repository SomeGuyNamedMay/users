{
  description = "Home Manager configuration of mason";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    stylix.url = "/home/mason/Projects/stylix";
  };

  outputs = { nixpkgs, home-manager, nur, stylix, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."mason" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
            stylix.homeManagerModules.stylix
            nur.hmModules.nur
            {
                home.username = "mason";
                home.homeDirectory = "/home/mason";
                home.stateVersion = "22.11";
                programs.home-manager.enable = true;
            }
            (import ./config/mason)
        ];
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      extraSpecialArgs = { inherit stylix; };
    };
}
