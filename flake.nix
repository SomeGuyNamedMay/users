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
    stylix.url = "github:SomeGuyNamedMy/stylix/hyprland-support";
    hyprland = {
        url = "github:hyprwm/Hyprland";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    idris.url = "github:idris-lang/Idris2";
  };

  outputs = { nixpkgs, home-manager, nur, stylix, hyprland, emacs-overlay, idris, ... }:
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
            {
              stylix = {
                  image = ./resources/wallpapers/were-still-underground.jpg;
                  polarity = "dark";
                  fonts = {
                      serif = {
                          package = pkgs.dejavu_fonts;
                          name = "DejaVu Serif";
                      };
                      sansSerif = {
                          package = pkgs.dejavu_fonts;
                          name = "DejaVu Sans";
                      };
                      monospace = {
                          package = pkgs.dejavu_fonts;
                          name = "DejaVu Sans Mono";
                      };
                      sizes = {
                          desktop = 12;
                          applications = 15;
                          terminal = 15;
                          popups = 12;
                      };
                  };
                  opacity = {
                      terminal = 0.90;
                      applications = 0.90;
                      popups = 0.50;
                      desktop = 0.90;
                  };
                  targets = {
                      waybar.enableLeftBackColors = true;
                      waybar.enableRightBackColors = true;
                  };
              };
            }
            ./config/mason/desktop.nix
            ./config/mason/kakoune.nix
            ./config/mason/media.nix
            ./config/mason/packages.nix
            ./config/mason/programming-env.nix
            ./config/mason/shell.nix
            ./config/mason/web.nix
            #./config/general
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
