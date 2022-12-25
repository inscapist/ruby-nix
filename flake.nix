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
    # in the app directory, run:
    #   nix flake init -t github:sagittaros/ruby-nix
    templates.default = self.templates.simple-app;
  };
}
