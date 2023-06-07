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
        bemenu grim ffmpeg
        onagre
        #games
        minecraft lutris gamescope xivlauncher
        steam onscripter-en gtkcord4 osu-lazer
        blesh airshipper (dwarf-fortress-packages.dwarf-fortress-full.override {
            enableFPS = true;
            enableIntro = true;
        }) citra desmume dolphin-emu pcsx2 pcsxr ppsspp rpcs3
        rofi-mpd rofi-bluetooth rofi-power-menu rofi-systemd wtype
        #media
        youtube-tui yt-dlp ani-cli headlines
        swaylock kid3 mpdevil soundux discord streamlink-twitch-gui-bin
        xfce.thunar imv evince pavucontrol 
        blueberry zathura gimp neochat libreoffice
        openscad cura 
        xdg-utils mpvpaper 
        #shell stuff
        thefuck tldr tremc
        cachix aria2 chatgpt-cli

        # text stuff
        texlive.combined.scheme-medium texlab
        emacs-all-the-icons-fonts xits-math nerdfonts
        ##ltex-ls pandoc
        #config format stuff
        nil nixfmt taplo yaml-language-server marksman multimarkdown ispell
        #programming stuff
        git 
        # compiled languages
        cargo rustc rust-analyzer rustfmt 
        clang clang-tools lldb astyle
        ghc cabal-install stack haskell-language-server
        zig zls ldc dub
        # half compiled monstrocities
        openjdk19 maven
        dotnet-sdk omnisharp-roslyn netcoredbg
        # scripting languages
        ruby rufo solargraph
        nodePackages.typescript-language-server nodePackages.vscode-langservers-extracted
        lua stylua lua-language-server
        (python3.withPackages pythonPackages)
        # proof assistent stuff
        coq agda idris2
        libsForQt5.kpeoplevcard
        libsForQt5.kcontacts
        libsForQt5.kpeople
        chroma moar
    ];
}
