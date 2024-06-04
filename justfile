default: show

show:
  nix flake show

b:
  sudo nixos-rebuild switch --flake .#

ls:
  nixos-rebuild list-generations

rollback:
  sudo nixos-rebuild switch --rollback

update:
  nix flake update
