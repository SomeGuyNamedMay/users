{ pkgs, config, lib, ... }: {

  programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
          rust-lang.rust-analyzer
      ];
  };
}
