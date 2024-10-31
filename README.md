# bal_cfg

Powered by `nix`, `NixOS`, and `flake.nix`.

## Quickstart

Ceuk [ieu](https://discourse.nixos.org/t/can-i-use-flakes-within-a-git-repo-without-committing-flake-nix/18196/5) and [ieu]:
> Here’s a neat workaround:
>
> - Tell `git` to track `flake.nix` but without adding it:
>   - `git add --intent-to-add flake.nix`
> - Tell `git` to assume that `flake.nix` doesn’t have any changes:
>   - `git update-index --assume-unchanged flake.nix`
>
> - This way you end up with a clean `git` status,
>   - but `flake.nix` still being tracked by `git`
>   - and therefore accessible to Nix.
>   - The only restriction is
>     - that you can’t do `git` operations
>       - which would modify/remove the flake.nix
>
> This sounds perfect for a local workaround.

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
