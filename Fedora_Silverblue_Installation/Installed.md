# Fedora Silverblue Installation

`rpm-ostree status`:

```
State: idle
Deployments:
● fedora:fedora/38/x86_64/kinoite
                  Version: 38.20231015.0 (2023-10-15T00:58:22Z)
               BaseCommit: 85d9b122f6af9aab7369cb1c2aecfc91500e58df790bac59719429073524b0f8
             GPGSignature: Valid signature by 6A51BBABBA3D5467B6171221809A8D7CEB10B464
      RemovedBasePackages: libavfilter-free libavformat-free libpostproc-free libswresample-free libavutil-free libswscale-free libavcodec-free 6.0-4.fc38
                           mesa-va-drivers 23.1.8-1.fc38
          LayeredPackages: bottles distrobox ebook-tools ffmpeg git-lfs gnome-software gnome-themes-extra gstreamer1-plugins-bad-free-extras
                           gstreamer1-plugins-bad-freeworld gstreamer1-plugins-ugly gstreamer1-vaapi insync insync-dolphin java-1.8.0-openjdk.x86_64
                           java-17-openjdk.x86_64 java-latest-openjdk.x86_64 kate kvantum mesa-va-drivers-freeworld mesa-vdpau-drivers-freeworld
                           rpmfusion-free-release rpmfusion-nonfree-release strawberry vlc wine winetricks zsh

...
```

> `VSCode` mah lewat `Nix` `home-manager` aja. Soalnya biar gampang switch ke `macOS` nya.

`flatpak list --columns=application,name,branch`:

```
Application ID                                           Name                                                 Branch
com.axosoft.GitKraken                                    GitKraken                                            stable
com.calibre_ebook.calibre                                calibre                                              stable
com.github.PintaProject.Pinta                            Pinta                                                stable
com.github.ahrm.sioyek                                   Sioyek                                               stable
com.github.k4zmu2a.spacecadetpinball                     Space Cadet Pinball                                  stable
com.github.libresprite.LibreSprite                       LibreSprite                                          stable
com.github.tchx84.Flatseal                               Flatseal                                             stable
com.google.ChromeDev                                     Google Chrome (unstable)                             stable
com.logseq.Logseq                                        Logseq                                               stable
com.microsoft.Edge                                       Microsoft Edge                                       stable
com.snes9x.Snes9x                                        Snes9x                                               stable
com.valvesoftware.Steam                                  Steam                                                stable
com.zettlr.Zettlr                                        Zettlr                                               beta
dev.bsnes.bsnes                                          bsnes                                                stable
io.github.punesemu.puNES                                 puNES                                                stable
io.github.shiftey.Desktop                                GitHub Desktop                                       stable
io.lmms.LMMS                                             LMMS                                                 stable
io.mgba.mGBA                                             mGBA                                                 stable
io.mpv.Mpv                                               mpv                                                  stable
md.obsidian.Obsidian                                     Obsidian                                             stable
net.kuribo64.melonDS                                     melonDS                                              stable
org.ardour.Ardour                                        Ardour                                               stable
org.audacityteam.Audacity                                Audacity                                             stable
org.audacityteam.Audacity.Codecs                         Codecs                                               stable
org.duckstation.DuckStation                              DuckStation                                          stable
org.freedesktop.LinuxAudio.Plugins.TAP                   TAP-plugins                                          22.08
org.freedesktop.LinuxAudio.Plugins.swh                   SWH                                                  22.08
org.freedesktop.Platform                                 Freedesktop Platform                                 21.08
org.freedesktop.Platform                                 Freedesktop Platform                                 22.08
org.freedesktop.Platform                                 Freedesktop Platform                                 23.08
org.freedesktop.Platform.Compat.i386                     i386                                                 22.08
org.freedesktop.Platform.Compat.i386                     i386                                                 23.08
org.freedesktop.Platform.GL.default                      Mesa                                                 21.08
org.freedesktop.Platform.GL.default                      Mesa                                                 22.08
org.freedesktop.Platform.GL.default                      Mesa (Extra)                                         22.08-extra
org.freedesktop.Platform.GL.default                      Mesa                                                 23.08
org.freedesktop.Platform.GL.default                      Mesa (Extra)                                         23.08-extra
org.freedesktop.Platform.GL32.default                    Mesa                                                 22.08
org.freedesktop.Platform.GL32.default                    Mesa (Extra)                                         22.08-extra
org.freedesktop.Platform.GL32.default                    Mesa                                                 23.08
org.freedesktop.Platform.GL32.default                    Mesa (Extra)                                         23.08-extra
org.freedesktop.Platform.ffmpeg-full                     ffmpeg-full                                          22.08
org.freedesktop.Platform.ffmpeg-full                     ffmpeg-full                                          23.08
org.freedesktop.Platform.ffmpeg_full.i386                i386                                                 22.08
org.freedesktop.Platform.openh264                        openh264                                             2.0
org.freedesktop.Platform.openh264                        openh264                                             2.2.0
org.freedesktop.Sdk                                      Freedesktop SDK                                      23.08
org.gnome.Cheese                                         Cheese                                               stable
org.gnome.Platform                                       GNOME Application Platform version 44                44
org.gnome.Platform                                       GNOME Application Platform version 45                45
org.gnome.Shotwell                                       Shotwell                                             stable
org.gnome.clocks                                         Clocks                                               stable
org.gnome.gitg                                           gitg                                                 stable
org.gtk.Gtk3theme.Adwaita-dark                           Adwaita dark GTK theme                               3.22
org.gtk.Gtk3theme.Breeze                                 Breeze GTK theme                                     3.22
org.kde.Platform                                         KDE Application Platform                             5.15-22.08
org.kde.Platform                                         KDE Application Platform                             6.5
org.kde.elisa                                            Elisa                                                stable
org.kde.kdenlive                                         Kdenlive                                             stable
org.kde.kommit                                           Kommit                                               stable
org.libreoffice.LibreOffice                              LibreOffice                                          stable
org.libretro.RetroArch                                   RetroArch                                            stable
org.onlyoffice.desktopeditors                            ONLYOFFICE Desktop Editors                           stable
org.ppsspp.PPSSPP                                        PPSSPP                                               stable
org.qbittorrent.qBittorrent                              qBittorrent                                          stable
org.qownnotes.QOwnNotes                                  QOwnNotes                                            stable
org.signal.Signal                                        Signal Desktop                                       stable
org.telegram.desktop                                     Telegram Desktop                                     stable
org.telegram.desktop.webview                             Telegram Desktop Webview Add-on                      stable
org.zim_wiki.Zim                                         Zim                                                  stable
us.zoom.Zoom                                             Zoom                                                 stable
```

## Notes

Important
> Use official Fedora distribution of `OpenJDK`, 'cause looks like that is more stable than `nix`'s one.
