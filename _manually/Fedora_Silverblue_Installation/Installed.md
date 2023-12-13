# Fedora Silverblue Installation

## `rpm-ostree status`

```
State: idle
Deployments:
● fedora:fedora/39/x86_64/kinoite
                  Version: 39.20231205.0 (2023-12-05T01:04:12Z)
               BaseCommit: 694f995d4b7ca42e87b393ff3058949dad660e5f2d692338dacaaceab06cd754
             GPGSignature: Valid signature by E8F23996F23218640CB44CBE75CF5AC418B8E74C
      RemovedBasePackages: firefox firefox-langpacks 120.0.1-1.fc39
                           libavfilter-free libavformat-free libpostproc-free libswresample-free libavutil-free libavcodec-free libswscale-free 6.0.1-1.fc39
                           mesa-va-drivers 23.2.1-2.fc39
          LayeredPackages: codium-insiders distrobox ebook-tools ffmpeg git-lfs gnome-software gnome-themes-extra gstreamer1-plugins-bad-free-extras
                           gstreamer1-plugins-bad-freeworld gstreamer1-plugins-ugly gstreamer1-vaapi insync insync-dolphin java-1.8.0-openjdk.x86_64
                           java-17-openjdk.x86_64 java-latest-openjdk.x86_64 kate kvantum mesa-va-drivers-freeworld mesa-vdpau-drivers-freeworld
                           podman-docker rpmfusion-free-release rpmfusion-nonfree-release strawberry vlc waydroid zsh

...
```

> `VSCode` mah lewat `Nix` `home-manager` aja. Soalnya biar gampang switch ke `macOS` nya.

## `flatpak list --columns=application`

```
Application ID
com.axosoft.GitKraken
com.calibre_ebook.calibre
com.github.PintaProject.Pinta
com.github.Rosalie241.RMG
com.github.ahrm.sioyek
com.github.k4zmu2a.spacecadetpinball
com.github.libresprite.LibreSprite
com.github.tchx84.Flatseal
com.google.ChromeDev
com.logseq.Logseq
com.microsoft.Edge
com.snes9x.Snes9x
com.spotify.Client
com.valvesoftware.Steam
com.zettlr.Zettlr
dev.bsnes.bsnes
io.github.flattool.Warehouse
io.github.punesemu.puNES
io.github.shiftey.Desktop
io.lmms.LMMS
io.mgba.mGBA
io.mpv.Mpv
it.mijorus.gearlever
md.obsidian.Obsidian
net.kuribo64.melonDS
org.ardour.Ardour
org.audacityteam.Audacity
org.audacityteam.Audacity.Codecs
org.duckstation.DuckStation
org.freedesktop.LinuxAudio.Plugins.TAP
org.freedesktop.LinuxAudio.Plugins.swh
org.freedesktop.Platform
org.freedesktop.Platform
org.freedesktop.Platform
org.freedesktop.Platform.Compat.i386
org.freedesktop.Platform.Compat.i386
org.freedesktop.Platform.GL.default
org.freedesktop.Platform.GL.default
org.freedesktop.Platform.GL.default
org.freedesktop.Platform.GL.default
org.freedesktop.Platform.GL.default
org.freedesktop.Platform.GL32.default
org.freedesktop.Platform.GL32.default
org.freedesktop.Platform.GL32.default
org.freedesktop.Platform.GL32.default
org.freedesktop.Platform.ffmpeg-full
org.freedesktop.Platform.ffmpeg-full
org.freedesktop.Platform.ffmpeg_full.i386
org.freedesktop.Platform.openh264
org.freedesktop.Platform.openh264
org.freedesktop.Sdk
org.freedesktop.Sdk
org.freedesktop.Sdk
org.gnome.Cheese
org.gnome.Platform
org.gnome.Platform
org.gnome.Shotwell
org.gnome.clocks
org.gnome.gitg
org.gtk.Gtk3theme.Adwaita-dark
org.gtk.Gtk3theme.Breeze
org.kde.Platform
org.kde.Platform
org.kde.Platform
org.kde.Platform
org.kde.kdenlive
org.kde.kommit
org.keepassxc.KeePassXC
org.libreoffice.LibreOffice
org.libretro.RetroArch
org.mozilla.firefox
org.onlyoffice.desktopeditors
org.ppsspp.PPSSPP
org.ppsspp.PPSSPP.Locale
org.qbittorrent.qBittorrent
org.qownnotes.QOwnNotes
org.signal.Signal
org.telegram.desktop
org.telegram.desktop.webview
org.zim_wiki.Zim
us.zoom.Zoom
```

Note:
> `com.github.Rosalie241.RMG` = N64 Emulator, bisi lupa lagi.

## How to install `nix`

https://github.com/bal-sm/repo-for-learning/blob/fe4cbd94fcd716f0fdf527122b3c6ace12180464/systems/Linux/Personal_Fedora_Silverblue_Installs/Nix-Single-User.md

TODO:
> Nanti ubah pake https://determinate.systems/posts/determinate-nix-installer.

ANOTHER TODO, anj:
> Pake bazzite we gitu ya?

## Notes

Important:
> Use official Fedora distribution of `OpenJDK`, 'cause looks like that is more stable than `nix`'s one.
