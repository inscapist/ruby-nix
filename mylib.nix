{ writeShellScriptBin, ... }:
{
  shell = cmd: path:
    writeShellScriptBin cmd
      (builtins.readFile path);

  applyConfig = config: attrs:
    (if config ? ${attrs.gemName}
    then attrs // config.${attrs.gemName} attrs
    else attrs);
}
