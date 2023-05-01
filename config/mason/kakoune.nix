{pkgs, lib, config, ...}:
let
  kakoune-idris = pkgs.kakouneUtils.buildKakounePluginFrom2Nix {
      pname = "kakoune-idris";
      version = "0.0.0";
      src = pkgs.fetchFromGitHub {
          owner = "stoand";
          repo = "kakoune-idris";
          rev = "bf1d1e34229e71c27b33dec00655b03b9679634c";
          sha256 = "EeRAF5S4az7ikQkLO1JeIkEzPAb9QPhW2fhAjSEE4wI=";
      };
      meta.homepage = "https://github.com/stoand/kakoune-idris/";
  };
  kakoune-coq = pkgs.kakouneUtils.buildKakounePluginFrom2Nix {
      pname = "Coqoune";
      version = "0.0.0";
      src = pkgs.fetchFromGitHub {
          owner = "Guest0x0";
          repo = "coqoune";
          rev = "2b79631b57044387c24372687b8b8bd7dd29ad17";
          sha256 = "daCL0ntqgf07r4a7OVjbJLhwRoeQixdyjO6dW8N4mVk=";
      };
      meta.homepage = "https://github.com/Guest0x0/coqoune";
  };
in
{
    programs.kakoune = {
        enable = true;
        config = {
            hooks = [
                {
                    name = "WinSetOption";
                    group = "global";
                    option = "filetype=(rust|c|cpp|haskell)";
                    commands = "lsp-enable-window";
                }
                {
                    name = "WinSetOption";
                    group = "global";
                    option = "filetype=(latex|haskell)";
                    commands = "map window insert <a-l> λ";
                }
            ];
            numberLines.enable = true;
            numberLines.highlightCursor = true;
            numberLines.relative = true;
            ui.assistant = "cat";
            ui.setTitle = true;
            ui.statusLine = "top";
            wrapLines.enable = true;
        };
        plugins = with pkgs.kakounePlugins; [
            kak-lsp
            kak-fzf
            case-kak
            kak-ansi
            powerline-kak
            kakoune-idris
            kakoune-coq
            auto-pairs-kak
            openscad-kak
            kakoune-rainbow
            rep
        ];
        extraConfig = ''
        eval %sh{kak-lsp --config ${./kak-lsp.toml} --kakoune -s $kak_session}
        powerline-start
        ansi-enable
        '';
    };
}
