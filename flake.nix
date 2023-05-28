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
    hyprland = {
        url = "github:hyprwm/Hyprland";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    ironbar = {
        url = "github:JakeStanger/ironbar";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    idris.url = "github:idris-lang/Idris2";
  };

  outputs = { nixpkgs, home-manager, nur, stylix, hyprland, ironbar, emacs-overlay, idris, ... }:
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
            hyprland.homeManagerModules.default
            ironbar.homeManagerModules.default
            nur.hmModules.nur
            {
                home.username = "mason";
                home.homeDirectory = "/home/mason";
                home.stateVersion = "22.11";
                programs.home-manager.enable = true;
                nixpkgs.overlays = [
                    (import emacs-overlay)
                    (super: self: {emacsPackages.idris2-mode = idris.packages.x86_64-linux.idris2-mode;})
                ];
            }
            (import ./config/mason)
            #./config/general
        ];
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      extraSpecialArgs = { inherit stylix; };
    };
}
