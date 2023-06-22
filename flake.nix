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
    stylix.url = "github:SomeGuyNamedMy/stylix/wallpaper-refactor"; # "/home/mason/Projects/stylix";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs = { nixpkgs, home-manager, nur, stylix, emacs-overlay, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; overlays = [ emacs-overlay.overlays.default ]; };
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
                nix.package = pkgs.nixFlakes;
                nix.settings = {
                    substituters = [
                        "https://cache.nixos.org/"
                        "https://nix-community.cachix.org"
                    ];
                    trusted-public-keys = [
                        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
                    ];
                };
            }
            (import ./config/mason)
        ];
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      extraSpecialArgs = { inherit stylix; };
    };
}
