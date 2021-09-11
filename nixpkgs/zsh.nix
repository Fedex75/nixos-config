{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;

    shellAliases = {
      ls = "ls --color=auto";
      nixos-edit = "sudo nano /etc/nixos/configuration.nix";
    };

    initExtra = ''
      bindkey '^ ' autosuggest-accept
      bindkey  "^[[H"   beginning-of-line
      bindkey  "^[[F"   end-of-line
      bindkey  "^[[3~"  delete-char
      zstyle ':completion:*' matcher-list ''\'' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    '';

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
         name = "powerlevel10k-config";
         src = lib.cleanSource ./p10k-config;
         file = "p10k.zsh";
      }
    ];
  };
}
