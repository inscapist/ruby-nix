{
  ast = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "04nc8x27hlzlrr5c2gn7mar4vdr0apw5xg22wp6m8dx3wqr04a0y";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "2.4.2";
  };
  debug = {
    dependencies = [
      "irb"
      "reline"
    ];
    groups = [
      "development"
      "test"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1hkzdyh2l4rb1f8l1pvxmcbivkl71lgzm44834z87r93drpnxg6r";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.7.1";
  };
  io-console = {
    groups = [
      "default"
      "development"
      "test"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0dikardh14c72gd9ypwh8dim41wvqmzfzf35mincaj5yals9m7ff";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "0.6.0";
  };
  irb = {
    dependencies = [ "reline" ];
    groups = [
      "default"
      "development"
      "test"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "10qvm0s8784lhmz98blqnxh36i7d7rzkk17znx17d46666z7czrf";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.6.2";
  };
  json = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0nalhin1gda4v8ybk6lq8f407cgfrj6qzn234yra4ipkmlbfmal6";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "2.6.3";
  };
  parallel = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "07vnk6bb54k4yc06xnwck7php50l09vvlw1ga8wdz0pia461zpzb";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.22.1";
  };
  parser = {
    dependencies = [ "ast" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0zk8mdyr0322r11d63rcp5jhz4lakxilhvyvdv0ql5dw4lb83623";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "3.2.0.0";
  };
  rainbow = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0smwg4mii0fm38pyb5fddbmrdpifwv22zv3d3px2xx497am93503";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "3.1.1";
  };
  regexp_parser = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0rj7xcg7bkfw6y0h4wg8y3s4nmks9qrzdxag4zaw41xjqfanlysf";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "2.6.1";
  };
  reline = {
    dependencies = [ "io-console" ];
    groups = [
      "default"
      "development"
      "test"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1vpsmij5mknpiqy4b835rzl87slshm5dkr08hm8wypfya3v4m6cp";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "0.3.2";
  };
  rexml = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "08ximcyfjy94pm1rhcx04ny1vx2sk0x4y185gzn86yfsbzwkng53";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "3.2.5";
  };
  rubocop = {
    dependencies = [
      "json"
      "parallel"
      "parser"
      "rainbow"
      "regexp_parser"
      "rexml"
      "rubocop-ast"
      "ruby-progressbar"
      "unicode-display_width"
    ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1imdfx3mx2p1k7bhc5qm35zvqw12hyz52yy2k9xj3dwrdpzjg0fh";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.43.0";
  };
  rubocop-ast = {
    dependencies = [ "parser" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1pdzabz95hv3z5sfbkfqa8bdybsfl13gv7rjb32v3ss8klq99lbd";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.24.1";
  };
  ruby-progressbar = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "02nmaw7yx9kl7rbaan5pl8x5nn0y4j5954mzrkzi9i3dhsrps4nc";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.11.0";
  };
  unicode-display_width = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1gi82k102q7bkmfi7ggn9ciypn897ylln1jk9q67kjhr39fj043a";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "2.4.2";
  };
}
