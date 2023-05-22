{config, pkgs, lib, stylix, ...}:

{
    stylix = {
        image = ../resources/wallpapers/raison-detre.jpg;
        polarity = "dark";
        fonts = {
            serif = {
                package = pkgs.nerdfonts;
                name = "FiraCode Nerd Font";
            };
            sansSerif = {
                package = pkgs.nerdfonts;
                name = "FiraCode Nerd Font";
            };
            monospace = {
                package = pkgs.nerdfonts;
                name = "FiraCode Nerd Font";
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
