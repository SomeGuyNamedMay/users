{config, lib, pkgs, stylix, ...}:

{
  stylix = {
  #    image = pkgs.fetchurl {
  #        url = "https://dl.dropboxusercontent.com/s/26outp2w90fw4bl/ffxiv-wallpaper.jpg?dl=0";
  #        sha256 = "I8vEvC2R68ToXDLD/ZYK93NXpxeWw84btX7Spfajuec=";
  #    };
      wallpaper = config.lib.stylix.mkAnimation {
          animation = ../../resources/gif/biker-with-girl.gif;
          polarity = "dark";
          override = {
 #             base00 = "ffffff";
          };
      };
      #image = ../../resources/static/log-horizon.jpg;
      #override = {
      #    base00 = "ffffff";
      #    base01 = "ffffff";
      #    base02 = "ffffff";
      #    base03 = "ffffff";
      #    base04 = "ffffff";
      #    base05 = "ffffff";
      #    base06 = "ffffff";
      #    base07 = "ffffff";
      #    base08 = "ffffff";
      #    base09 = "ffffff";
      #    base0A = "ffffff";
      #    base0B = "ffffff";
      #    base0C = "ffffff";
      #    base0D = "ffffff";
      #    base0E = "ffffff";
      #    base0F = "ffffff";
      #};
      fonts = {
          serif = {
              package = pkgs.julia-mono;
              name = "JuliaMono";
          };
          sansSerif = {
              package = pkgs.julia-mono;
              name = "JuliaMono";
          };
          monospace = {
              package = pkgs.julia-mono;
              name = "JuliaMono";
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
