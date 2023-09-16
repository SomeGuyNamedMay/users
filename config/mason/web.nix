{config, lib, pkgs, ...}:
{
  programs.qutebrowser = {
      enable = true;
      settings = {
          scrolling.smooth = true;
          qt.highdpi = true;
          spellcheck.languages = [
              "en-US"
          ];
          tabs.show = "multiple";
          window.transparent = true;
      };
  };
}
