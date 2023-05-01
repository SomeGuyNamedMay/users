{ pkgs, config, lib, ... }: {

  programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
          rust-lang.rust-analyzer
      ];
  };

  programs.neovim = {
      enable = true;
      coc.enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraPackages = with pkgs; [
          agda
      ];
      plugins = with pkgs.vimPlugins; [
          agda-vim
      ];
      extraConfig = ''
        let maplocalleader = ","
      '';
  };
  programs.emacs = {
    enable = true;
    package = pkgs.emacsPgtk;
    extraPackages = emacsPackages:
      with emacsPackages; [
        # theming and ui
        ligature
        unicode-fonts
        all-the-icons
        autothemer
        nord-theme
        dirvish
        doom-modeline
        dashboard
        selectrum
        orderless
        prescient
        flycheck
        centaur-tabs
        rainbow-mode
        # keybindings and control
        meow
        smartparens
        aggressive-indent
        ace-window
        origami
        #notetaking stuff
        auctex
        latex-preview-pane
        #math-preview
        markdown-mode
        markdown-preview-mode
        markdownfmt
        #programming language modes and docs
        tldr
        lsp-java
        haskell-mode
        rust-mode
        prop-menu
        idris2-mode
        nix-mode
        lsp-java
        lsp-mode
        lsp-ui
        lsp-origami
        proof-general
        company-coq
        #project management
        projectile
      ];
    extraConfig = builtins.readFile ./init.el;
  };
}
