default: rebuild

rebuild:
  sudo nixos-rebuild switch --flake .#

ls:
  nixos-rebuild list-generations

rollback:
  sudo nixos-rebuild switch --rollback
