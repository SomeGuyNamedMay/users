{config, lib, pkgs, ...}:
{

  programs.qutebrowser = {
    enable = true;
    settings = { scrolling.smooth = true; };
  };

  programs.chromium.enable = true;

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
    profiles = {
      mason = {
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "https://github.com/SomeGuyNamedMy/";
          "browser.tabs.tabmanager.enabled" = false;
          # privacy stuff
          "privacy.donottrackheader.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "privacy.partition.network_state.ocsp_cache" = true;
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.ping-centre.telemetry" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          # As well as Firefox 'experiments'
          "experiments.activeExperiment" = false;
          "experiments.enabled" = false;
          "experiments.supported" = false;
          "network.allow-experiments" = false;

          # Disable Pocket Integration
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
          "extensions.pocket.enabled" = false;
          "extensions.pocket.api" = "";
          "extensions.pocket.oAuthConsumerKey" = "";
          "extensions.pocket.showHome" = false;
          "extensions.pocket.site" = "";

          #enable theming
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "layers.acceleration.force-enabled" = true;
          "gfx.webrender.all" = true;
          "gfx.webrender.enabled" = true;
          "layout.css.backdrop-filter.enabled" = true;
          "svg.context-properties.content.enabled" = true;
        };
        extensions = with config.nur.repos.rycee.firefox-addons; [
          ublock-origin
          sponsorblock
          stylus
          tree-style-tab
          vimium
        ];
        userChrome = ''
          #TabsToolbar {
            visibility: collapse;
          }
        '';
      };
    };
  };
}
