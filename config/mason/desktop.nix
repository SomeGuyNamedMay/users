{ pkgs, lib, config, ... }: # my-wallpapers, ... }:

{
  xsession.enable = true;
  xsession.windowManager.i3.enable = true;
  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 32;
    gtk.enable = true;
  };

  services.gnome-keyring.enable = true;

  gtk = {
    enable = true;
    iconTheme = {
      name = "Zafiro-icons-Dark";
      package = pkgs.zafiro-icons;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style.package = pkgs.adwaita-qt;
    style.name = "adwaita";
  };

  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = { button-layout = "menu:appmenu"; };
  };

  services.gammastep = {
      enable = true;
      provider = "geoclue2";
      tray = true;
      dawnTime = "6:00-7:45";
      duskTime = "18:35-20:15";
  };

  wayland.windowManager.sway = {
      enable = true;
      package = pkgs.swayfx;
      config = {
          modifier = "Mod4";
          menu = "${pkgs.rofi-wayland}/bin/rofi -show";
          gaps = {
              inner = 10;
              outer = 10;
          };
          bars = [];
      };
      extraConfig = ''
        include ${./swayfx-config}
      '';
    wrapperFeatures.gtk = true;
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      # needs qt5.qtwayland in systemPackages
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      # Fix for some Java AWT applications (e.g. Android Studio),
      # use this if they aren't displayed properly:
      export _JAVA_AWT_WM_NONREPARENTING=1
      export XDG_CURRENT_DESKTOP=Sway
    '';
  };

  services.clipmenu = {
      enable = true;
      launcher = "rofi";
  };

  programs.waybar = {
      enable = true;
      systemd.enable = true;
      settings = {
          mainBar = {
              layer = "top";
              position = "top";
              height = 30;
              modules-left = [
                  "user"
                  "sway/workspaces"
              ];
              modules-center = [
                  "sway/window"
              ];
              modules-right = [
                  "upower"
                  "clock"
              ];
              "sway/workspaces" = {
                  persistent_workspaces = {
                      "1" = [];
                      "2" = [];
                      "3" = [];
                      "4" = [];
                      "5" = [];
                  };
              };
              "sway/window" = {
                  icon = true;
              };
          };
      };
  };

  #services.swayidle = {
  #    enable = true;
  #    events = [
  #        {
  #            event = "before-sleep";
  #            command = "${pkgs.swaylock}/bin/swaylock";
  #        }
  #        {
  #            event = "lock";
  #            command = "lock";
  #        }
  #    ];
  #    timeouts = [
  #        {
  #            timeout = 600;
  #            command = "${pkgs.swaylock}/bin/swaylock -fF";
  #        }
  #    ];
  #    systemdTarget = "graphical-session.target";
  #};


  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.foot}/bin/foot";
    plugins = with pkgs; [
        rofi-top
        rofi-emoji
        rofi-calc
        rofi-pulse-select
        rofi-file-browser
    ];
    extraConfig = {
      modi = "drun,run";
      sidebar-mode = true;
      show-icons = true;
      icon-theme = "Nordzy";
      display-run = "";
      display-drun = "";
      display-window = "﩯";
    };
  };

  programs.wlogout = { enable = true; };
  services.avizo = { enable = true; };


  programs.foot.enable = true;

  services.mako = { enable = true; };
  services.udiskie.enable = true;
  services.poweralertd.enable = true;

  xdg.enable = true;
  xdg.desktopEntries = {
    imv = {
      name = "Imv";
      genericName = "Image Viewer";
      exec = "imv %U";
      terminal = false;
      mimeType = [ "image/jpeg" "image/png" ];
    };
  };
  xdg.mime.enable = true;
  xdg.mimeApps = {
    enable = true;
    associations.added = {
        "x-scheme-handler/http" = "qutebrowser.desktop";
        "x-scheme-handler/https" = "qutebrowser.desktop";
        "x-scheme-handler/chrome" = "qutebrowser.desktop";
        "text/html" = "qutebrowser.desktop";
        "application/x-extension-htm" = "qutebrowser.desktop";
        "application/x-extension-html" = "qutebrowser.desktop";
        "application/x-extension-shtml" = "qutebrowser.desktop";
        "application/xhtml+xml" = "qutebrowser.desktop";
        "application/x-extension-xhtml" = "qutebrowser.desktop";
        "application/x-extension-xht" = "qutebrowser.desktop";
    };
    defaultApplications = {
      "image/png" = [ "imv.desktop" ];
      "image/jpeg" = [ "imv.desktop" ];
      "image/gif" = [ "imv.desktop" ];
      "application/pdf" = [ "org.pwmt.zathura-pdf-mupdf.desktop" ];
      "text/plain" = [ "Helix.desktop" ];
      "inode/directory" = [ "thunar.desktop" ];
      "x-scheme-handler/http" = [ "qutebrowser.desktop" ];
      "x-scheme-handler/https" = [ "qutebrowser.desktop" ];
      "x-scheme-handler/chrome" = [ "qutebrowser.desktop" ];
      "text/html" = [ "qutebrowser.desktop" ];
      "application/x-extension-htm" = [ "qutebrowser.desktop" ];
      "application/x-extension-html" = ["qutebrowser.desktop"];
      "application/x-extension-shtml" = ["qutebrowser.desktop"];
      "application/xhtml+xml" = ["qutebrowser.desktop"];
      "application/x-extension-xhtml" = ["qutebrowser.desktop"];
      "application/x-extension-xht" = ["qutebrowser.desktop"];
    };
  };

  services.kdeconnect = {
      enable = true;
      indicator = true;
  };
  services.flameshot = {
      enable = true;
      settings = {
          General = {
              showStartupLaunchMessage = false;
          };
      };
  };
}
