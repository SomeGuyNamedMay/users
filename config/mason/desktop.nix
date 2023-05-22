{ pkgs, lib, config, ... }: # my-wallpapers, ... }:

{

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
    platformTheme = "gtk";
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

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    recommendedEnvironment = true;
    xwayland = {
      enable = true;
      hidpi = false;
    };
    nvidiaPatches = false;
    extraConfig = builtins.readFile ./hyprland.conf +
      "bind=SUPER_SHIFT,Q,exec,${pkgs.wlogout}/bin/wlogout\n" +
      "bind=SUPER,SPACE,exec,rofi -show\n";
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

  programs.ironbar = {
      enable = true;
      systemd = true;
      config = {
          position = "top";
          icon_theme = "Zafiro-icons-Dark";
          height = 20;
          anchor_to_edges = true;
          margin.left = 5;
          margin.right = 5;
          start = [
              {
                  type = "focused";
                  show_title = false;
                  icon_size = 20;
              }
              {
                  type = "workspaces";
                  icon_size = 20;
              }
          ];
          center = [
          ];
          end = [
              {
                  type = "tray";
              }
              {
                  type = "music";
                  truncate.mode = "start";
                  truncate.length = 10;
                  truncate.max_length = 10;
              }
              {
                  type = "upower";
              }
              {
                  type = "clock";
                  format = "%r";
              }
          ];
      };
      style = ''
        * {
            font-size = 12px
        }
      '';
  };

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
  programs.wezterm = {
      enable = true;
     # extraConfig = ''
     #     config.tab_bar_at_bottom = true
     #     config.show_new_tab_button_in_tab_bar = false
     #     config.hide_tab_bar_if_only_one_tab = true

     #     return config 
     # '';
  };

 # services.mako = { enable = true; };
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
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/chrome" = "firefox.desktop";
        "text/html" = "firefox.desktop";
        "application/x-extension-htm" = "firefox.desktop";
        "application/x-extension-html" = "firefox.desktop";
        "application/x-extension-shtml" = "firefox.desktop";
        "application/xhtml+xml" = "firefox.desktop";
        "application/x-extension-xhtml" = "firefox.desktop";
        "application/x-extension-xht" = "firefox.desktop";
    };
    defaultApplications = {
      "image/png" = [ "imv.desktop" ];
      "image/jpeg" = [ "imv.desktop" ];
      "image/gif" = [ "imv.desktop" ];
      "application/pdf" = [ "org.pwmt.zathura-pdf-mupdf.desktop" ];
      "text/plain" = [ "emacs.desktop" ];
      "inode/directory" = [ "thunar.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/chrome" = [ "firefox.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "application/x-extension-htm" = [ "firefox.desktop" ];
      "application/x-extension-html" = ["firefox.desktop"];
      "application/x-extension-shtml" = ["firefox.desktop"];
      "application/xhtml+xml" = ["firefox.desktop"];
      "application/x-extension-xhtml" = ["firefox.desktop"];
      "application/x-extension-xht" = ["firefox.desktop"];
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
