{ pkgs, lib, config, ... }:

{
  home.sessionVariables = {
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
