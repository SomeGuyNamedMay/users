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
    settings = {
      general = {
          sensitivity = 1.0;
          gaps_in = 5;
          gaps_out = 5;
          border_size = 3;
          apply_sens_to_raw = 0;
          resize_on_border = true;
      };
      decoration = {
          rounding = 8;
          drop_shadow = true;
          shadow_range = 4;
          shadow_render_power = 3;
      };
      animations = {
          enabled = true;
          animation = [
            "windowsIn,1,6,default,slide"
            "windowsOut,1,6,default,slide"
            "windowsMove,1,6,default,slide"
            "workspaces,1,6,pop,fade"
          ];
          bezier = "pop,0.91,0.25,0.06,0.9";
      };
      blurls = [
          "gtk-layer-shell"
          "ironbar"
          "rofi"
          "notifications"
          "wlogout"
      ];
      bind = [
        "SUPER,Q,killactive,"
        "SUPER,F,fullscreen,"
        "SUPER,M,exit,"
        "SUPER,V,togglefloating,"
        "SUPER,H,movefocus,l"
        "SUPER,L,movefocus,r"
        "SUPER,K,movefocus,u"
        "SUPER,J,movefocus,d"
        "SUPERALT,H,movewindow,l"
        "SUPERALT,L,movewindow,r"
        "SUPERALT,K,movewindow,u"
        "SUPERALT,J,movewindow,d"

        # move to workspace
        "SUPER,1,workspace,1"
        "SUPER,2,workspace,2"
        "SUPER,3,workspace,3"
        "SUPER,4,workspace,4"
        "SUPER,5,workspace,5"
        "SUPER,6,workspace,6"
        "SUPER,7,workspace,7"
        "SUPER,8,workspace,8"
        "SUPER,9,workspace,9"
        "SUPER,0,workspace,10"

        # move window to workspace
        "SUPERSHIFT,1,movetoworkspace,1"
        "SUPERSHIFT,2,movetoworkspace,2"
        "SUPERSHIFT,3,movetoworkspace,3"
        "SUPERSHIFT,4,movetoworkspace,4"
        "SUPERSHIFT,5,movetoworkspace,5"
        "SUPERSHIFT,6,movetoworkspace,6"
        "SUPERSHIFT,7,movetoworkspace,7"
        "SUPERSHIFT,8,movetoworkspace,8"
        "SUPERSHIFT,9,movetoworkspace,9"
        "SUPERSHIFT,0,movetoworkspace,10"

        # mouse keybindings
        "SUPER,mouse_down,workspace,e+1"
        "SUPER,mouse_up,workspace,e-1"

        # misc
        "SUPER,Return,exec,wezterm"
        "SUPER,Space,exec,rofi -show"
        ",XF86AudioRaiseVolume,exec,volumectl -u up"
        ",XF86AudioLowerVolume,exec,volumectl -u down"
        ",XF86AudioMute,exec,volumectl toggle-mute"
        ",XF86AudioMicMute,exec,volumectl -m toggle-mute"
        ",XF86MonBrightnessUp,exec,lightctl up"
        ",XF86MonBrightnessDown,exec,lightctl down"
        "SUPER,D,exec,swaync-client --toggle-panel"
      ];
      binde = [
        "SUPERSHIFT,H,resizeactive, -10 0" 
        "SUPERSHIFT,L,resizeactive, 10 0" 
        "SUPERSHIFT,K,resizeactive, 0 -10" 
        "SUPERSHIFT,J,resizeactive, 0 10" 
      ];
      monitor = ",highrr,auto,1";
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    systemd.enable = true;
    config = {
      modifier = "Mod4";
      menu = "${pkgs.rofi-wayland}/bin/rofi -show";
      gaps = {
        inner = 10;
        outer = 10;
      };
      bars = [ ];
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

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  services.clipmenu = {
    enable = true;
    launcher = "rofi";
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.wezterm}/bin/wezterm";
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


  programs.rio = {
    enable = true;
    settings = {
      performance = "High";
      navigation = {
        mode = "CollapsedTab";
        clickable = true;
      };
    };
  };
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      return {
          hide_tab_bar_if_only_one_tab = true
      }
    '';
  };

  services.mako = { enable = true; };
  services.udiskie.enable = true;
  services.poweralertd.enable = true;

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    extraConfig = {
      XDG_PROJECT_DIR = "${config.home.homeDirectory}/Projects";
    };
  };
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
      "application/x-extension-html" = [ "qutebrowser.desktop" ];
      "application/x-extension-shtml" = [ "qutebrowser.desktop" ];
      "application/xhtml+xml" = [ "qutebrowser.desktop" ];
      "application/x-extension-xhtml" = [ "qutebrowser.desktop" ];
      "application/x-extension-xht" = [ "qutebrowser.desktop" ];
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
