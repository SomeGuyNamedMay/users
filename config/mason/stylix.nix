{config, lib, pkgs, stylix, ...}:

{
  stylix = {
      image = ../../resources/wallpapers/static/log-horizon.jpg;
      polarity = "dark";
      fonts = {
          serif = {
              package = pkgs.dejavu_fonts;
              name = "FiraCode Nerd Font";
          };
          sansSerif = {
              package = pkgs.dejavu_fonts;
              name = "FiraCode Nerd Font";
          };
          monospace = {
              package = pkgs.dejavu_fonts;
              name = "FiraCode Nerd Font Mono";
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
