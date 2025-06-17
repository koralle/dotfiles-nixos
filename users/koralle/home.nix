{ config, pkgs, ...}:
{
  imports = [];
 
  home.username = "koralle";
  home.homeDirectory = "/home/koralle";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [];
}
