switch:
  sudo nixos-rebuild switch --flake .#koralle

tailscale-up:
  sudo tailscale up --advertise-exit-node

