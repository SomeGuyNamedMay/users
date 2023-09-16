{ pkgs, config, lib, ... }: {
  programs.helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        editor = {
          auto-save = true;
          bufferline = "multiple";
          color-modes = true;
          lsp = {
            display-inlay-hints = true;
          };
          soft-wrap.enable = true;
        };
      };
  };
}
