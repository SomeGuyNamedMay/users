{config, pkgs, lib, stylix, ...}:

{
    stylix = {
        image = ../resources/wallpapers/raison-detre.jpg;
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
            opacity = {
                terminal = 0.90;
                applications = 0.90;
                popups = 0.90;
                desktop = 0.90;
            };
            targets = {
                waybar.enableLeftBackColors = true;
                waybar.enableRightBackColors = true;
            };
        };
    };
}
