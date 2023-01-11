{ writeShellScriptBin, substituteAll, count, ... }: {

  # create a binary in /bin
  shell = cmd: path: vars:
    let
      file = substituteAll ({ src = path; } // vars);
      content = (builtins.readFile file);
    in writeShellScriptBin cmd content;

  # `config` is a set of functions with the same keys as `attrs`
  # This is a useful pattern to modify a set
  applyConfig = config: key: attrs:
    let f = builtins.getAttr key config;
    in if config ? key then attrs // f attrs else attrs;

  # check if list is empty
  listEmpty = list: count (_: true) list == 0;
}
