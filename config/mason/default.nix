{config, lib, pkgs, stylix, ...}:
{
    imports = [
        ./desktop.nix
        ./kakoune.nix
        ./media.nix
        ./packages.nix
        ./programming-env.nix
        ./shell.nix
        ./web.nix
        ./stylix.nix
    ];
}
