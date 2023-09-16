{config, lib, pkgs, stylix, ...}:

{
  stylix = {
    wallpaper = config.lib.stylix.mkAnimation {
      animation = ../../resources/gif/lofi-cafe.gif;    
      polarity = "dark";
    };
      fonts = {
          serif = {
              package = pkgs.nerdfonts;
              name = "FiraCode Nerd Font Mono";
          };
          sansSerif = {
              package = pkgs.nerdfonts;
              name = "FiraCode Nerd Font Mono";
          };
          monospace = {
              package = pkgs.nerdfonts;
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
