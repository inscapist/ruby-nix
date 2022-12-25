{
  description = "Nix function(s) for creating ruby environments";

  outputs = { self }: {
    lib = import ./.;
    templates = {
      # nix flake init -t sagittaros/ruby-nix#simple-app
      simple-app = {
        path = ./examples/simple-app;
        description = "A flake that drives a simple ruby app";
      };
    };
    # nix flake init -t sagittaros/ruby-nix
    templates.default = self.templates.simple-app;
  };
}
