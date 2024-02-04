# <https://github.com/gmodena/nix-flatpak>
# -----
# TBA aja, kapan-kapan

{ ... }:

{
  services.flatpak.packages = [
    # Browsers
    { appId = "org.mozilla.firefox"; origin = "flathub";  }
    "com.google.Chrome"

    # Emulators
    "dev.bsnes.bsnes"

    # ...
  ];
}
