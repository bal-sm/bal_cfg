# <https://nixos.org/manual/nixos/unstable/options>
# -----

{ config, pkgs, pkgs-stable, pkgs-unstable, pkgs-unstable-small, apple-fonts, ... }: {

  imports = [
    ./hardware-configuration.nix
    # TODO: Uncomment when `hardware-configuration.nix` is done
    ./disko-config.nix
  ];

  documentation.nixos.enable = true; # aing mah

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  boot = {
    kernelParams = [ "nohibernate" ];
    tmp.cleanOnBoot = true;
    supportedFilesystems = [
      "btrfs"
      "ext4"
      "ntfs"
      "exFAT"
      "FAT"
    ]; # ?: meureun kieu ieu teh maksudna

    loader = {
      #efi.canTouchEfiVariables = true;
      grub = {
        device = "nodev";
        efiSupport = true;
        efiInstallAsRemovable = false; # ketang
        enable = true; # * defaultnya: !config.boot.isContainer . wow. liat di `search.nixos.org`.
        #useOSProber = false;
        timeoutStyle = "menu";
      };
      timeout = 13;
    };
  };

  networking = {
    hostName = "bal-frame-work-13";
    networkmanager.enable = true;
    enableIPv6 = false;
    firewall.enable = false;
  };

  time.timeZone = "Asia/Jakarta";

  i18n.supportedLocales = [ "all" ];

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_MESSAGES = "en_US.UTF-8";
    LC_ADDRESS = "id_ID.UTF-8";
    LC_MEASUREMENT = "C";
    LC_MONETARY = "id_ID.UTF-8";
    LC_NAME = "id_ID.UTF-8";
    LC_NUMERIC = "id_ID.UTF-8";
    LC_PAPER = "id_ID.UTF-8";
    LC_TELEPHONE = "id_ID.UTF-8";
    LC_TIME = "id_ID.UTF-8";
  };

  # console = {
  #   packages = [ pkgs.jetbrains-mono ];
  #   font = "JetBrains Mono";
  #   useXkbConfig = true;
  # };
  # * Disabled 'cause ada `fonts` options tea dibawah.

  services.flatpak.enable = true;

  services.xserver = {
    # <https://nixos.wiki/wiki/KDE>
    # -----

    enable = true;
    #desktopManager.plasma5.enable = true;
  };

  services.displayManager = {
    sddm.enable = true;
    sddm.wayland.enable = true;
    defaultSession = "plasma";
  };

  services.desktopManager.plasma6.enable = true;

  services.pipewire = {
    enable = true;
    package = pkgs.pipewire;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # rtkit is optional for `pipewire` but recommended, cenah
  security.rtkit.enable = true;

  # To fix: KDE things: GTK themes are not applied in Wayland applications
  programs.dconf.enable = true;

  programs.zsh.enable = true;
  # * programs.zsh.package, gak ada.

  users = {
    defaultUserShell = pkgs.zsh;
    users.d = {
      isNormalUser = true;
      description = "d is my account.";
      extraGroups = [
        "root"
        "wheel"
        "flatpak" # ?
      ]; # TODO: Find out more about `extraGroups` and `/etc/group`
    };
  };

  # skipped `programs.steam` things 'cause mau use flatpak instead.

  fonts = {
    # <https://nixos.wiki/wiki/Fonts>
    # -----

    packages = [
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })
      pkgs.noto-fonts
      pkgs.noto-fonts-cjk
      pkgs.noto-fonts-emoji
      pkgs.font-awesome
      pkgs.liberation_ttf
      pkgs.source-han-sans
      pkgs.source-han-serif
      pkgs.source-han-sans-japanese
      pkgs.source-han-serif-japanese
      pkgs.inter
      apple-fonts.packages.${pkgs.system}.sf-pro
      apple-fonts.packages.${pkgs.system}.sf-compact
      apple-fonts.packages.${pkgs.system}.sf-mono
      apple-fonts.packages.${pkgs.system}.sf-arabic
      apple-fonts.packages.${pkgs.system}.ny
      pkgs.fira-go
    ];

    fontconfig = {
      # * readded `fontconfig`.
      enable = true;
      defaultFonts = {
        monospace = ["JetBrainsMono Nerd Font Propo"];
        serif = ["Noto Serif" "Source Han Serif"];
        sansSerif = ["Noto Sans" "Source Han Sans"];
        emoji = ["Noto Color Emoji"];
      };
    };

  };

  environment.systemPackages = [
    # KDE apps
    pkgs.kdePackages.kate # * soalnya zaman Plasma 5, pernah gak ke-install as default.
    pkgs.kdePackages.qtstyleplugin-kvantum

    # GUI apps
    # --------

    # `libreoffice`
    # -------------
    pkgs.libreoffice-qt6-fresh
    # 'libreoffice' dependencies
    pkgs.hunspell
    pkgs.hunspellDicts.en_US

    # CLI apps
    pkgs-stable.nano
    pkgs.nix-index
    pkgs-stable.micro
    pkgs-stable.git
    pkgs-stable.git-lfs
    pkgs-stable.p7zip
    pkgs-stable.distrobox

    # Useful `podman`/'docker' development tools
    pkgs-stable.dive # look into docker image layers
    pkgs-stable.podman-tui # status of containers in the terminal
    #pkgs.docker-compose # start group of containers for dev # ! Bad app.
    # ---
    pkgs-unstable.podman-compose
    # * used 'unstable', soalnya yang 'stable' buggy.
    # TODO: ubah ke 'stable' kalo udah bener.
    # ---
  ];

  programs.firefox = {
    enable = true;
    package = pkgs-unstable.firefox-devedition;
    #nativeMessagingHosts.packages = [ pkgs.kdePackages.plasma-browser-integration ]; # * dupe karena auto dari KDE, kayaknya.
    preferences = {
      # My overrides

      "media.hardwaremediakeys.enabled" = false; # Enable when `plasma-browser-integration` working again.
      "widget.use-xdg-desktop-portal.file-picker" = 1;

      # Betterfox 128.0

      # Fastfox

      # moved aja ke "My overrides .." soalnya pilih beberapa aja

      # Securefox

      # TRACKING PROTECTION
      "browser.contentblocking.category" = "strict";
      "urlclassifier.trackingSkipURLs" = "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com";
      "urlclassifier.features.socialtracking.skipURLs" = "*.instagram.com, *.twitter.com, *.twimg.com";
      #"network.cookie.sameSite.noneRequiresSecure" = true;
      "browser.download.start_downloads_in_tmp_dir" = true;
      "browser.helperApps.deleteTempFileOnExit" = true;
      #"browser.uitour.enabled" = false;
      "privacy.globalprivacycontrol.enabled" = true;

      # OCSP & CERTS / HPKP
      "security.OCSP.enabled" = 0;
      "security.remote_settings.crlite_filters.enabled" = true;
      "security.pki.crlite_mode" = 2;

      # SSL / TLS
      "security.ssl.treat_unsafe_negotiation_as_broken" = true;
      "browser.xul.error_pages.expert_bad_cert" = true;
      "security.tls.enable_0rtt_data" = false;

      # DISK AVOIDANCE
      "browser.privatebrowsing.forceMediaMemoryCache" = true;
      "browser.sessionstore.interval" = 60000; # 1 minute

      # SHUTDOWN & SANITIZING
      "privacy.history.custom" = true;

      # SEARCH / URL BAR
      "browser.urlbar.trimHttps" = true;
      "browser.search.separatePrivateDefault.ui.enabled" = true;
      #"browser.urlbar.update2.engineAliasRefresh" = true;
      #"browser.search.suggest.enabled" = false;
      #"browser.urlbar.suggest.searches" = false;
      #"browser.urlbar.quicksuggest.enabled" = false;
      "browser.urlbar.suggest.quicksuggest.sponsored" = false;
      #"browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
      #"browser.urlbar.groupLabels.enabled" = false;
      #"browser.formfill.enable" = false;
      "security.insecure_connection_text.enabled" = true;
      "security.insecure_connection_text.pbmode.enabled" = true;
      "network.IDN_show_punycode" = true;

      # HTTPS-ONLY MODE
      "dom.security.https_only_mode" = true;
      "dom.security.https_only_mode_error_page_user_suggestions" = true;

      # DNS-over-HTTPS
      "network.trr.mode" = 3;

      # PASSWORDS
      "signon.formlessCapture.enabled" = false;
      "signon.privateBrowsingCapture.enabled" = false;
      "network.auth.subresource-http-auth-allow" = 1;
      "editor.truncate_user_pastes" = false;

      # MIXED CONTENT + CROSS-SITE
      "security.mixed_content.block_display_content" = true;
      "pdfjs.enableScripting" = false;
      "extensions.postDownloadThirdPartyPrompt" = false;

      # HEADERS / REFERERS
      "network.http.referer.XOriginTrimmingPolicy" = 2;

      # CONTAINERS
      "privacy.userContext.ui.enabled" = true;

      # WEBRTC
      "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
      "media.peerconnection.ice.default_address_only" = true;

      # SAFE BROWSING
      "browser.safebrowsing.downloads.remote.enabled" = false;

      # MOZILLA
      #"permissions.default.desktop-notification" = 2;
      #"permissions.default.geo" = 2;
      #"permissions.manager.defaultsUrl" = "";
      #"webchannel.allowObject.urlWhitelist" = "";

      # TELEMETRY
      "datareporting.policy.dataSubmissionEnabled" = false;
      "datareporting.healthreport.uploadEnabled" = false;
      "toolkit.telemetry.unified" = false;
      "toolkit.telemetry.enabled" = false;
      "toolkit.telemetry.server" = "data:,";
      "toolkit.telemetry.archive.enabled" = false;
      "toolkit.telemetry.newProfilePing.enabled" = false;
      "toolkit.telemetry.shutdownPingSender.enabled" = false;
      "toolkit.telemetry.updatePing.enabled" = false;
      "toolkit.telemetry.bhrPing.enabled" = false;
      "toolkit.telemetry.firstShutdownPing.enabled" = false;
      "toolkit.telemetry.coverage.opt-out" = true;
      "toolkit.coverage.opt-out" = true;
      "toolkit.coverage.endpoint.base" = "";
      "browser.newtabpage.activity-stream.feeds.telemetry" = false;
      "browser.newtabpage.activity-stream.telemetry" = false;

      # EXPERIMENTS
      "app.shield.optoutstudies.enabled" = false;
      "app.normandy.enabled" = false;
      "app.normandy.api_url" = "";

      # CRASH REPORTS
      "breakpad.reportURL" = "";
      "browser.tabs.crashReporting.sendReport" = false;
      "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;

      # DETECTION
      #"captivedetect.canonicalURL" = "";
      #"network.captive-portal-service.enabled" = false;
      #"network.connectivity-service.enabled" = false;
      #"dom.private-attribution.submission.enabled" = false;

      # PESKYFOX

      # MOZILLA UI
      "browser.privatebrowsing.vpnpromourl" = "";
      "extensions.getAddons.showPane" = false;
      "extensions.htmlaboutaddons.recommendations.enabled" = false;
      "browser.discovery.enabled" = false;
      "browser.shell.checkDefaultBrowser" = false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
      #"browser.preferences.moreFromMozilla" = false;
      #"browser.tabs.tabmanager.enabled" = false;
      "browser.aboutConfig.showWarning" = false;
      #"browser.aboutwelcome.enabled" = false;

      # THEME ADJUSTMENTS
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "browser.compactmode.show" = true;
      #"browser.display.focus_ring_on_anything" = true);
      #"browser.display.focus_ring_style" = 0;
      #"browser.display.focus_ring_width" = 0;
      #"layout.css.prefers-color-scheme.content-override" = 2;
      #"browser.privateWindowSeparation.enabled" = false;

      # COOKIE BANNER HANDLING
      #"cookiebanners.service.mode" = 1;
      #"cookiebanners.service.mode.privateBrowsing" = 1;

      # FULLSCREEN NOTICE
      #"full-screen-api.transition-duration.enter" = "0 0";
      #"full-screen-api.transition-duration.leave" = "0 0";
      #"full-screen-api.warning.delay" = -1;
      #"full-screen-api.warning.timeout" = 0;

      # URL BAR
      "browser.urlbar.suggest.calculator" = true;
      "browser.urlbar.unitConversion.enabled" = true;
      "browser.urlbar.trending.featureGate" = false;

      # NEW TAB PAGE
      "browser.newtabpage.activity-stream.feeds.topsites" = false;
      "browser.newtabpage.activity-stream.feeds.section.topstories" = false;

      # POCKET
      "extensions.pocket.enabled" = false;

      # DOWNLOADS
      #"browser.download.always_ask_before_handling_new_types" = true;
      #"browser.download.manager.addToRecentDocs" = false;

      # PDF
      "browser.download.open_pdf_attachments_inline" = true;

      # TAB BEHAVIOR
      "browser.bookmarks.openInTabClosesMenu" = false;
      "browser.menu.showViewImageInfo" = true;
      "findbar.highlightAll" = true;
      "layout.word_select.eat_space_to_next_word" = false;

      # My overrides of Fastfox

      # Fastfox

      # WebRender
      "gfx.webrender.all" = true;
      "gfx.webrender.compositor" = true;
      "gfx.webrender.compositor.force-enabled" = true;

      # Hardware acceleration (Force Enable for Linux)
      "media.hardware-video-decoding.enabled" = true;
      "media.ffmpeg.vaapi.enabled" = true;

      # Network
      "network.http.pacing.requests.enabled" = false;
      "network.ssl_tokens_cache_capacity" = 10240;

      # Memory thing (Kenapa gak default ya, weird)
      "browser.tabs.unloadOnLowMemory" = true;
      "browser.low_commit_space_threshold_mb" = 2640; # 4 GB
      "browser.tabs.min_inactive_duration_before_unload" = 120000; # 2 minutes

      # Peskyfox

      "browser.tabs.hoverPreview.enabled" = true;

      # skipped Smoothfox, I like default for now.

      # Other

      # Weather
      "browser.newtabpage.activity-stream.showWeather" = true;
      "browser.newtabpage.activity-stream.system.showWeather" = true;
    };
  };

  # Enable common `podman` container config files in `/etc/containers`
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      package = pkgs-stable.podman;

      # Create a `docker` alias for `podman`, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under `podman-compose` to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  xdg.portal = {
    # * IT'S NOT ACTUALLY AUTO-ENABLED BY ENABLING KDE..
    # * and it's actually Flatpak's thing, ~~gak ada lagi yang make~~.. (I should've known.)
    # * native `firefox` pake loh, ternyata.
    enable = true;
    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde # * tuh tapi, `kdePackages`, weird,
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # skipped `security.polkit` terus sama `systemd` servicenya, again, soalnya ada KDE.

  # To enable support for Bluetooth devices
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Compatibility for binaries designed for normal Linux OS (FHS)
  # https://github.com/bal-sm/repo-for-learning/blob/4c47753b292678437a6a65ff723361d39a853c5c/systems/Linux/NixOS/_tidbits/binaries_for_normal_linux_incompatibility.md
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [
    pkgs.stdenv.cc.cc.lib # `libstdc++.so.6` for `pgadmin4`
  ];

  system.stateVersion = "23.11";

}
