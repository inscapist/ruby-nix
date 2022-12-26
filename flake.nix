{
  description = "Nix function(s) for creating ruby environments";

  inputs = {
    # a fork that supports platform dependant gem
    bundix.url = "github:sagittaros/bundix";
    bundix.flake = false;
  };

  outputs = { self, bundix }: rec {
    lib = import ./. bundix;

    templates = {
      simple-app = {
        path = ./examples/simple-app;
        description = "A flake that drives a simple ruby app";
      };
    };
    templates.default = self.templates.simple-app;

    # XXX impure dev shell
    devShells.x86_64-linux.default =
      import ./shell.nix { inherit bundix; };
  };
}
