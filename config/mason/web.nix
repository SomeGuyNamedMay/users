{config, lib, pkgs, ...}:
{

  programs.qutebrowser = {
    enable = true;
    settings = {
        scrolling.smooth = true;
        qt.highdpi = true;
        tabs.position = "left";
        window.transparent = true;
        spellcheck.languages = [ "en-US" ];
    };
  };
}
