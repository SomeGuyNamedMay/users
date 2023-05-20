{ pkgs, lib, config, ... }:

{
  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    TERMINAL = "wezterm";
    GTK_CSD = "0";
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    zplug.plugins = [
      {
        name = "arzzen/calc.plugin.zsh";
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
      extraPackages = with pkgs.bat-extras; [
          batdiff
          batman
      ];
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

  #programs.bat = {
  #  enable = true;
  #};

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
