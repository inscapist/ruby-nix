{ writeShellScriptBin, substituteAll, ... }: {
  shell = cmd: path: vars:
    let
      file = substituteAll ({ src = path; } // vars);
      content = (builtins.readFile file);
    in writeShellScriptBin cmd content;

  applyConfig = config: attrs:
    (if config ? ${attrs.gemName} then
      attrs // config.${attrs.gemName} attrs
    else
      attrs);
}
