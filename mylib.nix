{
  applyConfig = config: attrs:
    (if config ? ${attrs.gemName}
    then attrs // config.${attrs.gemName} attrs
    else attrs);
}
