{
  description = "Nix function(s) for creating ruby environments";

  inputs = {
    # a fork that supports platform dependant gem
    bundix.url = "github:sagittaros/bundix";
    bundix.flake = false;
  };

  outputs = { self, bundix }: rec {
    lib = import ./. bundix;
    overlays.ruby = import ./modules/overlays/ruby-overlay.nix;

    templates = {
      simple-app = {
        path = ./examples/simple-app;
        description = "A flake that drives a simple ruby app";
      };
      docker-app = {
        path = ./examples/docker-app;
        description = "A flake that builds docker image";
      };
    };
    templates.default = self.templates.simple-app;

    # XXX impure dev shell, too lazy to configure flake-compat for bundix
    devShells.x86_64-linux.default = import ./shell.nix { inherit bundix; };
  };
}
