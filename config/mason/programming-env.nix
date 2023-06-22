{ pkgs, config, lib, ... }: {

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [ rust-lang.rust-analyzer ];
  };
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-unstable-pgtk;
    extraConfig = builtins.readFile ./config.el;
    extraPackages = epkgs:
      with epkgs; [
        # text editing and navigation
        meow
        origami
        # fonts
        all-the-icons
        all-the-icons-completion
        all-the-icons-dired
        all-the-icons-ibuffer
        rainbow-mode
        #ui changes
        spaceline
        spaceline-all-the-icons
        vertico
        corfu
        orderless
        dashboard
        #general stuff for programming languages
        lsp-mode
        lsp-ui
        flycheck
        #programming language/proof assistent specific stuff
        nix-mode
        haskell-mode
        rust-mode
        agda2-mode
        proof-general
      ];
  };
}
