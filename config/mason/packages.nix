{pkgs, config, lib, ...}:
let
  pythonPackages = p: with p; [
    dbus-python
    python-lsp-server
  ];
in
{
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "steam"
        "steam-original"
        "steam-run"
        "minecraft-launcher"
        "osu-lazer"
        "discord"
        "dwarf-fortress"
    ];

    home.packages = with pkgs; [
        bemenu grim
        gnome.file-roller
        #games
        minecraft lutris gamescope xivlauncher
        steam onscripter-en gtkcord4 osu-lazer
        blesh airshipper (dwarf-fortress-packages.dwarf-fortress-full.override {
            enableFPS = true;
            enableIntro = true;
        }) citra desmume dolphin-emu pcsx2 pcsxr ppsspp rpcs3
        rofi-mpd rofi-bluetooth rofi-power-menu rofi-systemd wtype
        github-desktop
        #media
        youtube-tui yt-dlp ani-cli
        swaylock kid3 mpdevil
        xfce.thunar imv evince pavucontrol helvum
        blueberry wlogout zathura gimp fractal neochat gotktrix
        libreoffice 
        openscad cura 
        xdg-utils mpvpaper 
        #shell stuff
        thefuck tldr tremc
        cachix aria2 jetbrains.idea-community
        # text stuff
        texlive.combined.scheme-medium texlab emacs-all-the-icons-fonts dejavu_fonts dejavu_fontsEnv xits-math nerdfonts
        ##ltex-ls pandoc
        #config format stuff
        nil nixfmt taplo yaml-language-server marksman multimarkdown ispell
        #programming stuff
        git clang astyle
        maven openjdk19
        (python3.withPackages pythonPackages) coq agda idris2
    ] ++ (with rubyPackages_3_1; [
  ruby rufo
  solargraph
]) ++ (with nodePackages; [
  typescript-language-server
  vscode-langservers-extracted  
]) ++ (with luajitPackages; [
  lua stylua
  lua-lsp
]);
}
