{config, lib, pkgs, ...}:
{
  programs.firefox = {
    enable = true;
    profiles = {
        default = {
            bookmarks = [
                {
                   name = "wikipedia";
                   tags = [ "wiki" ];
                   keyword = "wiki";
                   url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
                 }
                 {
                   name = "Nix sites";
                   toolbar = true;
                   bookmarks = [
                     {
                       name = "homepage";
                       url = "https://nixos.org/";
                     }
                     {
                       name = "wiki";
                       tags = [ "wiki" "nix" ];
                       url = "https://nixos.wiki/";
                     }
                   ];
                 }
            ];
            settings = {
                 "browser.startup.homepage" = "https://nixos.org";
                 "browser.search.region" = "GB";
                 "browser.search.isUS" = false;
                 "distribution.searchplugins.defaultLocale" = "en-GB";
                 "general.useragent.locale" = "en-GB";
                 "browser.bookmarks.showMobileBookmarks" = true;
                 "browser.newtabpage.pinned" = [{
                   title = "NixOS";
                   url = "https://nixos.org";
                 }];
            };
        };
    };
  };
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
