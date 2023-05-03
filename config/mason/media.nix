{ config, pkgs, lib, ... }:

{
  programs.discocss = {
      enable = true;
  };
  programs.mpv = {
      enable = true;
      config = {
          no-input-default-bindings = "";
      };
      bindings = {
          SPACE = "cycle pause";
          f = "cycle fullscreen";
          "," = "add volume -2";
          "." = "add volume +2";
          h = "seek -60";
          j = "seek -10";
          k = "seek 10";
          l = "seek 60";
      };
      scripts = with pkgs.mpvScripts; [
          sponsorblock
          mpris
          autoload
          uosc
          thumbnail
      ];
  };

  programs.zathura = {
      enable = true;
  };

  services.mpd = {
    enable = true;
    musicDirectory = "/home/mason/Music";
    network = {
      startWhenNeeded = true;
    };
  };

  services.mpd-discord-rpc.enable = true;
  services.mpd-mpris.enable = true;
  services.mpris-proxy.enable = true;

  programs.ncmpcpp = {
    enable = true;
    bindings = [
      { key = "j"; command = "scroll_down"; }
      { key = "k"; command = "scroll_up"; }
      { key = "J"; command = [ "select_item" "scroll_down" ]; }
      { key = "K"; command = [ "select_item" "scroll_up" ]; }
    ];
    settings = {
      playlist_editor_display_mode = "columns";
      search_engine_display_mode = "columns";
      browser_display_mode = "columns";
      playlist_display_mode = "columns";
      colors_enabled = "yes";
      main_window_color = "white";
      header_window_color = "cyan";
      volume_color = "green";
      statusbar_color = "white";
      progressbar_color = "cyan";
      progressbar_elapsed_color = "white";
      current_item_prefix = "$(blue)$r|";
      current_item_suffix = "$/r$(end)";
      current_item_inactive_column_prefix = "$(cyan)$r";
      song_columns_list_format = "(10)[blue]{l} (30)[green]{t} (30)[magenta]{a} (30)[yellow]{b}";
      song_list_format = "{$7%a - $9}{$5%t$9}|{$5%f$9}$R{6%b $9}{$3%l$9}";
      user_interface = "alternative";
      alternative_header_first_line_format = "$0$aqqu$/a {$6%a$9 - }{$3%t$9}|{$3%f$9} $atqq$/a$9";
      alternative_header_second_line_format = "{{$4%b$9}{ [$8%y$9]}}|{$4%D$9}";
      progressbar_look = "=>-";
      now_playing_prefix = "*";
      selected_item_prefix = ">";
    };
  };
}
