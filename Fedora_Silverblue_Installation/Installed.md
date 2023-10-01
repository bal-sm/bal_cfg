# Fedora Silverblue Installation

`rpm-ostree status`:

```
State: idle
Deployments:
● fedora:fedora/38/x86_64/kinoite
                  Version: 38.20230926.0 (2023-09-26T00:59:51Z)
               BaseCommit: 0d90e53d8bf2d9d013e110d6cb1c7a453dd962d5eaeca840351a6dcc5fd36d87
             GPGSignature: Valid signature by 6A51BBABBA3D5467B6171221809A8D7CEB10B464
      RemovedBasePackages: libavfilter-free libavformat-free libpostproc-free libswresample-free libavutil-free libswscale-free libavcodec-free 6.0-4.fc38
                           mesa-va-drivers 23.1.7-1.fc38
          LayeredPackages: bottles distrobox ebook-tools ffmpeg git-lfs github-desktop gnome-software gnome-themes-extra
                           gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-ugly gstreamer1-vaapi hub insync
                           insync-dolphin java-latest-openjdk.x86_64 kate kvantum mesa-va-drivers-freeworld mesa-vdpau-drivers-freeworld nodejs
                           poetry pre-commit rpmfusion-free-release rpmfusion-nonfree-release starship strawberry tldr vlc wine winetricks zsh
```

> `VSCode` mah lewat `Nix` `home-manager` aja. Soalnya biar gampang switch ke `macOS` nya.

`flatpak list --columns=application,name,branch`:

```
Application ID                                           Name                                                 Branch
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
io.lmms.LMMS                                             LMMS                                                 stable
io.mgba.mGBA                                             mGBA                                                 stable
io.mpv.Mpv                                               mpv                                                  stable
md.obsidian.Obsidian                                     Obsidian                                             stable
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
org.gnome.Cheese                                         Cheese                                               stable
org.gnome.Platform                                       GNOME Application Platform version 44                44
org.gnome.Shotwell                                       Shotwell                                             stable
org.gnome.clocks                                         Clocks                                               stable
org.gtk.Gtk3theme.Adwaita-dark                           Adwaita dark GTK theme                               3.22
org.gtk.Gtk3theme.Breeze                                 Breeze GTK theme                                     3.22
org.kde.Platform                                         KDE Application Platform                             5.15-21.08
org.kde.Platform                                         KDE Application Platform                             5.15-22.08
org.kde.Platform                                         KDE Application Platform                             6.4
org.kde.Platform                                         KDE Application Platform                             6.5
org.kde.elisa                                            Elisa                                                stable
org.kde.kdenlive                                         Kdenlive                                             stable
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