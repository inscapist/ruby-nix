# Nix installation

Once you have Nix [installed](https://nixos.org/download.html), we need to enable some beta features to allow commands such as `nix develop` and `nix flake`.

```sh
mkdir -p ~/.config/nix
[ ! -f ~/.config/nix/nix.conf ] && echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
```
