{ config, pkgs, inputs, ...}:
{
  imports = [];
 
  home.username = "koralle";
  home.homeDirectory = "/home/koralle";
  home.stateVersion = "25.05";

  home.file.${config.xdg.configHome} = {
    source = ./.config;
    recursive = true;
  };

  home.packages = with pkgs; [
    fish
    
    # https://mise.jdx.dev
    mise

    # https://starship.rs
    starship

    # https://github.com/BurntSushi/ripgrep
    ripgrep

    # https://github.com/phiresky/ripgrep-all
    ripgrep-all

    # https://github.com/sharkdp/bat
    bat
  ];

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };
}
