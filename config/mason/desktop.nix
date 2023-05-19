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
      "exec-once=waybar\n" +
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

  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      postPatch = ''
        sed -i 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp
      '';
    });
    #systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 20;
        modules-left = [ "user" "wlr/workspaces" "mpris" "backlight" ];
        modules-center = [ "hyprland/window"];
        modules-right = [ "tray" "wireplumber" "network" "upower" "clock" ];
        "user" = {
          format = "{user}";
          interval = 60;
          height = 30;
          width = 30;
          icon = true;
        };
        "wireplumber" = {
          format = "{volume}% {icon}";
          format-muted = " ";
          on-click = "volumectl toggle-mute";
          format-icons = [ " " " " " " ];
        };
        "upower" = {
          icon-size = 20;
          hide-if-empty = false;
        };
        "network" = {
          format = "{ifname}";
          format-wifi = "{essid} ({signalStrength}%)  ";
          format-ethernet = "{ipaddr}/{cidr}  ";
          format-disconnected = "";
        };
        "wlr/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          sort-by-number = true;
        };
        "mpris" = {
            format = "{player_icon} {dynamic}";
            format-paused = "{status_icon} <i>{dynamic}</i>";
            player-icons = {
                default = "";
                mpv = "🎵";
            };
            status-icons = {
                paused = "";
            };
        };
      };
    };
  };


  services.network-manager-applet.enable = true;

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
      extraConfig = ''
          config.tab_bar_at_bottom = true
          config.show_new_tab_button_in_tab_bar = false
          config.hide_tab_bar_if_only_one_tab = true

          return config 
      '';
  };

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
      "text/plain" = [ "emacs.desktop" ];
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
