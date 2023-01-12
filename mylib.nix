{ writeShellScriptBin, substituteAll, lib, ... }: {

  # create a binary in /bin
  shell = cmd: path: vars:
    let
      file = substituteAll ({ src = path; } // vars);
      content = (builtins.readFile file);
    in writeShellScriptBin cmd content;

}
