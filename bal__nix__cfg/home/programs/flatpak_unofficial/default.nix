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

    # Unorganized
    "com.axosoft.GitKraken"
    "com.calibre_ebook.calibre"
    "com.github.PintaProject.Pinta"
    "com.github.Rosalie241.RMG"
    "com.github.ahrm.sioyek"
    "com.github.k4zmu2a.spacecadetpinball"
    "com.github.libresprite.LibreSprite"
    #"com.github.marhkb.Pods"
    "com.github.tchx84.Flatseal"
    "com.logseq.Logseq"
    "com.microsoft.Edge"
    "com.snes9x.Snes9x"
    "com.spotify.Client"
    "com.zettlr.Zettlr"
    "io.github.flattool.Warehouse"
    "io.github.punesemu.puNES"
    "io.github.shiftey.Desktop"
    "io.lmms.LMMS"
    "io.mgba.mGBA"
    "io.mpv.Mpv"
    "it.mijorus.gearlever"
    "md.obsidian.Obsidian"
    #"net.davidotek.pupgui2" # ProtonUp-Qt
    "net.kuribo64.melonDS"
    "org.ardour.Ardour"
    "org.audacityteam.Audacity"
    "org.duckstation.DuckStation"
    "org.gnome.Calculator"
    "org.gnome.Cheese"
    "org.gnome.Shotwell"
    "org.gnome.clocks"
    "org.gnome.gitg"
    "org.gtk.Gtk3theme.Breeze"
    #"org.kde.gwenview" # udah ke install
    "org.kde.haruna"
    "org.kde.kcalc"
    "org.kde.kdenlive"
    "org.kde.kommit"
    #"org.kde.okular"
    "org.keepassxc.KeePassXC"
    "org.libreoffice.LibreOffice"
    "org.libretro.RetroArch"
    "org.onlyoffice.desktopeditors"
    "org.ppsspp.PPSSPP"
    "org.qbittorrent.qBittorrent"
    "org.qownnotes.QOwnNotes"
    "org.signal.Signal"
    "org.telegram.desktop"
    "org.videolan.VLC"
    "org.zim_wiki.Zim"
    "us.zoom.Zoom"
  ];
}
