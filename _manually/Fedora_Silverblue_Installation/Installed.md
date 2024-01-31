# Fedora Silverblue Installation

## `rpm-ostree status` - lagi pake bazzite

```
State: idle
Deployments:
● ostree-image-signed:docker://ghcr.io/ublue-os/bazzite:39
                   Digest: sha256:166528926a9aa695d719322ca9657149210fd9b33123fce4822547942a4c00ab
                Timestamp: 2024-01-25T06:52:58Z
          LayeredPackages: bottles code codium git-lfs insync-dolphin kvantum materia-gtk-theme materia-kde plasma-wallpapers-dynamic zsh
            LocalPackages: insync-3.8.6.50504-fc39.x86_64
                Initramfs: '"-I /etc/crypttab /etc/modprobe.d/amdgpu.conf"'
```

## `rpm-ostree status` - waktu pake kinoite

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

> ~~`VSCode` mah lewat `Nix` `home-manager` aja. Soalnya biar gampang switch ke `macOS` nya.~~

> Lagi mau di `reset` terus pindah ke `bazzite` nih.

Current (Yang atas pending):

```
State: idle
Deployments:
● ostree-unverified-registry:ghcr.io/ublue-os/bazzite:39
                   Digest: sha256:e6244952206b8006397d220389ce2d30e0d953020db46c4b50131209ac05e749
                  Version: 39.20231206.0 (2023-12-07T01:17:30Z)
          LayeredPackages: bottles code codium git-lfs kvantum zsh
```

Mine:
> Belum dipindah-pindahin lagi, + mari kita liat gimana nix implementationnya.

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
com.github.marhkb.Pods
com.github.tchx84.Flatseal
com.google.ChromeDev
com.logseq.Logseq
com.microsoft.Edge
com.obsproject.Studio.Plugin.GStreamerVaapi
com.obsproject.Studio.Plugin.Gstreamer
com.obsproject.Studio.Plugin.OBSVkCapture
com.snes9x.Snes9x
com.spotify.Client
com.zettlr.Zettlr
dev.bsnes.bsnes
io.github.fastrizwaan.WineZGUI
io.github.flattool.Warehouse
io.github.punesemu.puNES
io.github.shiftey.Desktop
io.lmms.LMMS
io.mgba.mGBA
io.mpv.Mpv
it.mijorus.gearlever
md.obsidian.Obsidian
net.davidotek.pupgui2
net.kuribo64.melonDS
org.ardour.Ardour
org.audacityteam.Audacity
org.audacityteam.Audacity.Codecs
org.duckstation.DuckStation
org.freedesktop.LinuxAudio.Plugins.TAP
org.freedesktop.LinuxAudio.Plugins.TAP
org.freedesktop.LinuxAudio.Plugins.swh
org.freedesktop.LinuxAudio.Plugins.swh
org.freedesktop.Platform
org.freedesktop.Platform
org.freedesktop.Platform
org.freedesktop.Platform.Compat.i386
org.freedesktop.Platform.GL.default
org.freedesktop.Platform.GL.default
org.freedesktop.Platform.GL.default
org.freedesktop.Platform.GL.default
org.freedesktop.Platform.GL.default
org.freedesktop.Platform.GL32.default
org.freedesktop.Platform.VulkanLayer.MangoHud
org.freedesktop.Platform.VulkanLayer.OBSVkCapture
org.freedesktop.Platform.VulkanLayer.vkBasalt
org.freedesktop.Platform.ffmpeg-full
org.freedesktop.Platform.ffmpeg_full.i386
org.freedesktop.Platform.openh264
org.freedesktop.Platform.openh264
org.freedesktop.Sdk
org.freedesktop.Sdk
org.freedesktop.Sdk
org.gnome.Calculator
org.gnome.Cheese
org.gnome.Platform
org.gnome.Platform
org.gnome.Shotwell
org.gnome.clocks
org.gnome.gitg
org.gtk.Gtk3theme.Adwaita-dark
org.gtk.Gtk3theme.Breeze
org.gtk.Gtk3theme.Materia
org.gtk.Gtk3theme.Materia-compact
org.gtk.Gtk3theme.Materia-dark
org.gtk.Gtk3theme.Materia-dark-compact
org.gtk.Gtk3theme.Materia-light
org.gtk.Gtk3theme.Materia-light-compact
org.gtk.Gtk3theme.adw-gtk3
org.gtk.Gtk3theme.adw-gtk3-dark
org.kde.KStyle.Adwaita
org.kde.KStyle.Adwaita
org.kde.KStyle.Adwaita
org.kde.Platform
org.kde.Platform
org.kde.Platform
org.kde.Platform
org.kde.gwenview
org.kde.haruna
org.kde.kcalc
org.kde.kdenlive
org.kde.kommit
org.kde.okular
org.keepassxc.KeePassXC
org.libreoffice.LibreOffice
org.libretro.RetroArch
org.mozilla.firefox
org.onlyoffice.desktopeditors
org.ppsspp.PPSSPP
org.qbittorrent.qBittorrent
org.qownnotes.QOwnNotes
org.signal.Signal
org.telegram.desktop
org.telegram.desktop.webview
org.videolan.VLC
org.winehq.Wine.DLLs.dxvk
org.winehq.Wine.gecko
org.winehq.Wine.mono
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
