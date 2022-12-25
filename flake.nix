{
  description = "Nix function(s) for creating ruby environments";

  outputs = { self }: {
    lib = import ./.;
  };
}
