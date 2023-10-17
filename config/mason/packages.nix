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
        "discord"
        "vscode"
        "aseprite"
        "osu-lazer-bin"
    ];

    home.packages = with pkgs; [       
        zeal
        #games 
        steam osu-lazer-bin
        rofi-mpd rofi-bluetooth rofi-power-menu rofi-systemd wtype
        #media
        ytfzf ueberzugpp yt-dlp ani-cli crunchy-cli
        ffmpeg
        swaylock kid3 mpdevil discord streamlink-twitch-gui-bin
        xfce.thunar imv evince pavucontrol 
        blueberry zathura gimp neochat tootle libreoffice
        openscad xdg-utils
        #shell stuff
        thefuck tldr tremc
        aria2 chatgpt-cli
        # text stuff
        texlive.combined.scheme-medium texlab ltex-ls 
        ##ltex-ls pandoc
        #config format stuff
        nixd nixfmt taplo yaml-language-server marksman multimarkdown ispell
        #art stuff
        aseprite
        #programming stuff
        git 
        # compiled languages
        cargo rustc rust-analyzer rustfmt 
        clang clang-tools lldb astyle
        ghc cabal-install stack haskell-language-server
        zig zls ldc dub
        # half compiled monstrocities
        openjdk19 maven
        #dotnet-sdk omnisharp-roslyn netcoredbg
        # scripting languages
        ruby rufo solargraph chez
        nodejs
        nodePackages.typescript-language-server nodePackages.vscode-langservers-extracted
        lua stylua lua-language-server
        (python3.withPackages pythonPackages)
        # proof assistent stuff
        coq agda idris2 lean4
        rio
    ];
}
