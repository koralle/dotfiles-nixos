switch:
  nixos-rebuild switch --flake .#koralle

tailscale-up:
  tailscale up --advertise-exit-node

