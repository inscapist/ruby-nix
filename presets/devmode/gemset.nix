{
  ast = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04nc8x27hlzlrr5c2gn7mar4vdr0apw5xg22wp6m8dx3wqr04a0y";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.4.2";
  };
  debug = {
    dependencies = ["irb" "reline"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hkzdyh2l4rb1f8l1pvxmcbivkl71lgzm44834z87r93drpnxg6r";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.7.1";
  };
  diff-lcs = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rwvjahnp7cpmracd8x732rjgnilqv2sx7d1gfrysslc3h039fa9";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.5.0";
  };
  io-console = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0dikardh14c72gd9ypwh8dim41wvqmzfzf35mincaj5yals9m7ff";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.6.0";
  };
  irb = {
    dependencies = ["reline"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10qvm0s8784lhmz98blqnxh36i7d7rzkk17znx17d46666z7czrf";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.6.2";
  };
  netrc = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gzfmcywp1da8nzfqsql2zqi648mfnx6qwkig3cv36n9m0yy676y";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.11.0";
  };
  parallel = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "07vnk6bb54k4yc06xnwck7php50l09vvlw1ga8wdz0pia461zpzb";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.22.1";
  };
  parser = {
    dependencies = ["ast"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0zk8mdyr0322r11d63rcp5jhz4lakxilhvyvdv0ql5dw4lb83623";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.2.0.0";
  };
  rbi = {
    dependencies = ["ast" "parser" "sorbet-runtime" "unparser"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jiz3hd9vqb004vvj0s0dyhxd10lnh2hzhmnkh9ls4y64ki2j10x";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.0.16";
  };
  reline = {
    dependencies = ["io-console"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vpsmij5mknpiqy4b835rzl87slshm5dkr08hm8wypfya3v4m6cp";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.3.2";
  };
  sorbet = {
    dependencies = ["sorbet-static"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1p74rp6p40rpq24wb10ynm8d9mpclnl5k6gi84x1332m1la7g2z0";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.5.10625";
  };
  sorbet-runtime = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06y3w1rd363fhj9r2jhzsmw8sp09wbw55cr87qw63cwjjxc88276";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.5.10625";
  };
  sorbet-static = {
    groups = ["default" "development"];
    platforms = [];
    source = null;
    targets = [{
      remotes = ["https://rubygems.org"];
      sha256 = "09ydy0xfmj6vwanm779j4j93ssh2x4h926fb38qpsp5avzicdfml";
      target = "universal-darwin-20";
      targetCPU = "universal";
      targetOS = "darwin";
      type = "gem";
    } {
      remotes = ["https://rubygems.org"];
      sha256 = "0azrd6xzn443bryp68dryx7ghmm95rx926f7jhdcyqwpws81rszg";
      target = "x86_64-linux";
      targetCPU = "x86_64";
      targetOS = "linux";
      type = "gem";
    } {
      remotes = ["https://rubygems.org"];
      sha256 = "1c9j5ilcsv6rzqhj31g5b6j4dk0c4c78p52kpcr0k0j6l4h1mnfq";
      target = "universal-darwin-21";
      targetCPU = "universal";
      targetOS = "darwin";
      type = "gem";
    }];
    version = "0.5.10625";
  };
  sorbet-static-and-runtime = {
    dependencies = ["sorbet" "sorbet-runtime"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cwcdnkhywz1q4w63p4kpvdinqw0h7l3iickhf1ixs47c54crg62";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.5.10625";
  };
  spoom = {
    dependencies = ["sorbet" "sorbet-runtime" "thor"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gh5hl2dpmdsh90p515dm60rxawh5y9jv3fry6dsgdizikrcq8pd";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.1.15";
  };
  tapioca = {
    dependencies = ["netrc" "parallel" "rbi" "sorbet-static-and-runtime" "spoom" "thor" "yard-sorbet"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qrrsw2vp2mglaf3974vw9znpqmic71681hakcg0f4x6a7qzl29w";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.10.5";
  };
  thor = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0inl77jh4ia03jw3iqm5ipr76ghal3hyjrd6r8zqsswwvi9j2xdi";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.2.1";
  };
  unparser = {
    dependencies = ["diff-lcs" "parser"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1j6ym6cn43ry4lvcal7cv0n9g9awny7kcrn1crp7cwx2vwzffhmf";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.6.7";
  };
  webrick = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1d4cvgmxhfczxiq5fr534lmizkhigd15bsx5719r5ds7k7ivisc7";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.7.0";
  };
  yard = {
    dependencies = ["webrick"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0p1if8g9ww6hlpfkphqv3y1z0rbqnnrvb38c5qhnala0f8qpw6yk";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.9.28";
  };
  yard-sorbet = {
    dependencies = ["sorbet-runtime" "yard"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0idmxrlpbja9b4gnrn6iipw2kiw6jkx6bhqd1zc93w210mraznpa";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.7.0";
  };
}