{ config, pkgs, ... }:

{
  imports = [ ./zsh.nix ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "captain_n3mo";
  home.homeDirectory = "/home/captain_n3mo";

  home.packages = with pkgs; [
    ttyplot
    spotify
    discord
    tdesktop
    gnome3.gnome-tweaks
    vscode
    tor-browser-bundle-bin
    transmission-gtk
    gimp
    zoom-us
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
