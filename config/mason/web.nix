{config, lib, pkgs, ...}:
{
  programs.qutebrowser = {
    enable = true;
    settings = {
        scrolling.smooth = true;
        qt.highdpi = true;
        tabs.position = "bottom";
        statusbar = {
            position = "top";
        };
        window.transparent = true;
        spellcheck.languages = [ "en-US" ];

        content.blocking.whitelist = [
          "https://xeiaso.net/*"
        ];
    };
    extraConfig = ''
      config.set("content.blocking.enabled", False, "xeiaso.net")
    '';
  };
}
