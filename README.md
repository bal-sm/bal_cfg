# bal_cfg

Powered by `nix`, `NixOS`, and `flake.nix`.

## TODO

1. Build to complete flake-ready `nix` and `NixOS` config.
   - KDE ✔️
   - VSCod(ium) ✔️
     - [x] WAIT! the settings json structure might be wrong.
   - Flatpak with [`nix-flatpak`](https://github.com/gmodena/nix-flatpak) ❌ (kapan-kapan)
   - etc of `home-manager` ✔️
     - `.zshrc` ✔️
   - proper directory structure ✔️
     - [x] eh bentar tapi, let's check it one more time. Udah bagus dan bener da.
   - [x] milestone: `0.7.0` release 🎂 🎊 ✨
2. Test drive with real `NixOS` installation
   - [ ] Don't forget to use `disko`, [Quickstart Guide, here](https://github.com/nix-community/disko/blob/master/docs/quickstart.md),.
     - [ ] Compare <https://github.com/nix-community/disko/blob/master/example/luks-btrfs-subvolumes.nix> and <https://github.com/nix-community/disko/blob/master/example/btrfs-subvolumes.nix>.
       - [ ] Choose which better / Build upon one of them and improve.
     - [ ] Barengi dengan membaca [`NixOS` Manual](https://nixos.org/manual/nixos/stable/).
...
