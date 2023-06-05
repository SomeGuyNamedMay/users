{ pkgs, lib, config, ... }:

{
  home.sessionVariables = {
    TERMINAL = "foot";
    GTK_CSD = "0";
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    defaultKeymap = "viins";
    dotDir = ".config/zsh";
    plugins = [
        {
            name = "auto-notify";
            src = pkgs.fetchFromGitHub {
                owner = "MichaelAquilina";
                repo = "zsh-auto-notify";
                rev = "dad1e61c71af047e8f07c40b00611a31290be533";
                sha256 = "wLEVhr/DKEH8zZajD0RYYKMQV9+vIltvPNLYorgRuGY=";
            };
        }
        {
            name = "zsh-autopair";
            src = pkgs.fetchFromGitHub {
                owner = "hlissner";
                repo = "zsh-autopair";
                rev = "396c38a7468458ba29011f2ad4112e4fd35f78e6";
                sha256 = "PXHxPxFeoYXYMOC29YQKDdMnqTO0toyA7eJTSCV6PGE=";
            };
        }
        {
            name = "colorize";
            src = pkgs.fetchFromGitHub {
                owner = "zpm-zsh";
                repo = "colorize";
                rev = "954ab336ae736e2193c7369f5b28a3c40be98b16";
                sha256 = "AYMeTUW3hzgiydohCekimKfzfwrdlbUpGsAvfE6AJ18=";
            };
        }
        {
            name = "colored-man-pages";
            src = pkgs.fetchFromGitHub {
                owner = "ael-code";
                repo = "zsh-colored-man-pages";
                rev = "57bdda68e52a09075352b18fa3ca21abd31df4cb";
                sha256 = "087bNmB5gDUKoSriHIjXOVZiUG5+Dy9qv3D69E8GBhs=";
            };
        }
        {
            name = "dircycle";
            src = pkgs.fetchFromGitHub {
                owner = "michaelxmcbride";
                repo = "zsh-dircycle";
                rev = "96ff0e884077d19904092b848cfd2512a42d659e";
                sha256 = "ZVbuCoQpRgXDCvTakYZ9hfIaKmaPU9dI3rjrLqFqJkE=";
            };
        }
    ];
  };

  programs.nushell = {
    enable = true;
    extraConfig = ''
      source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/nix/nix-completions.nu
      source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/git/git-completions.nu
      source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/ani-cli/ani-cli-completions.nu
      source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/cargo/cargo-completions.nu
    '';
  };

  programs.bat = {
      enable = true;
  };

  programs.tmux = {
      enable = true;
  };

  programs.helix = {
    enable = true;
    settings = {
      editor = {
        bufferline = "multiple";
        cursorline = true;
        auto-format = true;
        color-modes = true;
        indent-guides.render = true;
      };
    };
  };

  programs.gh = {
    enable = true;
    enableGitCredentialHelper = true;
  };
  programs.git = {
    enable = true;
    userName = "SomeGuyNamedMy";
    userEmail = "mfdear444@gmail.com";
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    #enableNushellIntegration = true;
  };

  programs.lsd = {
    enable = true;
    enableAliases = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    settings = fromTOML (builtins.readFile ./starship.toml);
  };
}
