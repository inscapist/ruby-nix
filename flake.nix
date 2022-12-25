{
  description = "Nix function(s) for creating ruby environments";

  outputs = { self }: {
    lib = import ./.;
    templates = {
      simple-app = {
        path = ./examples/simple-app;
        description = "A flake that drives a simple ruby app";
      };
    };
    templates.default = self.templates.simple-app;
  };
}
