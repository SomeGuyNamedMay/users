{config, lib, pkgs, ...}:
{
  programs.qutebrowser = {
      enable = true;
      package = pkgs.qutebrowser-qt6;
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
